//
//  FreightLoginViewController.h
//  FreteList
//
//  Created by Joao Paulo Galvao Alves on 5/28/15.
//  Copyright (c) 2015 FreteList. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FreightLoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *txtFieldFreightLogin;
@property (weak, nonatomic) IBOutlet UITextField *txtFieldFreightPsswdLogin;
@property (weak, nonatomic) IBOutlet UIButton *btnForgotPsswdFreightLogin;
@property (weak, nonatomic) IBOutlet UIScrollView *scrFreightLogin;

@property (nonatomic, strong) UITapGestureRecognizer *gestureRecognizerFreightLogin;

- (IBAction)btnForgotPsswdFreightLogin:(id)sender;
- (IBAction)btnCancelFreightLogin:(id)sender;
- (IBAction)btnPerformFreightLogin:(id)sender;

@end
