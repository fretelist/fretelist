//
//  TelaInicialViewController.h
//  tenhoDesconto
//
//  Created by Joao Paulo Galvao Alves on 4/11/14.
//  Copyright (c) 2014 tenhoDesconto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>

@interface InitialViewController : UIViewController<UIAlertViewDelegate>
- (IBAction)btnLogin:(id)sender;

- (IBAction)btnSignUp:(id)sender;


@end
