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
    self.txtNormalUserName.delegate =
    self.txtNormalUserEmail.delegate =
    self.txtNormalUserPsswd.delegate =
    self.txtNormalUserCity.delegate =
    self.txtNormalUserState.delegate = self;
    
}


#pragma mark - UITextFieldDelegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if (textField == self.txtNormalUserName) {
        [self.txtNormalUserEmail becomeFirstResponder];
    }
    else if (textField == self.txtNormalUserEmail) {
        [self.txtNormalUserPsswd becomeFirstResponder];
    }
    else if (textField == self.txtNormalUserPsswd) {
        [self.txtNormalUserCity becomeFirstResponder];
    }
    else if (textField == self.txtNormalUserCity) {
        [self.txtNormalUserState becomeFirstResponder];
        
    }
    else if (textField == self.txtNormalUserState){
        
        [self.txtNormalUserState resignFirstResponder];
        
        //        NSIndexPath *path = [NSIndexPath indexPathForRow:2 inSection:1];
        //        [self.tableView selectRowAtIndexPath:path animated:true scrollPosition:UITableViewScrollPositionBottom];
        //        [self displayGenderPicker];
        
    }
        return YES;
}









- (IBAction)cancelNormalUserSignUp:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)sendNormalUserSignUp:(id)sender {
    
    
    PFUser *user = [self setUpFreightUser:sender];
    
    // Show an alert for success or error - Write user Keys to Parse
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            
            //SignUp Successful
//            NSString *successString = [[error userInfo] objectForKey:@"Sucesso"];
            
            UIAlertView *successAlertView = [[UIAlertView alloc] initWithTitle:@"Sucesso:" message:@"Confirme o seu e-mail e realize o Login." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [successAlertView show];
            
            [self dismissViewControllerAnimated:YES completion:nil];
            
            
            
            // If something is wrong, show an alert
        } else {
            
            //Something bad has ocurred
            //NSString *errorString = [[error userInfo] objectForKey:@"Erro"];
            UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Erro:" message:@"Tente Novamente!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
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
    
    [user setObject:self.txtNormalUserName.text forKey:@"name"];
    [user setObject:self.txtNormalUserCity.text forKey:@"city"];
    [user setObject:self.txtNormalUserState.text forKey:@"state"];
    [user setObject:@"Cliente" forKey:@"freightUserType"];

    
    return user;
    
}


@end
















































