//
//  CityTypeFilterTableViewController.m
//  FreteList
//
//  Created by Joao Alves on 2/13/15.
//  Copyright (c) 2015 FreteList. All rights reserved.
//

#import "CityTypeFilterTableViewController.h"

@interface CityTypeFilterTableViewController ()

@end

@implementation CityTypeFilterTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.cityTypes = [[NSArray alloc]initWithObjects:@"Rio de Janeiro",@"São Paulo", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return self.cityTypes.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    //Identify the cell
    static NSString *simpleTableIdentifier = @"cityTypeCell";
    
    //Create a cell object
    UITableViewCell *cityTypesCell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cityTypesCell == nil) {
        cityTypesCell = [[PFTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    
    NSString *cityType = [self.cityTypes objectAtIndex:indexPath.row];
    
    //Fetch the lable object string
    cityTypesCell.textLabel.text = cityType;
    
    
    if ([cityType isEqualToString:self.cityTypeSelected]){
        
        cityTypesCell.accessoryType = UITableViewCellAccessoryCheckmark;
        
    } else {
        
        cityTypesCell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cityTypesCell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    self.cityTypeSelected = [self.cityTypes objectAtIndex:indexPath.row];
    
    [self.tableView reloadData];
    
    
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

- (IBAction)closeCityTypeFilter:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)applyCityTypeFilter:(id)sender {
    
    [self.delegate sendCityTypeFiltersToMainController:self.cityTypeSelected];
    
    [self.tableView reloadData];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
@end











