//
//  MyAccountTableViewController.h
//  FreteList
//
//  Created by Joao Paulo Galvao Alves on 2/7/15.
//  Copyright (c) 2015 FreteList. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyAccountTableViewController : UITableViewController<UIActionSheetDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate,UIPickerViewDelegate,UIPickerViewDataSource>


@property (weak, nonatomic) IBOutlet UITextField *txtFieldName;
@property (weak, nonatomic) IBOutlet UITextField *txtFieldEmail;
@property (weak, nonatomic) IBOutlet UITextField *txtFieldPsswd;
//@property (weak, nonatomic) IBOutlet UITextField *txtFieldVehicle;
@property (weak, nonatomic) IBOutlet UITextField *txtFieldTelephone;
@property (weak, nonatomic) IBOutlet UITextField *txtFieldMob1;
@property (weak, nonatomic) IBOutlet UITextField *txtFieldMob2;

@property (weak, nonatomic) IBOutlet UITextField *txtFieldCity;
@property (weak, nonatomic) IBOutlet UITextField *txtFieldState;
@property (weak, nonatomic) IBOutlet UITextField *txtFieldDescription;

@property (weak, nonatomic) IBOutlet UIPickerView *pickerMyAccountState;

//Arrays
@property (nonatomic, strong) NSMutableArray *myAccountStateData;
@property (nonatomic, strong) NSArray *myAccountUserStateArray;
@property (nonatomic, strong) NSArray *myAccountFreightUserStateArray;


@property (weak, nonatomic) IBOutlet UIImageView *imgViewUserPhoto;
@property (weak, nonatomic) IBOutlet UIButton *btnChangePhoto;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnCancel;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnSave;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedSatate;
@property (weak, nonatomic) IBOutlet UIButton *btnLogout;

//Strings
@property (nonatomic, strong) NSString *pickerSelectedNewString;

//Actions
- (IBAction)performLogout:(id)sender;
- (IBAction)changePhoto:(id)sender;
- (IBAction)editInfos:(id)sender;
- (IBAction)cancelInfos:(id)sender;

@end
