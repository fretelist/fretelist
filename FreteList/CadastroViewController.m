//
//  CadastroViewController.m
//  tenhoDesconto
//
//  Created by Joao Paulo Galvao Alves on 4/11/14.
//  Copyright (c) 2014 tenhoDesconto. All rights reserved.
//

#import "CadastroViewController.h"
#import "HomeViewController.h"
#import "VehiclesViewController.h"

@interface CadastroViewController ()

@end

@implementation CadastroViewController

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

#pragma mark - Parse

// Peform SignUp

- (IBAction)performSignUp:(id)sender {
    
    // Instanciate user class and its atributes
    PFUser *user = [PFUser user];
    PFObject *usuario = [PFObject objectWithClassName:@"Usuario"];
    
    // Show an alert if user or password fields are left in blank
    if (self.signUpEmailTextField.text.length == 0 || self.signUpPsswdTextField.text.length == 0) {
//        NSString *errorString = [[error userInfo] objectForKey:@"Confira os seus dados!"];
        UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Erro" message:@"Preencha os campos em branco!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [errorAlertView show];
    }
    
    user.username = self.signUpEmailTextField.text;
    user.password = self.signUpPsswdTextField.text;
    
    
    // Show an alert for success or error
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            
            
            //    user.email = self.signUpEmailTextField.text;
            [usuario setObject:self.signUpNameTextField.text forKey:@"name"];
            [usuario setObject:self.signUpEmailTextField.text forKey:@"email"];
            [usuario setObject:self.signUpPsswdTextField.text forKey:@"password"];
            [usuario setObject:self.signUpBdayTextField.text forKey:@"bday"];
            [usuario setObject:self.signUpCityTextField.text forKey:@"city"];
            [usuario setObject:self.signUpStateTextField.text forKey:@"state"];
            [usuario setObject:self.signUpCountryTextField.text forKey:@"country"];
            
            VehiclesViewController *truckTypes = [[VehiclesViewController alloc]init];
            
            if (truckTypes.sLorrySegmented.selectedSegmentIndex == 0) {
                [usuario setObject:@"feminino" forKey:@"gender"];
            } else {
                [usuario setObject:@"masculino" forKey:@"gender"];
            }
            [usuario save];
            
            
            [user setObject:self.signUpBdayTextField.text forKey:@"bday"];
            [user setObject:self.signUpCityTextField.text forKey:@"city"];
            [user setObject:self.signUpStateTextField.text forKey:@"state"];
            [user setObject:self.signUpCountryTextField.text forKey:@"country"];
            

            
           
            
            UIAlertView* successAlertView = [[UIAlertView alloc]
                                             initWithTitle:@"Sucesso"
                                             message:@"Verifique o seu e-mail e confirme o seu cadastro!"
                                             delegate:nil
                                             cancelButtonTitle:@"Ok"
                                             otherButtonTitles:nil, nil];
            
            [successAlertView show];
            
            
            
            [self.navigationController  popToRootViewControllerAnimated:YES];
            
            
            
        } else if(self.signUpNameTextField.text.length == 0) {
            //Something bad has ocurred
            NSString *errorString = [[error userInfo] objectForKey:@"Confira os seus dados!"];
            UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Erro" message:errorString delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [errorAlertView show];
        }
    }];

    
    
    
    
}
@end





















































