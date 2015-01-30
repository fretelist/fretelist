//
//  FreighCompanyTableViewController.h
//  FreteList
//
//  Created by Joao Paulo Galvao Alves on 1/30/15.
//  Copyright (c) 2015 FreteList. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FreighCompanyTableViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UITextField *txtFieldName;

@property (weak, nonatomic) IBOutlet UITextField *txtFieldEmail;

@property (weak, nonatomic) IBOutlet UITextField *txtFieldPassword;

@property (weak, nonatomic) IBOutlet UITextField *txtFieldTel;

@property (weak, nonatomic) IBOutlet UITextField *txtFieldCel1;
@property (weak, nonatomic) IBOutlet UITextField *txtFieldCel2;

@property (weak, nonatomic) IBOutlet UITextField *txtFieldCity;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedState;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedCompanyType;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnCancel;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnNext;

- (IBAction)cancelSignUp:(id)sender;
- (IBAction)chooseVehicleType:(id)sender;

@end
