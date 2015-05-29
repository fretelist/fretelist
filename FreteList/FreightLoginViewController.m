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
    
    
}

- (IBAction)btnCancelFreightLogin:(id)sender {
    
    //Cancel Login
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)btnPerformFreightLogin:(id)sender {
}
@end



















