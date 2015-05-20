//
//  VehicleInfoTableViewController.m
//  FreteList
//
//  Created by Joao Alves on 2/12/15.
//  Copyright (c) 2015 FreteList. All rights reserved.
//

#import <ParseUI/ParseUI.h>
#import <Parse/Parse.h>
#import "VehicleInfoTableViewController.h"
#import "VehicleInfoCustomCell.h"

@interface VehicleInfoTableViewController ()

@end

@implementation VehicleInfoTableViewController


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithHue:354.0 saturation:90.0 brightness:89.0 alpha:1.0];
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    [self.btnCancel setTintColor:[UIColor whiteColor]];
}


-(id)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        
        // The className to query on
        self.parseClassName = @"Categories";
        
        // The key of the PFObject to display in the label of the default cell style
        //self.textKey = @"name";
        
        // Whether the built-in pull-to-refresh is enabled
        self.pullToRefreshEnabled = YES;
        
        // Whether the built-in pagination is enabled
        self.paginationEnabled = YES;
        
        
    }
    
    return self;
}


#pragma mark - PFQuery

-(PFQuery *)queryForTable{
    
    // Create a query
    PFQuery *categoriesQuery = [PFQuery queryWithClassName:self.parseClassName];
    
    
    //Order it
    [categoriesQuery orderByAscending:@"categories"];
    
    return categoriesQuery;
}


#pragma mark - PFQueryTableViewController delegate

-(PFTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object{
    
    //Identify the cell
    static NSString *simpleTableIdentifier = @"VehiclesInfoCell";
    
    //Create a cell object
    VehicleInfoCustomCell *infoCell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (infoCell == nil) {
        infoCell = [[VehicleInfoCustomCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    //Fetch the lable object string
    infoCell.vehicleInfoTitle.text = [object objectForKey:@"categories"];
    infoCell.vehicleInfoDescription.text = [object objectForKey:@"categoryDescription"];
    
//    //Freights Photos
//    PFFile *thumbnail = [object objectForKey:@"categoryPhoto"];
//    infoCell.imgViewVehicleInfo.image = [UIImage imageNamed:@"promotion_logo_placeholder.png"];
//    infoCell.imgViewVehicleInfo.file = thumbnail;
//    [infoCell.imgViewVehicleInfo loadInBackground];
    
    return infoCell;
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - My Actions

- (IBAction)closeInfo:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
@end
