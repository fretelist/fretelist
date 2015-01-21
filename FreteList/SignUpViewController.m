
//  CadastroViewController.m
//  tenhoDesconto
//
//  Created by Joao Paulo Galvao Alves on 4/11/14.
//  Copyright (c) 2014 tenhoDesconto. All rights reserved.
//

#import "SignUpViewController.h"
#import "HomeViewController.h"
#import "VehiclesViewController.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = NO;
    
    self.signUpScroll.scrollEnabled = YES;
    
    self.signUpScroll.contentSize = CGSizeMake(0.0, 416.0); // 416
    
    self.signUpNameTextField.delegate =
    self.signUpEmailTextField.delegate =
    self.signUpPsswdTextField.delegate =
    self.signUpTelephoneTextField.delegate =
    self.signUpCel1TextField.delegate =
    self.signUpCel2TextField.delegate =
    self.signUpCityTextField.delegate = self;
    
    self.signUpGestureRecognizer.delegate = self;
    
    self.signUpGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(signUpHideKeyboard:)];
    
    [self.signUpScroll addGestureRecognizer:self.signUpGestureRecognizer];
    
    

    // Triggers textFields Fade out
    //[self performAnimation:self];
    
}


#pragma mark - UITextFieldDelegate

// Triggered when the user starts typing
-(void)textFieldDidBeginEditing:(UITextField *)textField {
    
    // Set the Scroll Size.
    self.signUpScroll.contentSize = CGSizeMake(0.0, 480.0 + 216.0);
    
    // Só pega o de baixo, o tamanho do de baixo já vale para os dois.
    if (textField == self.signUpNameTextField) {
        
        self.signUpScroll.scrollEnabled = YES;
        
        // Scroll position Control
        [self.signUpScroll setContentOffset:CGPointMake(0.0, 0.0) animated:YES];
        
    } else {
        
        if (textField == self.signUpEmailTextField) {
            [self.signUpScroll setContentOffset:CGPointMake(0.0, 0.0) animated:YES];
            
        } else {
            
            if (textField == self.signUpPsswdTextField) {
                
                self.signUpScroll.scrollEnabled = YES;
                
                [self.signUpScroll setContentOffset:CGPointMake(0.0, 0.0) animated:YES];
            
            } else {
                
                if (textField == self.signUpTelephoneTextField) {
                    
                    self.signUpScroll.scrollEnabled = YES;
                    
                    [self.signUpScroll setContentOffset:CGPointMake(0.0, 0.0) animated:YES];

                } else {
                    
                        if (textField == self.signUpCityTextField) {
                            
                            self.signUpScroll.scrollEnabled = YES;
                            
                            [self.signUpScroll setContentOffset:CGPointMake(0.0, 160.0) animated:YES];
                            
                        } else {
                            
                            if (textField == self.signUpCel1TextField) {
                                
                                self.signUpScroll.scrollEnabled = YES;
                                
                                [self.signUpScroll setContentOffset:CGPointMake(0.0, 160.0) animated:YES];
                                
                            } else {
                                
                                if (textField == self.signUpCel2TextField) {
                                    
                                    self.signUpScroll.scrollEnabled = YES;
                                    
                                    [self.signUpScroll setContentOffset:CGPointMake(0.0, 160.0) animated:YES];
                                    
                                } else {
                                    
                                    
                                }

                            }

                        }
                    
                 }
                    
            }

        }
        
    }
    
}

// Triggered when the user press Return

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    
    // Só pega o de baixo, o tamanho do de baixo já vale para os dois.
    if (textField == self.signUpNameTextField) {
        
        [self.signUpEmailTextField becomeFirstResponder];
        
        // Scroll position Control
        [self.signUpScroll setContentOffset:CGPointMake(0.0, 0.0) animated:YES];
        
    } else {
        
        if (textField == self.signUpEmailTextField) {
            
            [self.signUpPsswdTextField becomeFirstResponder];
            
            [self.signUpScroll setContentOffset:CGPointMake(0.0, 0.0) animated:YES];
            
        } else {
            
            if (textField == self.signUpPsswdTextField) {
                
                [self.signUpTelephoneTextField becomeFirstResponder];
                
                [self.signUpScroll setContentOffset:CGPointMake(0.0, 0.0) animated:YES];
                
            } else {
                
                if (textField == self.signUpTelephoneTextField) {
                    
                    [self.signUpCel1TextField becomeFirstResponder];
                    
                    [self.signUpScroll setContentOffset:CGPointMake(0.0, 70.0) animated:YES];
                    
                } else {
                        
                    if (textField == self.signUpCel1TextField) {
                            
                        [self.signUpCel2TextField becomeFirstResponder];
                            
                        [self.signUpScroll setContentOffset:CGPointMake(0.0, 160.0) animated:YES];
                            
                    } else {
                            
                        if (textField == self.signUpCel2TextField) {
                                
                            [self.signUpCityTextField becomeFirstResponder];
                                
                            [self.signUpScroll setContentOffset:CGPointMake(0.0, 160.0) animated:YES];
                                
                        } else {
                                
                            if (textField == self.signUpCityTextField) {
                                    
                                [self.signUpCityTextField resignFirstResponder];
                                    
                                [self.signUpScroll setContentOffset:CGPointMake(0.0, 0.0) animated:YES];
                                    
                            } else {
                                    
                                    
                            }
                                
                         }
                            
                     }
                    
                  }
                
              }
            
          }
        
     }

    return YES;
}

#pragma Mark - My Actions


// Hide Keyboard when Tapped
-(void) signUpHideKeyboard: (id) sender {
    
    
    if ([self.signUpNameTextField becomeFirstResponder]) {
        
        [self.signUpNameTextField resignFirstResponder];
        
        // Scroll position Control
        [self.signUpScroll setContentOffset:CGPointMake(0.0, 0.0) animated:YES];
        
    } else {
        
        if ([self.signUpEmailTextField becomeFirstResponder]) {
            
            [self.signUpEmailTextField resignFirstResponder];
            
            [self.signUpScroll setContentOffset:CGPointMake(0.0, 0.0) animated:YES];
            
        } else {
            
            if ([self.signUpPsswdTextField becomeFirstResponder]) {
                
                [self.signUpPsswdTextField resignFirstResponder];
                
                [self.signUpScroll setContentOffset:CGPointMake(0.0, 0.0) animated:YES];
                
            } else {
                
                if ([self.signUpTelephoneTextField becomeFirstResponder]) {
                    
                    [self.signUpTelephoneTextField resignFirstResponder];
                    
                    [self.signUpScroll setContentOffset:CGPointMake(0.0, 0.0) animated:YES];
                    
                } else {
                    
                    if ([self.signUpCel1TextField becomeFirstResponder]) {
                        
                        [self.signUpCel1TextField resignFirstResponder];
                        
                        [self.signUpScroll setContentOffset:CGPointMake(0.0, 0.0) animated:YES];
                        
                    } else {
                        
                        if ([self.signUpCel2TextField becomeFirstResponder]) {
                            
                            [self.signUpCel2TextField resignFirstResponder];
                            
                            [self.signUpScroll setContentOffset:CGPointMake(0.0, 0.0) animated:YES];
                            
                        } else {
                            
                            if ([self.signUpCityTextField becomeFirstResponder]) {
                                
                                [self.signUpCityTextField resignFirstResponder];
                                
                                [self.signUpScroll setContentOffset:CGPointMake(0.0, 0.0) animated:YES];
                                
                            } else {
                                
                                
                            }
                            
                        }
                        
                    }
                    
                }
                
            }
            
        }
        
    }
    
}

-(void)performAnimation:(id)sender{
    
    // Fades out TextFields according to selection
    if (self.userTypeSegmented.selectedSegmentIndex == 0) {
        [UIView animateWithDuration:0.5
                              delay:0.0
                            options:UIViewAnimationOptionTransitionCrossDissolve
                         animations:^{
                             
                             // Fades out all fields and labels related to Companies
                             self.signUpTelLabel.alpha = 0.0;
                             self.signUpCel1Label.alpha = 0.0;
                             self.signUpCel2Label.alpha = 0.0;
                             self.signUpTelephoneTextField.alpha = 0.0;
                             self.signUpCel1TextField.alpha = 0.0;
                             self.signUpCel2TextField.alpha = 0.0;
                             self.signUpAddVehicle.hidden = YES;
                             
                             
                             //Save the original value position for cityLabel
                             CGFloat originalCityY = self.signUpCityLabel.layer.position.y;
                             CGFloat originalStateY = self.signUpStateLabel.layer.position.y;
                             
                             
                             //Change the Model value
                             self.signUpCityLabel.layer.position = CGPointMake(self.signUpCityLabel.layer.position.x, 313.0);
                             self.signUpCityTextField.layer.position = CGPointMake(self.signUpCityTextField.layer.position.x, 313.0);
                             self.signUpStateLabel.layer.position = CGPointMake(self.signUpStateLabel.layer.position.x, 353.0);
                             self.signUpStatePicker.layer.position = CGPointMake(self.signUpStatePicker.layer.position.x, 353.0);
                             
                             
                             CABasicAnimation *animationCity = [CABasicAnimation animationWithKeyPath:@"position.y"];
                             CABasicAnimation *animationState = [CABasicAnimation animationWithKeyPath:@"position.y"];
                             CABasicAnimation *animationStatePicker = [CABasicAnimation animationWithKeyPath:@"position.y"];
                             
                             // Now specify the fromValue for the animation because
                             // the current model value is already the correct toValue
                             animationCity.fromValue = @(originalCityY);
                             animationCity.toValue = @313.0;
                             
                             animationState.fromValue = @(originalStateY);
                             animationState.toValue = @353.0;
                             
                             animationState.fromValue = @(originalStateY);
                             animationState.toValue = @353.0;
                             
                             animationCity.duration = 1.0;
                             animationCity.fillMode = kCAFillModeForwards;
                             animationCity.removedOnCompletion = NO;
                             
                             animationState.duration = 1.0;
                             animationState.fillMode = kCAFillModeForwards;
                             animationState.removedOnCompletion = NO;
                             
                             animationStatePicker.duration = 1.0;
                             animationStatePicker.fillMode = kCAFillModeForwards;
                             animationStatePicker.removedOnCompletion = NO;
                             
                             // Use the name of the animated property as key
                             // to override the implicit animation
                             [self.signUpCityLabel.layer addAnimation:animationCity
                                                  forKey:@"position"];
                             [self.signUpCityTextField.layer addAnimation:animationCity forKey:@"position"];
                             
                             [self.signUpStateLabel.layer addAnimation:animationState forKey:@"position"];
                             
                             [self.signUpStatePicker.layer addAnimation:animationState forKey:@"position"];
                             
                             

                             
                             
                             
                             
                             
//                             self.signUpStateLabel.frame = StateFrame;
                         }
                         completion:^(BOOL finished) {
                            
                             //..[Do something here]
                             
                             
                             
                             
                             
                         }];
        
    }
    
    if (self.userTypeSegmented.selectedSegmentIndex == 1) {
        
    

        
        [UIView animateWithDuration:0.5
                              delay:0.0
                            options:UIViewAnimationOptionTransitionCrossDissolve
                         animations:^{
                             
                             // Fades out all fields and labels related to Companies
                             self.signUpTelLabel.alpha = 1.0;
                             self.signUpCel1Label.alpha = 1.0;
                             self.signUpCel2Label.alpha = 1.0;
                             self.signUpTelephoneTextField.alpha = 1.0;
                             self.signUpCel1TextField.alpha = 1.0;
                             self.signUpCel2TextField.alpha = 1.0;
                             self.signUpAddVehicle.hidden = NO;
                             
                             
                             //Save the original value position for cityLabel
                             CGFloat originalCityY = self.signUpCityLabel.layer.position.y;
                             CGFloat originalStateY = self.signUpStateLabel.layer.position.y;
                             
                             
                             //Change the Model value
                             self.signUpCityLabel.layer.position = CGPointMake(self.signUpCityLabel.layer.position.x, 421.0);
                             self.signUpCityTextField.layer.position = CGPointMake(self.signUpCityTextField.layer.position.x, 421.0);
                             self.signUpStateLabel.layer.position = CGPointMake(self.signUpStateLabel.layer.position.x, 464.0);
                             self.signUpStatePicker.layer.position = CGPointMake(self.signUpStatePicker.layer.position.x, 464.0);
                             
                             
                             CABasicAnimation *animationCity = [CABasicAnimation animationWithKeyPath:@"BackToPosition.y"];
                             CABasicAnimation *animationState = [CABasicAnimation animationWithKeyPath:@"BackToPosition.y"];
                             CABasicAnimation *animationStatePicker = [CABasicAnimation animationWithKeyPath:@"BackToPosition.y"];
                             
                             // Now specify the fromValue for the animation because
                             // the current model value is already the correct toValue
                             animationCity.fromValue = @(originalCityY);
                             animationCity.toValue = @421.0;
                             
                             animationState.fromValue = @(originalStateY);
                             animationState.toValue = @421.0;
                             
                             animationState.fromValue = @(originalStateY);
                             animationState.toValue = @464.0;
                             
                             animationCity.duration = 1.0;
                             animationCity.fillMode = kCAFillModeForwards;
                             animationCity.removedOnCompletion = NO;
                             
                             animationState.duration = 1.0;
                             animationState.fillMode = kCAFillModeForwards;
                             animationState.removedOnCompletion = NO;
                             
                             animationStatePicker.duration = 1.0;
                             animationStatePicker.fillMode = kCAFillModeForwards;
                             animationStatePicker.removedOnCompletion = NO;
                             
                             // Use the name of the animated property as key
                             // to override the implicit animation
                             [self.signUpCityLabel.layer addAnimation:animationCity
                                                               forKey:@"position"];
                             [self.signUpCityTextField.layer addAnimation:animationCity forKey:@"BackToPosition"];
                             
                             [self.signUpStateLabel.layer addAnimation:animationState forKey:@"BackToPosition"];
                             
                             [self.signUpStatePicker.layer addAnimation:animationState forKey:@"BackToPosition"];
                             
                             
                             
                             
                             
                             
                             
                             
                             //                             self.signUpStateLabel.frame = StateFrame;
                         }
                         completion:^(BOOL finished) {
                             
                             //..[Do something here]
                             
                             
                             
                             
                             
                         }];

        
        
        
        
    }
    
    
    
    
    
}


- (IBAction)registerYourVehicle:(id)sender {
    
    //VehiclesViewController *registerVehicle = [[VehiclesViewController alloc] initWithClassName:@"Categories"];
    
    
    [self performSegueWithIdentifier:@"vehicleType" sender:self];
    
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    
    //segue.destinationViewController
}

- (IBAction)animateFields:(id)sender {
    
    
    // Perform action according to selection
    if (self.userTypeSegmented.selectedSegmentIndex == 0) {
        [self.signUpNextBtn setTitle:@"Finish"];
    } else {
        [self.signUpNextBtn setTitle:@"Next"];
    }
    
    
    
}


#pragma mark - Parse

// Peform SignUp

- (PFUser*)setUpFreightUser:(id)sender {
    
    // Instanciate user class and its atributes
    PFUser *user = [PFUser user];
    PFObject *freights = [PFObject objectWithClassName:@"Freights"];
    
    // Show an alert if user or password fields are left in blank
    if (self.signUpEmailTextField.text.length == 0 || self.signUpPsswdTextField.text.length == 0) {
//        NSString *errorString = [[error userInfo] objectForKey:@"Confira os seus dados!"];
        UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Erro" message:@"Preencha os campos em branco!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [errorAlertView show];
    }
    
    
    // Create a User for normal users
    user.username = self.signUpEmailTextField.text;
    user.password = self.signUpPsswdTextField.text;
    user.email = self.signUpEmailTextField.text;
    
    //    user.email = self.signUpEmailTextField.text;
    [user setObject:self.signUpNameTextField.text forKey:@"name"];
    [user setObject:self.signUpTelephoneTextField.text forKey:@"telephone"];
    [user setObject:self.signUpCel1TextField.text forKey:@"mobile1"];
    [user setObject:self.signUpCel2TextField.text forKey:@"mobile2"];
    [user setObject:self.signUpCityTextField.text forKey:@"city"];
    
//    // Peform signup for normal users
    if (self.userTypeSegmented.selectedSegmentIndex == 0) {
      
        // Set previously selected segmented on its class
        [user setObject:@"Cliente" forKey:@"freightUserType"];

    }
    
    
    // Peform SignUp for Freights
    if (self.userTypeSegmented.selectedSegmentIndex == 1) {
        
        [freights setObject:@"Prestador de Serv." forKey:@"freightUserType"];
        
        
    }
    
    
    
    
    
    return user;
    
    
    
    
}


- (IBAction)directUser:(id)sender {
    
    PFUser *user = [self setUpFreightUser:sender];
    
    // Show an alert for success or error - Write user Keys to Parse
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            
            
            // Check the type of user
            if (self.userTypeSegmented.selectedSegmentIndex == 0) {
                
                
                // Show Alert for success
                UIAlertView* successAlertView = [[UIAlertView alloc]
                                                 initWithTitle:@"Sucesso"
                                                 message:@"Verifique o seu e-mail e confirme o seu cadastro!"
                                                 delegate:nil
                                                 cancelButtonTitle:@"Ok"
                                                 otherButtonTitles:nil, nil];
                
                [successAlertView show];
                

                
                
                //Back to root
                [self.navigationController  popToRootViewControllerAnimated:YES];
                
                
            } else {
                
                UINavigationController *vehicleTypeCheck = (UINavigationController*)[self.storyboard instantiateViewControllerWithIdentifier:@"VehicleTypeController"];
                
                VehiclesViewController *vehicleType = (VehiclesViewController*)[vehicleTypeCheck.viewControllers objectAtIndex:0];
                vehicleType .freightUser = user;
                
                [self presentViewController:vehicleTypeCheck animated:YES completion:nil];
                
            }
            
            
            
            
        } else if(self.signUpNameTextField.text.length == 0) {
            //Something bad has ocurred
            NSString *errorString = [[error userInfo] objectForKey:@"Confira os seus dados!"];
            UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Erro" message:errorString delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [errorAlertView show];
        }
    }];
    
}
@end





















































