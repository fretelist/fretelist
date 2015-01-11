//
//  DealsListViewController.m
//  tenhoDesconto
//
//  Created by Joao Paulo Galvao Alves on 11/20/14.
//  Copyright (c) 2014 tenhoDesconto. All rights reserved.
//

#import "DealsListViewController.h"
#import "DetailViewController.h"
#import "FilterViewController.h"

@interface DealsListViewController ()

@end

@implementation DealsListViewController

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
    
    
    
    
    
        
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        
        // The className to query on
        self.parseClassName = @"Freights";
        
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
    }
    return self;
}

#pragma mark - PFQueryTableViewController delegates

- (PFQuery *)queryForTable
{
    PFQuery *query = [PFQuery queryWithClassName:self.parseClassName];
    [query orderByAscending:@"freightName"];
    
    //Query all freights, but also query if the Array is greater than zero, which is related to the filter
    if ([self.featCategories count] > 0) {
        [query whereKey:@"categories" containedIn:self.featCategories];
        
    }
    
    if ([self.featTypes count] > 0) {
        [query whereKey:@"" containedIn:self.featTypes];
    }
    
    
    return query;
}


-(void) sendFeaturesToMainController:(NSArray *)arrayOfFeatures{
    
    self.featCategories = arrayOfFeatures;
    [self loadObjects];
    [self.tableView reloadData];
    
}

-(void)sendTypesToMainController:(NSArray *)arrayOfTypes{
    [self loadObjects];
    [self.tableView reloadData];
}

-(PFTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object{
    
    static NSString *simpleTableIdentifier = @"DealsCell";
    
    PFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[PFTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    //Offer Title
    //cell.textLabel.text = [object objectForKey:@"categories"];
    UILabel* title = (UILabel*)[cell viewWithTag:101];
    title.text = [object objectForKey:@"freightName"];
    //cell.textLabel.text = [object objectForKey:@"companyName"];
    
    //Offer Subtitle
    UILabel *subTitle = (UILabel*)[cell viewWithTag:102];
    subTitle.text = [object objectForKey:@"freightDescription"];
    
    //Offer Address
    UILabel* address = (UILabel*)[cell viewWithTag:103];
    address.text = [object objectForKey:@"freightTitle"];
    
    //Offer Area
    UILabel* companyArea = (UILabel*)[cell viewWithTag:104];
    companyArea.text = [object objectForKey:@"freightArea"];
    
    //Offer City
    UILabel* companyCity = (UILabel*)[cell viewWithTag:105];
    companyCity.text = [object objectForKey:@"freightCity"];
    
    //Offer State
    UILabel* companyState = (UILabel*)[cell viewWithTag:106];
    companyState.text = [object objectForKey:@"freightState"];
    
    //Offer Telephone
    UILabel* companyTelephone = (UILabel*)[cell viewWithTag:107];
    companyTelephone.text = [object objectForKey:@"freightTelephone1"];
    
    //Offer Opening Time
    UILabel* companyOpening = (UILabel*)[cell viewWithTag:108];
    companyOpening.text = [object objectForKey:@"freightOpening"];

    
    

    
    //Offer Photo
    PFFile *thumbnail = [object objectForKey:@"freightPhoto"];
    PFImageView *thumbnailImageView = (PFImageView*)[cell viewWithTag:100];
    thumbnailImageView.image = [UIImage imageNamed:@"promotion_logo_placeholder.png"];
    thumbnailImageView.file = thumbnail;
    [thumbnailImageView loadInBackground];
    //
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // Recognizes touched Deal
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
    
    //Cast FilterViewController
    FilterViewController *filterView = (FilterViewController*)[self.storyboard instantiateViewControllerWithIdentifier:@"filterView" ];
    
    //Init with an empty array, as I have not selected anything yet
    filterView.catArray = [[NSMutableArray alloc] initWithArray:self.featCategories];
    filterView.delegate = self;
    
    filterView.typesArray = [[NSMutableArray alloc] initWithArray:self.featTypes];
    filterView.delegate = self;
    
    [self presentViewController:filterView animated:YES completion:nil];
    
    
    
    
    
}
@end


























