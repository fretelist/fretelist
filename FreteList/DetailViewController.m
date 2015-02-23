//
//  DetailViewController.m
//  tenhoDesconto
//
//  Created by Joao Paulo Galvao Alves on 11/22/14.
//  Copyright (c) 2014 tenhoDesconto. All rights reserved.
//

#import "DetailViewController.h"
#import "FreightDetailCustomCell.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

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
        
    }
    return self;
}

#pragma mark - PFQueryTableViewController delegates

-(PFQuery *)queryForTable{
    
    //Creates a relation based on a clicked cell at CategoryViewController and what the Relation is pointing at on Parse
//    PFRelation *detailsRelation = [self.clickedDealDetail relationForKey:@"detailRelation"];
    
    PFQuery *clickedFreightQuery = [[PFQuery alloc]initWithClassName:self.parseClassName];
    
    [clickedFreightQuery whereKey:@"objectId" equalTo:self.clickedFreightDetail];


//    if (self.clickedFreightDetail) {
//        
//        [self.clickedFreightDetail objectForKey:@"name"];
//        [self.clickedFreightDetail objectForKey:@"freightDescription"];
//        
//    }

 
    //    return [detailsRelation query];
    
    return clickedFreightQuery;
    
    
}



-(PFTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object{
    
    static NSString *simpleTableIdentifier = @"FreightDetailCell";
    
    
    FreightDetailCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[FreightDetailCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
        
    //Freights Information
    cell.labelName.text = [self.clickedFreightDetail objectForKey:@"name"];
    cell.labelDescription.text = [object objectForKey:@"freightDescription"];
    cell.labelCity.text = [object objectForKey:@"city"];
    cell.labelState.text = [object objectForKey:@"state"];
    cell.txtViewTelephone.text = [object objectForKey:@"telephone"];
    cell.labelCompanyType.text = [object objectForKey:@"companyType"];
    
    
    //Vehicle Types
    NSArray *arrayOfTypes = [object objectForKey:@"vehicleType"];
    
    cell.labelCompanyType.text = [[arrayOfTypes valueForKey:@"categories"] componentsJoinedByString:@","];
    
    //Freights Photos
    PFFile *thumbnail = [object objectForKey:@"userPhoto"];
    cell.imgUserPhoto.image = [UIImage imageNamed:@"promotion_logo_placeholder.png"];
    cell.imgUserPhoto.file = thumbnail;
    [cell.imgUserPhoto loadInBackground];
    
    NSLog(@"%@",[object objectForKey:@"vehicleType"]);
    
    return cell;
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
























