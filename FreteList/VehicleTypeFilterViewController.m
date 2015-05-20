//
//  VehicleTypeFilterViewController.m
//  FreteList
//
//  Created by Joao Paulo Galvao Alves on 1/22/15.
//  Copyright (c) 2015 FreteList. All rights reserved.
//


#import <Parse/Parse.h>
#import "VehicleTypeFilterViewController.h"

@interface VehicleTypeFilterViewController ()

@end

@implementation VehicleTypeFilterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"Vehicle type filter selected: %@",self.vehicleTypeFilter);
    // Do any additional setup after loading the view.
}

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
        
        //we should not init the filter type.
        //self.vehicleTypeFilter = [[NSMutableArray alloc]init];
        
    }
    
    return self;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - PFQuery

-(PFQuery *)queryForTable{
    
    // Create a query
    PFQuery *categoriesQuery = [PFQuery queryWithClassName:self.parseClassName];
    
    
    //Order it
    [categoriesQuery orderByAscending:@"categories"];
    
    return categoriesQuery;

    
    
}

-(PFTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object{
    
    //Identify the cell
    static NSString *simpleTableIdentifier = @"CategoriesCell";
    
    //Create a cell object
    PFTableViewCell *categoriesCell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (categoriesCell == nil) {
        categoriesCell = [[PFTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    //Fetch the lable object string
    categoriesCell.textLabel.text = [object objectForKey:@"categories"];
    

    if ([self array:self.vehicleTypeFilter containsPFObjectById:object]){
        
        categoriesCell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    }
    
    return categoriesCell;
    
}

- (BOOL) array:(NSArray *)array containsPFObjectById:(PFObject *)object
{
    //Check if the object's objectId matches the objectId of any member of the array.
    for (PFObject *arrayObject in array){
        if ([[arrayObject objectId] isEqual:[object objectId]]) {
            return YES;
        }
    }
    return NO;
}

- (int) array:(NSArray *)array indexForObject:(PFObject *)object
{
    int index = 0;
    for (int i = 0; i<array.count; i++) {
        if([[array[i] objectId] isEqual:[object objectId]]){
            index = i;
        }
    }
    return index;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PFObject *categorySelected = [self.objects objectAtIndex:indexPath.row];
    
    //Create a cell object
    PFTableViewCell *categoriesCell =(PFTableViewCell*)[tableView cellForRowAtIndexPath:indexPath];
    
    
    if ([self array:self.vehicleTypeFilter containsPFObjectById:categorySelected]){
        
        categoriesCell.accessoryType = UITableViewCellAccessoryNone;
        int index = [self array:self.vehicleTypeFilter indexForObject:categorySelected];
        [self.vehicleTypeFilter removeObjectAtIndex:index];
        
    } else {
        
        categoriesCell.accessoryType = UITableViewCellAccessoryCheckmark;
        
        [self.vehicleTypeFilter addObject:categorySelected];
    }
    
    
    
    
    
}

#pragma mark - My Actions

- (IBAction)closeVehicleType:(id)sender {
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)applyVehicleType:(id)sender {
    
    //[self.delegate sendFeaturesToMainController:[NSArray arrayWithArray:self.catArray]];
    
    [self.delegate sendVehicleTypeFiltersToMainController:self.vehicleTypeFilter];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}




















@end
