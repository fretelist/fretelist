//
//  CompanyTypeFilterViewController.m
//  FreteList
//
//  Created by Joao Paulo Galvao Alves on 1/28/15.
//  Copyright (c) 2015 FreteList. All rights reserved.
//

#import "CompanyTypeFilterViewController.h"

@interface CompanyTypeFilterViewController ()

@end

@implementation CompanyTypeFilterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.companyTypes = [[NSArray alloc]initWithObjects:@"Private",@"Corporate", nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewController delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.companyTypes.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    //Identify the cell
    static NSString *simpleTableIdentifier = @"companyTypeCell";
    
    //Create a cell object
    UITableViewCell *companyTypesCell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (companyTypesCell == nil) {
        companyTypesCell = [[PFTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    
    NSString *companyType = [self.companyTypes objectAtIndex:indexPath.row];
    
    //Fetch the lable object string
    companyTypesCell.textLabel.text = companyType;
    
    
    if ([companyType isEqualToString:self.companyTypeSelected]){
        
        companyTypesCell.accessoryType = UITableViewCellAccessoryCheckmark;
        
    } else {
        
        companyTypesCell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return companyTypesCell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    self.companyTypeSelected = [self.companyTypes objectAtIndex:indexPath.row];
    
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

- (IBAction)closeCompanyTypeFilter:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)applyCompanyTypeFilter:(id)sender {
    
    [self.delegate sendCompanyTypeFiltersToMainController:self.companyTypeSelected];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end














