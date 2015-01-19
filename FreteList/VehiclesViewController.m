//
//  VehiclesViewController.m
//  FreteList
//
//  Created by Joao Paulo Galvao Alves on 1/17/15.
//  Copyright (c) 2015 FreteList. All rights reserved.
//

#import "VehiclesViewController.h"

@interface VehiclesViewController ()

@end

@implementation VehiclesViewController

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.hidden = NO;
    
    
    
}


#pragma mark - PFQuery

-(PFQuery *)queryForTable{
    
    PFQuery *categoriesQuery = [PFQuery queryWithClassName:self.parseClassName];
    
    [categoriesQuery orderByAscending:@"categories"];
    
    return categoriesQuery;
}

#pragma mark - PFQueryTableViewController delegate

-(PFTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object{
    
    static NSString *simpleTableIdentifier = @"CategoriesCell";
    
    PFTableViewCell *cateogriesCell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cateogriesCell == nil) {
        cateogriesCell = [[PFTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    UILabel* freightType = (UILabel*)[cateogriesCell viewWithTag:200];
    freightType.text = [object objectForKey:@"categories"];
    
    return cateogriesCell;
    
}

-(BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return YES;
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

- (IBAction)saveVehicleTypes:(id)sender {
    
    //Cast it to SignUpView Controller
    
    // ..do something here
    
    //Dismiss the viewController
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}
@end



































