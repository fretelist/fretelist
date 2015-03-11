//
//  DealsListViewController.m
//  tenhoDesconto
//
//  Created by Joao Paulo Galvao Alves on 11/20/14.
//  Copyright (c) 2014 tenhoDesconto. All rights reserved.
//

#import "FreightListViewController.h"
#import "DetailViewController.h"
#import "FreightCustomCell.h"
#import "VehicleTypeFilterViewController.h"
#import "CompanyTypeFilterViewController.h"
#import "CityTypeFilterTableViewController.h"
#import "FlurryAdInterstitial.h"
#import "FlurryAds.h"
#import "Flurry.h"
#import "FlurryAdInterstitialDelegate.h"

@interface FreightListViewController ()

@property(nonatomic, strong) UIView *currentHowToView;
//@property (nonatomic, strong)FlurryAdInterstitial* adInterstitial;

@end

//NSString *adSpaceName = @"FreteList";

@implementation FreightListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    BOOL isFirstTimeLoad = [defaults boolForKey:@"isFirstTimeLoad"];
    if (isFirstTimeLoad == NO){
        
        //Handle the view Tutorial
        UIViewController *howToController = [self.storyboard instantiateViewControllerWithIdentifier:@"howToTimeline"];
        self.currentHowToView = howToController.view;
        
        UIButton *closeButton = (UIButton*)[self.currentHowToView viewWithTag:2];
        
        [closeButton addTarget:self action:@selector(btnClosePress:) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *nextButton = (UIButton*)[self.currentHowToView viewWithTag:1];
        
        [nextButton addTarget:self action:@selector(btnNextPress:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:self.currentHowToView];
        
        //show the tutorial
        [defaults setBool:YES forKey:@"isFirstTimeLoad"];
        [defaults synchronize];
    }
    
//    UIBUtton nextButton = (UIButton *)[howToController.view viewForTag:1];
//    [nextButton addTarget: @selector()]
    
    //Set View Collors
//    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"navigationLogo"]];

//    self.navigationController.navigationBar.barTintColor = [UIColor colorWithHue:354.0 saturation:90.0 brightness:89.0 alpha:1.0];
    //self.tabBarController.tabBar.tintColor = [UIColor whiteColor];
//    [self.tabBarController.tabBar setBarTintColor:[UIColor colorWithHue:354.0 saturation:90.0 brightness:89.0 alpha:1.0]];
    
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    
    
    // Do any additional setup after loading the view.
    PFQuery *queryPaidOffer = [PFQuery queryWithClassName:@"Paid_Offers"];
    NSLog(@"query: %@",queryPaidOffer);
    
    [queryPaidOffer findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        
        if (!error) {
            
            for (PFObject *object in objects) {
                
                NSLog(@"%@",objects);
                
                //Offer Photo
                PFFile *thumbnail = object[@"paidOfferPhoto"];
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
            
            //PFObject *paidOfferObject = [PFObject objectWithClassName:@"Paid_Offers"];
            

            
            
           
        }
        
        
    }];
    
    
//    self.tableView.estimatedRowHeight = 150.0;
//    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
}

-(void)viewDidAppear:(BOOL)animated{
    
    
    
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
    self.clickedFreight = [self objectAtIndexPath:indexPath];
    [self performSegueWithIdentifier:@"detail" sender:self];
    
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"detail"]) {
        DetailViewController *destinationDetail = segue.destinationViewController;
        destinationDetail.clickedFreightDetail = self.clickedFreight;
    }
}

#pragma mark - Actions



- (IBAction)showFilter:(id)sender {
    
    
    UIActionSheet *filterOptions = [[UIActionSheet alloc]initWithTitle:@"Filtro"
                                                            delegate:self
                                                    cancelButtonTitle:@"Fechar"
                                                destructiveButtonTitle:@"Limpar Filtros"
                                                    otherButtonTitles:@"Filtrar por Tipo de Veículo",@"Filtrar por Tipo de Frete",@"Filtrar por Cidade", nil];
    
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

#pragma mark - HowToFunctions
-(void)btnClosePress:(id)sender{
    
    [self.currentHowToView removeFromSuperview];
    
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    BOOL isFirstTimeLoad = [defaults boolForKey:@"isFirstTimeLoad"];
//    if (isFirstTimeLoad == NO){
        // Fetch interstitial ads early when a later display is likely. For
        // example, at the beginning of a level.
//        self.adInterstitial = [[FlurryAdInterstitial alloc] initWithSpace:adSpaceName] ;
//        self.adInterstitial.adDelegate = self;
//        [self.adInterstitial fetchAd];
    
        //show the Ad
//        [defaults setBool:YES forKey:@"isFirstTimeLoad"];
//        [defaults synchronize];
//    }
    
    // Check if ad is ready. If so, display the ad
//    if ([self.adInterstitial ready]) {
//        [self.adInterstitial presentWithViewController:self];
//    } else {
//        self.adInterstitial = [[FlurryAdInterstitial alloc] initWithSpace:@"FreteList"];
//        [self.adInterstitial fetchAd];
//    }
//    
//    [Flurry setDebugLogEnabled:YES];
//    
//    [FlurryAds setAdDelegate:self];
    
    //set this on to see if test ads appear, make sure to turn it off once the test ads appear
    //[FlurryAds enableTestAds:YES];
    
}

-(void)btnNextPress:(id)sender{
    
    [self.currentHowToView removeFromSuperview];
    
    UIViewController *secondView = [self.storyboard instantiateViewControllerWithIdentifier:@"secondHowTo"];
    
    self.currentHowToView = secondView.view;
    
    UIButton *closeButton = (UIButton*)[self.currentHowToView viewWithTag:2];
    
    [closeButton addTarget:self action:@selector(btnClosePress:) forControlEvents:UIControlEventTouchUpInside];
    

    [self.view addSubview:self.currentHowToView];
    
}


/*
#pragma mark - Flurry callbacks
- (void)spaceDidReceiveAd:(NSString *)adSpace {
    NSLog(@"=========== Ad Space [%@] Did Receive Ad ================ ", adSpace);
    
}

- (void)spaceDidFailToReceiveAd:(NSString *)adSpace error:(NSError *)error {
    NSLog(@"=========== Ad Space [%@] Did Fail to Receive Ad with error [%@] ================ ", adSpace, error);
    
}
 */

@end


























