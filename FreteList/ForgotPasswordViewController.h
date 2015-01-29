//
//  ForgotPasswordViewController.h
//  FreteList
//
//  Created by Joao Alves on 1/29/15.
//  Copyright (c) 2015 FreteList. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ForgotPasswordViewController : UIViewController<UITextFieldDelegate>


@property (weak, nonatomic) IBOutlet UITextField *textFieldResetPassword;

- (IBAction)cancelForgotPassword:(id)sender;

- (IBAction)resetPassword:(id)sender;

@end
