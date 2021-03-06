//
//  MyAccountTableViewController.h
//  FreteList
//
//  Created by Joao Paulo Galvao Alves on 2/7/15.
//  Copyright (c) 2015 FreteList. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VehicleTypeFilterViewController.h"

@interface MyAccountTableViewController : UITableViewController<UIActionSheetDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate,UITextFieldDelegate,UITextViewDelegate,UIPickerViewDelegate,UIPickerViewDataSource,UITabBarControllerDelegate,vehicleTypeFilterDelegate>


@property (weak, nonatomic) IBOutlet UITextField *txtFieldName;
@property (weak, nonatomic) IBOutlet UITextField *txtFieldEmail;
@property (weak, nonatomic) IBOutlet UITextField *txtFieldPsswd;
//@property (weak, nonatomic) IBOutlet UITextField *txtFieldVehicle;
@property (weak, nonatomic) IBOutlet UITextField *txtFieldTelephone;
@property (weak, nonatomic) IBOutlet UITextField *txtFieldMob1;
@property (weak, nonatomic) IBOutlet UITextField *txtFieldMob2;
@property (weak, nonatomic) IBOutlet UITextField *txtFieldCityNormalUser;
//@property (weak, nonatomic) IBOutlet UITextField *txtFieldDescription;
@property (strong, nonatomic) IBOutlet UITextView *txtViewDescription;


@property (weak, nonatomic) IBOutlet UIPickerView *pickerMyAccountCity;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerMyAccountState;
@property (weak, nonatomic) IBOutlet UILabel *labelTelephone;
@property (weak, nonatomic) IBOutlet UILabel *labelMob1;
@property (weak, nonatomic) IBOutlet UILabel *labelMob2;
@property (weak, nonatomic) IBOutlet UILabel *labelCityNormalUser;
@property (weak, nonatomic) IBOutlet UILabel *labelCityFreightUser;

@property (weak, nonatomic) IBOutlet UILabel *labelVehicleType;
@property (weak, nonatomic) IBOutlet UILabel *labelDescription;
@property (weak, nonatomic) IBOutlet UILabel *labelMyAccountWordCount;
@property (weak, nonatomic) IBOutlet UIButton *btnChangeVehicleType;




//Arrays
@property (nonatomic, strong) NSMutableArray *myAccountVehicleTypes;
@property (nonatomic, strong) NSMutableArray *myAccountStateData;
@property (nonatomic, strong) NSMutableArray *myAccountCityData;
@property (nonatomic, strong) NSArray *myAccountUserStateArray;
@property (nonatomic, strong) NSArray *myAccountFreightUserStateArray;
@property (nonatomic, strong) NSArray *myAccountFreightUserCityArray;


@property (weak, nonatomic) IBOutlet UIImageView *imgViewUserPhoto;
@property (weak, nonatomic) IBOutlet UIButton *btnChangePhoto;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *btnCancel;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnSave;
@property (weak, nonatomic) IBOutlet UIButton *btnLogout;

//Strings
@property (nonatomic, strong) NSString *pickerSelectedNewString;
@property (nonatomic, strong) NSString *pickerSelectedNewCity;

@property (nonatomic, assign) BOOL isCliente;

//Actions
- (IBAction)performLogout:(id)sender;
- (IBAction)changePhoto:(id)sender;
- (IBAction)editInfos:(id)sender;
- (IBAction)cancelInfos:(id)sender;
- (IBAction)showMyAccountVehicleTypes:(id)sender;

@end
