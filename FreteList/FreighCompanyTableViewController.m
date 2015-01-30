//
//  FreighCompanyTableViewController.m
//  FreteList
//
//  Created by Joao Paulo Galvao Alves on 1/30/15.
//  Copyright (c) 2015 FreteList. All rights reserved.
//

#import "FreighCompanyTableViewController.h"
#import "VehiclesViewController.h"
#import <Parse/Parse.h>

@interface FreighCompanyTableViewController ()

@end

@implementation FreighCompanyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)cancelSignUp:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)chooseVehicleType:(id)sender {
    
    
    PFUser *user = [self setUpFreightUser:sender];
    
    // Show an alert for success or error - Write user Keys to Parse
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            
            
                           // else is a freight company, send to select a vehicle type
                
                //Instantiate the navigation
                UINavigationController *vehicleTypeCheck = (UINavigationController*)[self.storyboard instantiateViewControllerWithIdentifier:@"VehicleTypeController"];
                
                // Check the vehicle type for the specific user
                VehiclesViewController *vehicleType = (VehiclesViewController*)[vehicleTypeCheck.viewControllers objectAtIndex:0];
                vehicleType .freightUser = user;
                
                // Present categories to be chosen
                [self presentViewController:vehicleTypeCheck animated:YES completion:nil];
            
            
            
            // If something is wrong, show an alert
        } else {
            
            //Something bad has ocurred
            NSString *errorString = [[error userInfo] objectForKey:@"Confira os seus dados!"];
            UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Erro" message:errorString delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [errorAlertView show];
        }
    }];
    

    
    
}


- (PFUser*)setUpFreightUser:(id)sender {
    
    // Instanciate user class and its atributes
    PFUser *user = [PFUser user];
    //PFObject *freights = [PFObject objectWithClassName:@"Freights"];
    
    // Show an alert if user or password fields are left in blank
    if (self.txtFieldName.text.length == 0 || self.txtFieldPassword.text.length == 0) {
        //        NSString *errorString = [[error userInfo] objectForKey:@"Confira os seus dados!"];
        UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Erro" message:@"Preencha os campos em branco!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [errorAlertView show];
    }
    
    
    // Create a User for normal users or freight companies
    user.username = self.txtFieldEmail.text;
    user.password = self.txtFieldPassword.text;
    user.email = self.txtFieldEmail.text;
    
    
    [user setObject:self.txtFieldName.text forKey:@"name"];
    [user setObject:self.txtFieldTel.text forKey:@"telephone"];
    [user setObject:self.txtFieldCel1.text forKey:@"mobile1"];
    [user setObject:self.txtFieldCel2.text forKey:@"mobile2"];
    [user setObject:self.txtFieldCity.text forKey:@"city"];
    [user setObject:@"Prestador de Serv." forKey:@"freightUserType"];
    
    // Set State
    if (self.segmentedState.selectedSegmentIndex == 0) {
        [user setObject:@"RJ" forKey:@"state"];
    }
    
    if (self.segmentedState.selectedSegmentIndex == 1) {
        [user setObject:@"SP" forKey:@"state"];
    }
    
    // Set normal users
    if (self.segmentedCompanyType.selectedSegmentIndex == 0) {
        
        // Set previously selected segmented on its class
        [user setObject:@"Corporate" forKey:@"companyType"];
        
    }
    
    
    // Set Freight users
    if (self.segmentedCompanyType.selectedSegmentIndex == 1) {
        
        [user setObject:@"Private" forKey:@"companyType"];
        
        
    }
    
    
    
    return user;
    
    
}




@end






























