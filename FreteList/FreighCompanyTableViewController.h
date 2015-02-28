//
//  FreighCompanyTableViewController.h
//  FreteList
//
//  Created by Joao Paulo Galvao Alves on 1/30/15.
//  Copyright (c) 2015 FreteList. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FreighCompanyTableViewController : UITableViewController<UITextFieldDelegate, UIActionSheetDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate,UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *txtFieldName;

@property (weak, nonatomic) IBOutlet UITextField *txtFieldEmail;

@property (weak, nonatomic) IBOutlet UITextField *txtFieldPassword;

@property (weak, nonatomic) IBOutlet UITextField *txtFieldTel;

@property (weak, nonatomic) IBOutlet UITextField *txtFieldCel1;
@property (weak, nonatomic) IBOutlet UITextField *txtFieldCel2;

@property (weak, nonatomic) IBOutlet UITextField *txtFieldCity;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedState;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedCompanyType;
@property (weak, nonatomic) IBOutlet UITextView *txtViewDescription;
@property (weak, nonatomic) IBOutlet UIImageView *imgViewUserPhoto;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnCancel;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnNext;

@property (weak, nonatomic) IBOutlet UILabel *labelWordCount;

- (IBAction)cancelSignUp:(id)sender;
- (IBAction)chooseVehicleType:(id)sender;
- (IBAction)addUserPhoto:(id)sender;

@end
