//
//  LoginViewController.m
//  tenhoDesconto
//
//  Created by Joao Paulo Galvao Alves on 4/11/14.
//  Copyright (c) 2014 tenhoDesconto. All rights reserved.
//

#import "LoginViewController.h"
#import "MapViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "FreightListViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    //Facebook Login
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc]init];
    loginButton.frame = CGRectMake(65.0, 492.0, 190.0, 34.0);
    //[self.view addSubview:loginButton];
    

    // Set the navigation hidden
    self.navigationController.navigationBarHidden = NO;
    
    self.loginScrollView.scrollEnabled = YES;
    
    // Set textFields delegates
    self.loginTextField.delegate = self;
    self.passwordTextField.delegate = self;
    
    // Set TapGesture
    self.gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard:)];
    
    [self.loginScrollView addGestureRecognizer:self.gestureRecognizer];
    
    
}


-(void)viewWillLayoutSubviews{
    
    PFUser *currentUser = [PFUser currentUser];
    if (currentUser || [FBSDKAccessToken currentAccessToken]) {
        // do stuff with the user
        
        UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
        //HomeViewController *home = [storyboard instantiateViewControllerWithIdentifier:@"HomeTab"];
        UITabBarController *freightList = [storyboard instantiateViewControllerWithIdentifier:@"HomeTab"];
        
        [self  presentViewController:freightList animated:YES completion:nil];
        
        
    } else {
        
        // show Initial view
        //[self loadView];
        
    }
    
}


// Clears both textFields
- (void)viewDidUnload
{
    [super viewDidUnload];
    
    // Clears textFields
    self.loginTextField = nil;
    self.passwordTextField = nil;
}

#pragma mark - FBSDKLoginButtonDelegate
//Handle Login results
-(void)loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result error:(NSError *)error{
    
    
}

//Handle Logout results
-(void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton{
    
}


#pragma mark - UITextFieldDelegate
// Triggered when the user starts typing on a textField
-(void)textFieldDidBeginEditing:(UITextField *)textField {
    
    // Só pega o de baixo, o tamanho do de baixo já vale para os dois.
    if (textField == self.passwordTextField || textField == self.loginTextField) {
        
        // Define new Scroll Area
        // Keyboard size on portrait mode is 216 pixels.
        self.loginScrollView.contentSize = CGSizeMake(0.0, 460.0 + 216.0);
        
        // Control for Scroll position
        [self.loginScrollView setContentOffset:CGPointMake(0.0, 210.0) animated:YES];
        
        // Disable Scroll
        self.loginScrollView.scrollEnabled = NO;
        
    }
}

// Hides Keyboard when the user press return
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if (textField == self.loginTextField) {
        [self.passwordTextField becomeFirstResponder];
    }
    
    // Check which field got focus
    if (textField == self.passwordTextField) {
       
        [textField resignFirstResponder];
        
        // Return the Scroll Content
        [self.loginScrollView setContentOffset:CGPointMake(0.0, 0.0) animated:YES];
    }
    
    
    
    return YES;
    
    
}




#pragma Mark - My Actions

// Hide Keyboard when Tapped
-(void) hideKeyboard: (id) sender {
    
    [self.loginTextField resignFirstResponder];
    
    
    [self.loginScrollView setContentOffset:CGPointMake(0.0, 0.0) animated:YES];
    
    [self.passwordTextField resignFirstResponder];
    
    [self.loginScrollView setContentOffset:CGPointMake(0.0, 0.0) animated:YES];
    
    
}

// Perform Login when send button is pressed
- (IBAction)cancelLogin:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)performLogin:(id)sender {
    
    // Peforms login whith what was typed in both textFields
    
    [PFUser logInWithUsernameInBackground:self.loginTextField.text password:self.passwordTextField.text block:^(PFUser *user, NSError *error) {
        
        if (![[user objectForKey:@"emailVerified"] boolValue] == false) {
            
            UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
            //HomeViewController *home = [storyboard instantiateViewControllerWithIdentifier:@"HomeTab"];
            MapViewController *closeOffers = [storyboard instantiateViewControllerWithIdentifier:@"HomeTab"];
            
            
            [self  presentViewController:closeOffers animated:YES completion:nil];
            //[self  presentViewController:home animated:YES completion:nil];
            
            self.loginTextField.text =
            self.passwordTextField.text = nil;
            
            
        } else {
            //Something bad has ocurred
            //NSString *errorString = [[error userInfo] objectForKey:@"error"];
            UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Erro" message:@"Verifique o seu e-mail e tente novamente." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [errorAlertView show];
        }
    }];
    
}

- (IBAction)performPsswdReset:(id)sender {
    
    UINavigationController *forgotPsswdNav = (UINavigationController*)[self.storyboard instantiateViewControllerWithIdentifier:@"ForgotPasswordViewController"];
    
    
    [self presentViewController:forgotPsswdNav animated:YES completion:nil];
    
    
}
@end





























