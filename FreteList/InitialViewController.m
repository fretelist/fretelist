//
//  TelaInicialViewController.m
//  tenhoDesconto
//
//  Created by Joao Paulo Galvao Alves on 4/11/14.
//  Copyright (c) 2014 tenhoDesconto. All rights reserved.
//

#import "InitialViewController.h"
#import "FreightListViewController.h"
#import "SignUpViewController.h"
#import "MapViewController.h"
#import "VehicleTypeSignUpTableViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface InitialViewController ()

@property(nonatomic,strong)UIAlertView *alertOne;
@property(nonatomic,strong)UIAlertView *alertTwo;

@end

@implementation InitialViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    
 
    
    self.navigationController.navigationBarHidden = YES;
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    PFUser *currentUser = [PFUser currentUser];
    if (currentUser) {
        // do stuff with the user
        
        UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
        //HomeViewController *home = [storyboard instantiateViewControllerWithIdentifier:@"HomeTab"];
        UITabBarController *freightList = [storyboard instantiateViewControllerWithIdentifier:@"HomeTab"];
        
        
        
        [self  presentViewController:freightList animated:YES completion:nil];
        
        
        
    } else {
        // show Initial view
        
        
    }
    
    
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = YES;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - AlertView Delegates
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    //Check which button was clicked
    if (alertView == self.alertOne) {
        switch (buttonIndex){
            case 0:{
                NSLog(@"NO");
                
                UINavigationController *normalUserLogin = (UINavigationController *)[self.storyboard instantiateViewControllerWithIdentifier:@"LoginControllerNav"];
                
                [self presentViewController:normalUserLogin animated:YES completion:nil];
                
                break;
            }
            case 1:{
                NSLog(@"YES");
                
                UINavigationController *companyRegistration = (UINavigationController *)[self.storyboard instantiateViewControllerWithIdentifier:@"FreightLoginControllerNav"];
                
                [self presentViewController:companyRegistration animated:YES completion:nil];
                
                break;
            }
                
            default:
                break;
                
        }
        
    //Load SignUp for SignUp clicked
    } else if(alertView == self.alertTwo){
        
            switch (buttonIndex){
                case 0:{
                    NSLog(@"NO");
                    
                    UINavigationController *normalUserRegistration = (UINavigationController *)[self.storyboard instantiateViewControllerWithIdentifier:@"UserSignUpControllerNav"];
                    
                    [self presentViewController:normalUserRegistration animated:YES completion:nil];
                    
                    break;
                }
                case 1:{
                    NSLog(@"YES");
                    
                    UINavigationController *companyRegistration = (UINavigationController *)[self.storyboard instantiateViewControllerWithIdentifier:@"SignUpControllerNav"];
                    
                    [self presentViewController:companyRegistration animated:YES completion:nil];
                    
                    break;
                }
                    
                default:
                    break;
                    
            }
        
    }
    
}

#pragma mark - My Actions


- (IBAction)btnLogin:(id)sender {
    

    self.alertOne = [[UIAlertView alloc]initWithTitle:@"FreteList"
                                                      message:@"Você é um fretista?"
                                                     delegate:self
                                            cancelButtonTitle:@"Não"
                                            otherButtonTitles:@"Sim", nil];
    
    [self.alertOne show];
    
//    UINavigationController *loginNav = (UINavigationController*)[self.storyboard instantiateViewControllerWithIdentifier:@"LoginControllerNav"];
//    
//    //    SignUpViewController *signUpView = (SignUpViewController*)[signUpNav.viewControllers objectAtIndex:0];
//    
//    
//    [self presentViewController:loginNav animated:YES completion:nil];
    
    
}

- (IBAction)btnSignUp:(id)sender {
    
    
    
    self.alertTwo = [[UIAlertView alloc]initWithTitle:@"FreteList"
                                                      message:@"Você é um fretista?"
                                                    delegate:self
                                            cancelButtonTitle:@"Não"
                                            otherButtonTitles:@"Sim", nil];
    
    [self.alertTwo show];

    
    
    
    
    
}


#pragma mark - Navigation

//// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
////     Get the new view controller using [segue destinationViewController].
////     Pass the selected object to the new view controller.
//    
//        
//        
//    
//    
//}



@end
