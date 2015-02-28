//
//  FreighCompanyTableViewController.m
//  FreteList
//
//  Created by Joao Paulo Galvao Alves on 1/30/15.
//  Copyright (c) 2015 FreteList. All rights reserved.
//

#import "FreighCompanyTableViewController.h"
#import "VehicleTypeSignUpTableViewController.h"
#import <Parse/Parse.h>

@interface FreighCompanyTableViewController ()

@end

@implementation FreighCompanyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.txtFieldName.delegate =
    self.txtFieldEmail.delegate =
    self.txtFieldPassword.delegate =
    self.txtFieldTel.delegate =
    self.txtFieldCel1.delegate =
    self.txtFieldCel2.delegate =
    self.txtFieldCity.delegate = self;
    self.txtViewDescription.delegate = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextViewDelegate
-(void)textViewDidBeginEditing:(UITextView *)textView{
    
    self.txtViewDescription.text = nil;
    
}

-(void)textViewDidChange:(UITextView *)textView{
    
    NSUInteger length;
    length = [self.txtViewDescription.text length];
    
    NSString * last = [NSString stringWithFormat:@"%lu", 70 - length];
    
    [self.labelWordCount setText:[NSString stringWithFormat:@"%@",last]];
    
    NSLog(@"%@" , last);
    
}
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    
    if(range.length + range.location > self.txtViewDescription.text.length)
    {
        return NO;
    }
    
    NSUInteger newLength = [self.txtViewDescription.text length] + [text length] - range.length;
    return (newLength > 160) ? NO : YES;
    
}

#pragma mark - UITextFieldDelegate

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if (textField == self.txtFieldName) {
        [self.txtFieldEmail becomeFirstResponder];
    }
    else if (textField == self.txtFieldEmail) {
        [self.txtFieldPassword becomeFirstResponder];
    }
    else if (textField == self.txtFieldPassword) {
        [self.txtFieldTel becomeFirstResponder];
    }
    else if (textField == self.txtFieldTel) {
        [self.txtFieldCel1 becomeFirstResponder];
    }
    else if (textField == self.txtFieldCel1) {
        
        [self.txtFieldCel2 becomeFirstResponder];
    }
    else if (textField == self.txtFieldCel2){
        
        [self.txtFieldCity becomeFirstResponder];
    }
    else if (textField == self.txtFieldCity){
        [self.txtFieldCity resignFirstResponder];
    }
    
    return YES;
}


- (IBAction)cancelSignUp:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)chooseVehicleType:(id)sender {
    
    
    if (self.imgViewUserPhoto.image == nil) {
       
        UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Erro" message:@"Selecione uma foto!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [errorAlertView show];
        
    
        
    
    } else if (self.txtFieldName.text.length == 0 || self.txtFieldPassword.text.length == 0) {
            //        NSString *errorString = [[error userInfo] objectForKey:@"Confira os seus dados!"];
            UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Erro" message:@"Preencha os campos em branco!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [errorAlertView show];
    } else {
        
    
    PFUser *user = [self setUpFreightUser:sender];
    
    
    
    // Show an alert for success or error - Write user Keys to Parse
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            
            
                           // else is a freight company, send to select a vehicle type
                
                //Instantiate the navigation
                UINavigationController *vehicleTypeCheck = (UINavigationController*)[self.storyboard instantiateViewControllerWithIdentifier:@"VehicleTypeController"];
                
                // Check the vehicle type for the specific user
                VehicleTypeSignUpTableViewController *vehicleType = (VehicleTypeSignUpTableViewController*)[vehicleTypeCheck.viewControllers objectAtIndex:0];
                vehicleType .freightUser = user;
                
                // Present categories to be chosen
                [self presentViewController:vehicleTypeCheck animated:YES completion:nil];
            
            
            
            // If something is wrong, show an alert
        } else {
            
            //Something bad has ocurred
            NSString *errorString = [[error userInfo] objectForKey:@"Confira os seus dados!"];
            UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Erro" message:errorString delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [errorAlertView show];
        }
    }];
        
        
    }

    
    
}

- (IBAction)addUserPhoto:(id)sender {
    
    UIActionSheet *showUploadOptions = [[UIActionSheet alloc]initWithTitle:@"Foto"
                                                                  delegate:self
                                                         cancelButtonTitle:@"Cancelar"
                                                    destructiveButtonTitle:nil
                                                         otherButtonTitles:@"Câmera",@"Biblioteca", nil];
    [showUploadOptions showInView:self.view];
    
}


- (PFUser*)setUpFreightUser:(id)sender {
    
    
    // Instanciate user class and its atributes
    PFUser *user = [PFUser user];
    //PFObject *freights = [PFObject objectWithClassName:@"Freights"];
    
    // Show an alert if user or password fields are left in blank
    
    
    
    // Create a User for normal users or freight companies
    user.username = self.txtFieldEmail.text;
    user.password = self.txtFieldPassword.text;
    user.email = self.txtFieldEmail.text;
    
    
    [user setObject:self.txtFieldName.text forKey:@"name"];
    [user setObject:self.txtFieldTel.text forKey:@"telephone"];
    [user setObject:self.txtFieldCel1.text forKey:@"mobile1"];
    [user setObject:self.txtFieldCel2.text forKey:@"mobile2"];
    [user setObject:self.txtFieldCity.text forKey:@"city"];
    [user setObject:@"Prestador de Serv." forKey:@"freightUserType"];
    
    // Set State
    if (self.segmentedState.selectedSegmentIndex == 0) {
        [user setObject:@"RJ" forKey:@"state"];
    }
    
    if (self.segmentedState.selectedSegmentIndex == 1) {
        [user setObject:@"SP" forKey:@"state"];
    }
    
    // Set normal users
    if (self.segmentedCompanyType.selectedSegmentIndex == 0) {
        
        // Set previously selected segmented on its class
        [user setObject:@"Empresa" forKey:@"companyType"];
        
    }
    
    
    // Set Freight users
    if (self.segmentedCompanyType.selectedSegmentIndex == 1) {
        
        [user setObject:@"Autônomo" forKey:@"companyType"];
        
        
    }
    
    [user setObject:self.txtViewDescription.text forKey:@"freightDescription"];
    
    //Handle image upload
    NSData *imageData = UIImageJPEGRepresentation(self.imgViewUserPhoto.image, 0.8);
    NSString *filename = [NSString stringWithFormat:@"userPhoto.png"];
    PFFile *imageFile = [PFFile fileWithName:filename data:imageData];
    [user setObject:imageFile forKey:@"userPhoto"];
    
    
    
    return user;
    
    
}

#pragma mark - UIImagePickerDelegate

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    UIImage *freighUserImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.imgViewUserPhoto.image = freighUserImage;
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}

#pragma mark - UIActionSheetDelegate

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    switch (buttonIndex) {
        case 0:{
            
            UIImagePickerController *Camera = [[UIImagePickerController alloc]init];
            Camera.delegate = self;
            Camera.sourceType = UIImagePickerControllerSourceTypeCamera;
            [self presentViewController:Camera animated:YES completion:nil];
            
            break;
        }
        case 1:{
            UIImagePickerController *Libray = [[UIImagePickerController alloc]init];
            Libray.delegate = self;
            Libray.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            [self presentViewController:Libray animated:YES completion:nil];
            
            break;
        }
        case 2:{
            
            
            break;
        }
        
        default:
            break;
    }
    
    
}


@end






























