//
//  DealsListViewController.m
//  tenhoDesconto
//
//  Created by Joao Paulo Galvao Alves on 11/20/14.
//  Copyright (c) 2014 tenhoDesconto. All rights reserved.
//

#import "FreightListViewController.h"
#import "DetailViewController.h"
#import "FilterViewController.h"
#import "FreightCustomCell.h"
#import "VehicleTypeFilterViewController.h"
#import "CompanyTypeFilterViewController.h"
#import "CityTypeFilterTableViewController.h"

@interface FreightListViewController ()

@end

@implementation FreightListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    PFQuery *queryPaidOffer = [PFQuery queryWithClassName:@"Paid_Offers"];
    NSLog(@"query: %@",queryPaidOffer);
    
    [queryPaidOffer findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        
        if (!error) {
            
            //PFObject *paidOfferObject = [PFObject objectWithClassName:@"Paid_Offers"];
            
            NSLog(@"%@",objects);
            
            //Offer Photo
            PFFile *thumbnail = [[queryPaidOffer getFirstObject] objectForKey:@"paidOfferPhoto"];
            NSLog(@"Thumbnail: %@",thumbnail);
            
            [thumbnail getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
                if (!error) {
                    //self.paidOfferImageView = [[PFImageView alloc]initWithImage:[UIImage imageWithData:data]];
//                    UIImage *paidOfferImage = [UIImage imageWithData:data];
                    NSLog(@"PaidOfferImageView: %@",self.paidOfferImageView);
                    self.paidOfferImageView.image = [UIImage imageNamed:@"promotion_logo_placeholder.png"];
                    self.paidOfferImageView.file = thumbnail;
                    
                    NSLog(@"Thumbnail: %@",self.paidOfferImageView);
                    
                    //[paidOfferImageView viewWithTag:200];
                    self.paidOfferView = self.paidOfferImageView;
                    [self.paidOfferImageView setImage:[UIImage imageNamed:@"promotion_logo_placeholder.png"]];
                    [self.paidOfferImageView loadInBackground];
                    
                }
            }];
            
           
        }
        
        
    }];
    
    
//    self.tableView.estimatedRowHeight = 150.0;
//    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    
        
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        
        // The className to query on
        self.parseClassName = @"_User";
        
        // The key of the PFObject to display in the label of the default cell style
        //self.textKey = @"Name";
        
        // Whether the built-in pull-to-refresh is enabled
        self.pullToRefreshEnabled = YES;
        
        // Whether the built-in pagination is enabled
        self.paginationEnabled = YES;
        
        //Initialize the array for categories I will filter
        self.featCategories = [[NSArray alloc]init];
        
        //Initialize the array for types I will filter
        self.featTypes = [[NSArray alloc]init];
        
        self.companyType = @"";
        
        self.cityType = @"";
    }
    return self;
}

#pragma mark - PFQueryTableViewController delegates

- (PFQuery *)queryForTable
{
    PFQuery *query = [PFQuery queryWithClassName:self.parseClassName];
    [query orderByAscending:@"name"];
    
    [query includeKey:@"vehicleType"];
    
    [query whereKey:@"freightUserType" equalTo:@"Prestador de Serv."];
    
    if (![self.companyType isEqualToString:@""]) {
        
        [query whereKey:@"companyType" equalTo:self.companyType];
    }
    
    if (![self.cityType isEqualToString:@""]) {
        [query whereKey:@"city" equalTo:self.cityType];
    }
    
    
    //Query all freights, but also query if the Array is greater than zero, which is related to the filter
    if ([self.featCategories count] > 0) {
        
        [query whereKey:@"vehicleType" containedIn:self.featCategories];
        
    }
    
    if ([self.featTypes count] > 0) {
        [query whereKey:@"freightType" containedIn:self.featTypes];
    }
    
    
    return query;
}

-(void)sendVehicleTypeFiltersToMainController:(NSArray *)arrayOfVehicleTypes{
    

    self.featCategories = [arrayOfVehicleTypes copy];

    [self loadObjects];
    
    [self.tableView reloadData];
    
    
    
}

-(void)sendCompanyTypeFiltersToMainController:(NSString *)companyTypes{
    
    self.companyType = companyTypes;
    
    [self loadObjects];
    
    [self.tableView reloadData];
}


-(void)sendCityTypeFiltersToMainController:(NSString *)cityTypes{
    
    self.cityType = cityTypes;
    
    [self loadObjects];
    
    [self.tableView reloadData];
    
    
}


-(void)sendTypesToMainController:(NSArray *)arrayOfTypes{
    self.featTypes = arrayOfTypes;
    [self loadObjects];
    [self.tableView reloadData];
}

-(PFTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object{
    
    static NSString *simpleTableIdentifier = @"DealsCell";
    
    FreightCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[FreightCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    //Freights Information
    cell.labelName.text = [object objectForKey:@"name"];
    cell.labelDescription.text = [object objectForKey:@"freightDescription"];
    cell.labelCity.text = [object objectForKey:@"city"];
    cell.labelState.text = [object objectForKey:@"state"];
//    cell.labelTelephone.text = [object objectForKey:@"telephone"];
    cell.txtViewTelephone.text = [object objectForKey:@"telephone"];
    cell.labelCompanyType.text = [object objectForKey:@"companyType"];
    
    
    //Vehicle Types
    NSArray *arrayOfTypes = [object objectForKey:@"vehicleType"];
    
    cell.labelType.text = [[arrayOfTypes valueForKey:@"categories"] componentsJoinedByString:@","];
//    cell.labelCity.numberOfLines = 6;
    
//    //NSString *stringOfTypes = [arrayOfTypes componentsJoinedByString:@""];
//    cell.labelType.text = [arrayOfTypes componentsJoinedByString:@""];
    
    //Freights Photos
    PFFile *thumbnail = [object objectForKey:@"userPhoto"];
    cell.imgUserPhoto.image = [UIImage imageNamed:@"promotion_logo_placeholder.png"];
    cell.imgUserPhoto.file = thumbnail;
    [cell.imgUserPhoto loadInBackground];
    
    NSLog(@"%@",[object objectForKey:@"vehicleType"]);
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // Recognizes touched Freight
    self.clickedDeal = [self objectAtIndexPath:indexPath];
    [self performSegueWithIdentifier:@"detail" sender:self];
    
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"detail"]) {
        DetailViewController *destinationDetail = segue.destinationViewController;
        destinationDetail.clickedDealDetail = self.clickedDeal;
    }
}

#pragma mark - Actions


- (IBAction)showFilter:(id)sender {
    
    
    UIActionSheet *filterOptions = [[UIActionSheet alloc]initWithTitle:@"Filtro"
                                                            delegate:self
                                                    cancelButtonTitle:@"Fechar"
                                                destructiveButtonTitle:@"Limpar Filtros"
                                                    otherButtonTitles:@"Filtrar por Tipo de Veículos",@"Filtrar por Tipo de Frete",@"Filtrar por Cidade", nil];
    
    [filterOptions showInView:self.view];
    
    
}

- (IBAction)showVehiclesInfo:(id)sender {
    
    UINavigationController *vehicleInfoView = (UINavigationController*)[self.storyboard instantiateViewControllerWithIdentifier:@"VehicleInfoNav"];
    
    [self presentViewController:vehicleInfoView animated:YES completion:nil];
    
}



-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    switch (buttonIndex) {
        case 0:{
            
            self.featCategories = [[NSArray alloc]init];
            self.companyType = @"";
            self.cityType = @"";
            
            [self loadObjects];
            [self.tableView reloadData];
            
            
            break;
        }
            
        case 1:{
            
            //Cast FilterViewController
            UINavigationController *navigationView = (UINavigationController*)[self.storyboard instantiateViewControllerWithIdentifier:@"VehicleTypeFilterNav" ];
            
            VehicleTypeFilterViewController *filterView = (VehicleTypeFilterViewController*)[navigationView.viewControllers objectAtIndex:0];
            
            
            //Init with an empty array, as I have not selected anything yet

            filterView.vehicleTypeFilter = [[NSMutableArray alloc] initWithArray:self.featCategories];
            filterView.delegate = self;
            
//            filterView.vehicleTypeFilter = [[NSMutableArray alloc] initWithArray:self.featTypes];
//            filterView.delegate = self;
            
            [self presentViewController:navigationView animated:YES completion:nil];
            
            
            break;
        }
            
        case 2:{
            
            //Cast FilterViewController
            UINavigationController *navigationView = (UINavigationController*)[self.storyboard instantiateViewControllerWithIdentifier:@"CompanyTypeFilterNav" ];
            
           CompanyTypeFilterViewController *filterView = (CompanyTypeFilterViewController*)[navigationView.viewControllers objectAtIndex:0];
            
            
            //Pass created Strings to the ones which will be selected
            
            filterView.companyTypeSelected = self.companyType;
            filterView.delegate = self;
            
            
            [self presentViewController:navigationView animated:YES completion:nil];

            
            break;
        }
        case 3:{
            
            //Cast FilterViewController
            UINavigationController *navigationView = (UINavigationController*)[self.storyboard instantiateViewControllerWithIdentifier:@"CityTypeFilterNav" ];
            CityTypeFilterTableViewController *filterView = (CityTypeFilterTableViewController*)[navigationView.viewControllers objectAtIndex:0];
            
            //Pass created Strings to the ones which will be selected
            filterView.cityTypeSelected = self.cityType;
            filterView.delegate = self;
            
            [self presentViewController:navigationView animated:YES completion:nil];
            
            break;
            
        }
        default:
            break;
    }
    
}




@end


























