//
//  NormalUserTableViewController.m
//  FreteList
//
//  Created by Joao Alves on 2/2/15.
//  Copyright (c) 2015 FreteList. All rights reserved.
//

#import "NormalUserTableViewController.h"
#import <Parse/Parse.h>

@interface NormalUserTableViewController ()

@end

@implementation NormalUserTableViewController

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}












- (IBAction)cancelNormalUserSignUp:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)sendNormalUserSignUp:(id)sender {
    
    
    PFUser *user = [self setUpFreightUser:sender];
    
    // Show an alert for success or error - Write user Keys to Parse
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            
            
            
            [self dismissViewControllerAnimated:YES completion:nil];
            
            
            
            // If something is wrong, show an alert
        } else {
            
            //Something bad has ocurred
            NSString *errorString = [[error userInfo] objectForKey:@"Confira os seus dados!"];
            UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Erro" message:errorString delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [errorAlertView show];
        }
    }];
    

    
    
    
}



-(PFUser*) setUpFreightUser:(id)sender{
    
    // Instanciate user class and its atributes
    PFUser *user = [PFUser user];
    
    // Show an alert if user or password fields are left in blank
    if (self.txtNormalUserName.text.length == 0 || self.txtNormalUserPsswd.text.length == 0) {
        //        NSString *errorString = [[error userInfo] objectForKey:@"Confira os seus dados!"];
        UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Erro" message:@"Preencha os campos em branco!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [errorAlertView show];
        
    }
    
    // Create a User for normal users or freight companies
    user.username = self.txtNormalUserEmail.text;
    user.password = self.txtNormalUserPsswd.text;
    user.email = self.txtNormalUserEmail.text;
    
    return user;
    
}


@end
















































