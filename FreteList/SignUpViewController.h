//
//  CadastroViewController.h
//  tenhoDesconto
//
//  Created by Joao Paulo Galvao Alves on 4/11/14.
//  Copyright (c) 2014 tenhoDesconto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface SignUpViewController : UIViewController<UITextFieldDelegate, UIGestureRecognizerDelegate, PFSignUpViewControllerDelegate>


@property (weak, nonatomic) IBOutlet UISegmentedControl *userTypeSegmented;

//TextFields
@property (weak, nonatomic) IBOutlet UITextField *signUpNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *signUpEmailTextField;
@property (weak, nonatomic) IBOutlet UITextField *signUpPsswdTextField;
@property (weak, nonatomic) IBOutlet UITextField *signUpTelephoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *signUpCel1TextField;
@property (weak, nonatomic) IBOutlet UITextField *signUpCel2TextField;
@property (weak, nonatomic) IBOutlet UITextField *signUpCityTextField;

@property (weak, nonatomic) IBOutlet UIPickerView *signUpPickerState;

//Labels
@property (weak, nonatomic) IBOutlet UILabel *signUpTelLabel;
@property (weak, nonatomic) IBOutlet UILabel *signUpCel1Label;
@property (weak, nonatomic) IBOutlet UILabel *signUpCel2Label;
@property (weak, nonatomic) IBOutlet UILabel *signUpCityLabel;
@property (weak, nonatomic) IBOutlet UILabel *signUpStateLabel;

@property (weak, nonatomic) IBOutlet UIButton *signUpAddVehicle;



//Other elements
@property (weak, nonatomic) IBOutlet UIScrollView *signUpScroll;
@property (nonatomic, strong) UITapGestureRecognizer *signUpGestureRecognizer;
@property (weak, nonatomic) IBOutlet UIPickerView *signUpStatePicker;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *signUpNextBtn;


//Actions
- (IBAction)performSignUp:(id)sender;
- (IBAction)registerYourVehicle:(id)sender;
- (IBAction)animateFields:(id)sender;

- (IBAction)directUser:(id)sender;





@end
