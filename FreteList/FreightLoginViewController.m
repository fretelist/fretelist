//
//  FreightLoginViewController.m
//  FreteList
//
//  Created by Joao Paulo Galvao Alves on 5/28/15.
//  Copyright (c) 2015 FreteList. All rights reserved.
//

#import "FreightLoginViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "FreightListViewController.h"

@interface FreightLoginViewController ()

@end

@implementation FreightLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Set the navigation hidden
    self.navigationController.navigationBarHidden = NO;
    
    self.scrFreightLogin.scrollEnabled = YES;
    
    // Set textFields delegates
    self.txtFieldFreightLogin.delegate = self;
    self.txtFieldFreightPsswdLogin.delegate = self;
    
    // Set TapGesture
    self.gestureRecognizerFreightLogin = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(freightLoginHideKeyboard:)];
    
    [self.scrFreightLogin addGestureRecognizer:self.gestureRecognizerFreightLogin];
    
}

// Clears both textFields
- (void)viewDidUnload
{
    [super viewDidUnload];
    
    // Clears textFields
    self.txtFieldFreightLogin = nil;
    self.txtFieldFreightPsswdLogin = nil;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
// Triggered when the user starts typing on a textField
-(void)textFieldDidBeginEditing:(UITextField *)textField {
    
    // Só pega o de baixo, o tamanho do de baixo já vale para os dois.
    if (textField == self.txtFieldFreightPsswdLogin || textField == self.txtFieldFreightLogin) {
        
        // Define new Scroll Area
        // Keyboard size on portrait mode is 216 pixels.
        self.scrFreightLogin.contentSize = CGSizeMake(0.0, 460.0 + 216.0);
        
        // Control for Scroll position
        [self.scrFreightLogin setContentOffset:CGPointMake(0.0, 210.0) animated:YES];
        
        // Disable Scroll
        self.scrFreightLogin.scrollEnabled = NO;
        
    }
}

// Hides Keyboard when the user press return
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if (textField == self.txtFieldFreightLogin) {
        [self.txtFieldFreightPsswdLogin becomeFirstResponder];
    }
    
    // Check which field got focus
    if (textField == self.txtFieldFreightPsswdLogin) {
        
        [textField resignFirstResponder];
        
        // Return the Scroll Content
        [self.scrFreightLogin setContentOffset:CGPointMake(0.0, 0.0) animated:YES];
    }
    
    
    return YES;
    
}



#pragma mark - My Actions
// Hide Keyboard when Tapped
-(void) freightLoginHideKeyboard: (id) sender {
    
    //Hide Keyboard if txtFieldFreightLogin
    [self.txtFieldFreightLogin resignFirstResponder];
    
    //Set Scroll View Position
    [self.scrFreightLogin setContentOffset:CGPointMake(0.0, 0.0) animated:YES];
    
    //Hide Keyboard if txtFieldPsswd
    [self.txtFieldFreightPsswdLogin resignFirstResponder];
    
    //Set Scroll View Position
    [self.scrFreightLogin setContentOffset:CGPointMake(0.0, 0.0) animated:YES];
    
    
}


- (IBAction)btnForgotPsswdFreightLogin:(id)sender {
    
    //Instatiante ForgotPasswordViewController
    UINavigationController *forgotPsswdNav = (UINavigationController*)[self.storyboard instantiateViewControllerWithIdentifier:@"ForgotPasswordViewController"];
    
    //Present ForgotPasswordViewController
    [self presentViewController:forgotPsswdNav animated:YES completion:nil];
    
}

- (IBAction)btnCancelFreightLogin:(id)sender {
    
    //Cancel Login
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)btnPerformFreightLogin:(id)sender {
    
    
    // Peforms login whith what was typed in both textFields
    
    [PFUser logInWithUsernameInBackground:self.txtFieldFreightLogin.text password:self.txtFieldFreightPsswdLogin.text block:^(PFUser *user, NSError *error) {
        
        if (![[user objectForKey:@"emailVerified"] boolValue] == false) {
            
            //Create a storyboard object
            UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
            
            //Instantiate homeTab
            FreightListViewController *timeLine = [storyboard instantiateViewControllerWithIdentifier:@"HomeTab"];
            
            
            [self  presentViewController:timeLine animated:YES completion:nil];
            //[self  presentViewController:home animated:YES completion:nil];
            
            self.txtFieldFreightLogin.text =
            self.txtFieldFreightPsswdLogin.text = nil;
            
            
        } else {
            //Something bad has ocurred
            //NSString *errorString = [[error userInfo] objectForKey:@"error"];
            UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Erro" message:@"Verifique o seu e-mail e tente novamente." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [errorAlertView show];
        }
    }];
    
}
@end



















