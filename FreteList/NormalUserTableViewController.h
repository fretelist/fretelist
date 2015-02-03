//
//  NormalUserTableViewController.h
//  FreteList
//
//  Created by Joao Alves on 2/2/15.
//  Copyright (c) 2015 FreteList. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NormalUserTableViewController : UITableViewController<UITextFieldDelegate>


@property (weak, nonatomic) IBOutlet UITextField *txtNormalUserName;
@property (weak, nonatomic) IBOutlet UITextField *txtNormalUserEmail;
@property (weak, nonatomic) IBOutlet UITextField *txtNormalUserPsswd;
@property (weak, nonatomic) IBOutlet UITextField *txtNormalUserCity;
@property (weak, nonatomic) IBOutlet UITextField *txtNormalUserState;


- (IBAction)cancelNormalUserSignUp:(id)sender;
- (IBAction)sendNormalUserSignUp:(id)sender;

@end
