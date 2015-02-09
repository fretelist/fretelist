//
//  ForgotPasswordViewController.m
//  FreteList
//
//  Created by Joao Alves on 1/29/15.
//  Copyright (c) 2015 FreteList. All rights reserved.
//

#import "ForgotPasswordViewController.h"
#import <Parse/Parse.h>

@interface ForgotPasswordViewController ()

@end

@implementation ForgotPasswordViewController


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.textFieldResetPassword.delegate = self;
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - UITextFieldDelegate

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
}

#pragma mark - My Actions

- (IBAction)cancelForgotPassword:(id)sender {
    
    //Dismiss the keyboard
    [self resignFirstResponder];
    
    //Cancel Forgot Password
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}

- (IBAction)resetPassword:(id)sender {
    
    // Send a reset link to user
    [PFUser requestPasswordResetForEmailInBackground:self.textFieldResetPassword.text block:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            
            //Show an alert about success
            UIAlertView *resetSuccess = [[UIAlertView alloc]initWithTitle:@"Sucesso"
                                                                 message:@"Confira o seu e-mail e obtenha uma nova senha!"
                                                                delegate:self
                                                       cancelButtonTitle:@"Ok"
                                                       otherButtonTitles: nil];
            
            [resetSuccess show];
            
            //Present Login View
            UINavigationController *backToLogin = (UINavigationController *)[self.storyboard instantiateViewControllerWithIdentifier:@"LoginControllerNav"];
            
            [self presentViewController:backToLogin animated:YES completion:nil];
            
        }else{
            
            //Show an alert about error
            UIAlertView *resetError = [[UIAlertView alloc]initWithTitle:@"Erro"
                                                                  message:@"Tente Novamente!"
                                                                 delegate:self
                                                        cancelButtonTitle:@"Ok"
                                                        otherButtonTitles: nil];
            [resetError show];
        }
        
    }];
    
}
@end











