//
//  VehiclesViewController.m
//  FreteList
//
//  Created by Joao Paulo Galvao Alves on 1/17/15.
//  Copyright (c) 2015 FreteList. All rights reserved.
//

#import "InitialViewController.h"
#import "VehicleTypeSignUpTableViewController.h"
#import "CategoriesCell.h"

@interface VehicleTypeSignUpTableViewController ()

@end

@implementation VehicleTypeSignUpTableViewController

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
        
        self.categoriesSelected = [[NSMutableArray alloc]init];
        
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
    
    // Create a query
    PFQuery *categoriesQuery = [PFQuery queryWithClassName:self.parseClassName];
    
    
    //Order it
    [categoriesQuery orderByAscending:@"categories"];
    
    return categoriesQuery;
}

#pragma mark - PFQueryTableViewController delegate

-(PFTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object{
    
    //Identify the cell
    static NSString *simpleTableIdentifier = @"CategoriesCell";
    
    //Create a cell object
    CategoriesCell *categoriesCell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (categoriesCell == nil) {
        categoriesCell = [[CategoriesCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    CategoriesCell *label = [[CategoriesCell alloc]init];
    
    //Fetch the lable object string
    label.categoriesLabel = (UILabel*)[categoriesCell viewWithTag:200];
    label.categoriesLabel.text = [object objectForKey:@"categories"];
    
    return categoriesCell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PFObject *categorySelected = [self.objects objectAtIndex:indexPath.row];
    
    //Create a cell object
    CategoriesCell *categoriesCell =(CategoriesCell*)[tableView cellForRowAtIndexPath:indexPath];

    // Compare the array with which object was clicked(categorySelected)
    if ([self.categoriesSelected containsObject:categorySelected]) {
        
        categoriesCell.accessoryType = UITableViewCellAccessoryNone;
        [self.categoriesSelected removeObject:categorySelected];
        
    } else {
        
        categoriesCell.accessoryType = UITableViewCellAccessoryCheckmark;
        
        [self.categoriesSelected addObject:categorySelected];
    }
    
    

    
    
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
    
    
    for (PFObject *obj in self.categoriesSelected) {
        [self.freightUser addObject:obj forKey:@"vehicleType"];
    }
    
    //self.freightUser[@"vehicleType"] = self.categoriesSelected;
    
    [self.freightUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            // Show Alert for success
            UIAlertView* successAlertView = [[UIAlertView alloc]
                                             initWithTitle:@"Sucesso"
                                             message:@"Verifique o seu e-mail e confirme o seu cadastro!"
                                             delegate:nil
                                             cancelButtonTitle:@"Ok"
                                             otherButtonTitles:nil, nil];
            
            [successAlertView show];
            
            //Present the LoginViewController
            InitialViewController *vehicleTypeCheck = (InitialViewController*)[self.storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
            
            
            [self presentViewController:vehicleTypeCheck animated:YES completion:nil];



        } else {
            
            // Show Alert for success
            UIAlertView* successAlertView = [[UIAlertView alloc]
                                             initWithTitle:@"Error"
                                             message:@"user-info"
                                             delegate:nil
                                             cancelButtonTitle:@"Ok"
                                             otherButtonTitles:nil, nil];
            
            [successAlertView show];

            
        }
    }];
    
    
    
    
}
@end



































