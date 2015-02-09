//
//  MyAccountTableViewController.m
//  FreteList
//
//  Created by Joao Paulo Galvao Alves on 2/7/15.
//  Copyright (c) 2015 FreteList. All rights reserved.
//

#import "MyAccountTableViewController.h"
#import <Parse/Parse.h>

@interface MyAccountTableViewController ()

@end

@implementation MyAccountTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //Picker load
    self.pickerMyAccountState.delegate = self;
    self.pickerMyAccountState.dataSource = self;
    
    self.myAccountUserStateArray = @[@"AC",@"AL",@"AM",@"AP",@"BA",@"CE",@"DF",@"ES",@"GO",@"MA",@"MS",@"MT",@"MG",@"PA",@"PR",@"PE",@"PI",@"RJ",@"RN",@"RS",@"RO",@"RR",@"SC",@"SP",@"SE",@"TO"];
    
    self.myAccountFreightUserStateArray = @[@"RJ",@"SP"];
    
    
    // Set cancel button disabled - enable only if edit is pressed
    [self.btnCancel setEnabled:NO];
    [self.btnCancel setTintColor:[UIColor clearColor]];
    
    self.txtFieldName.text = [[PFUser currentUser] objectForKey:@"name"];
    self.txtFieldEmail.text = [[PFUser currentUser] objectForKey:@"email"];
    self.txtFieldPsswd.text = [[PFUser currentUser] objectForKey:@"password"];
    
    self.txtFieldTelephone.text = [[PFUser currentUser] objectForKey:@"telephone"];
    self.txtFieldMob1.text = [[PFUser currentUser] objectForKey:@"mobile1"];
    self.txtFieldMob2.text = [[PFUser currentUser] objectForKey:@"mobile2"];
    self.txtFieldCity.text = [[PFUser currentUser] objectForKey:@"city"];
    self.txtFieldState.text = [[PFUser currentUser] objectForKey:@"state"];
    self.txtFieldDescription.text = [[PFUser currentUser] objectForKey:@"freightDescription"];
    [self.segmentedSatate setEnabled:NO];
    
    if ([[[PFUser currentUser] objectForKey:@"freightUserType"] isEqualToString:@"Cliente"]) {
        self.myAccountStateData = [NSMutableArray arrayWithArray:self.myAccountUserStateArray] ;
        [self.pickerMyAccountState reloadAllComponents];
    } else {
        self.myAccountStateData = [NSMutableArray arrayWithArray:self.myAccountFreightUserStateArray];
        [self.pickerMyAccountState reloadAllComponents];
    }
    
//    if ([[[PFUser currentUser] objectForKey:@"state"] isEqualToString:@"RJ"]) {
//        self.segmentedSatate.selectedSegmentIndex = 0;
//    } else {
//        self.segmentedSatate.selectedSegmentIndex = 1;
//    }
    
    PFFile *userImageFile = [[PFUser currentUser] objectForKey:@"userPhoto"];
    [userImageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
        
        NSLog(@"data: %@",data);
        if (!error) {
        
            
            UIImage *userImage = [UIImage imageWithData:data];
            self.imgViewUserPhoto.image = userImage;
            
        }
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - My Actions

- (IBAction)performLogout:(id)sender {
    
    [PFUser logOut];
    
    UINavigationController *backToInitial = (UINavigationController *)[self.storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
    
    [self presentViewController:backToInitial animated:YES completion:nil];
}

- (IBAction)changePhoto:(id)sender {
    
    UIActionSheet *showUploadOptions = [[UIActionSheet alloc]initWithTitle:@"Photo"
                                                                  delegate:self
                                                         cancelButtonTitle:@"Cancel"
                                                    destructiveButtonTitle:nil
                                                         otherButtonTitles:@"From Camera",@"From Library", nil];
    [showUploadOptions showInView:self.view];
    
    
}

- (IBAction)editInfos:(id)sender {
    
    if (self.btnCancel.enabled == YES) {
        
        PFUser *currentUser = [PFUser currentUser];
        [currentUser setObject:self.txtFieldName.text forKey:@"name"];
        
        currentUser.email = self.txtFieldEmail.text;
        currentUser.password = self.txtFieldPsswd.text;
        [currentUser setObject:self.txtFieldTelephone.text forKey:@"telephone"];
        [currentUser setObject:self.txtFieldMob1.text forKey:@"mobile1"];
        [currentUser setObject:self.txtFieldMob2.text forKey:@"mobile2"];
        [currentUser setObject:self.txtFieldCity.text forKey:@"city"];
        [currentUser setObject:self.txtFieldDescription.text forKey:@"freightDescription"];
        [currentUser setObject:self.pickerSelectedNewString forKey:@"state"];
        
        
        
//        if (self.segmentedSatate.selectedSegmentIndex == 0) {
//            [currentUser setObject:@"RJ" forKey:@"state"];
//            
//        } else {
//            [currentUser setObject:@"SP" forKey:@"state"];
//        }
        
        NSData *newUserData = UIImageJPEGRepresentation(self.imgViewUserPhoto.image, 0.8);
        PFFile *newUserFile = [PFFile fileWithName:@"userPhoto.jpeg" data:newUserData];
        
        [currentUser setObject:newUserFile forKey:@"userPhoto"];
        
        [currentUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (!error) {
                UIAlertView *alertUpdate = [[UIAlertView alloc]initWithTitle:@"Success" message:@"Infos Updated" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                [alertUpdate show];
                
                [self disableEdit];
                
            } else {
                
                UIAlertView *alertUpdateError = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Try again" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                [alertUpdateError show];
                
            }
        }];
        
    } else {
        
        self.txtFieldName.enabled = YES;
        self.txtFieldEmail.enabled = YES;
        self.txtFieldPsswd.enabled = YES;
        self.txtFieldTelephone.enabled = YES;
        self.txtFieldMob1.enabled = YES;
        self.txtFieldMob2.enabled = YES;
        self.txtFieldCity.enabled = YES;
        self.txtFieldState.enabled = YES;
        self.txtFieldDescription.enabled = YES;
        self.btnChangePhoto.enabled = YES;
        self.btnLogout.enabled = YES;
        self.pickerMyAccountState.userInteractionEnabled = YES;
        [self.btnCancel setEnabled:YES];
        [self.segmentedSatate setEnabled:YES];
        [self.btnCancel setTintColor:[UIColor darkTextColor]];
        [self.btnSave setTitle:@"Save"];
        
    }
    
    
    
}

- (IBAction)cancelInfos:(id)sender {
    
    [self disableEdit];

    
    
}

-(void) disableEdit{
    
    self.txtFieldName.enabled = NO;
    self.txtFieldEmail.enabled = NO;
    self.txtFieldPsswd.enabled = NO;
    self.txtFieldTelephone.enabled = NO;
    self.txtFieldMob1.enabled = NO;
    self.txtFieldMob2.enabled = NO;
    self.txtFieldCity.enabled = NO;
    self.txtFieldState.enabled = NO;
    self.txtFieldDescription.enabled = NO;
    self.btnChangePhoto.enabled = NO;
    self.btnLogout.enabled = NO;
    [self.btnCancel setEnabled:NO];
    [self.segmentedSatate setEnabled:NO];
    self.pickerMyAccountState.userInteractionEnabled = NO;
    [self.btnCancel setTintColor:[UIColor clearColor]];
    [self.btnSave setTitle:@"Edit"];
    
    
}

#pragma mark - UIPickerViewDelegate
// Number of columns of data
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// Number of rows of data
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return [self.myAccountStateData count];
}

// The Data to return for the row and component(column) that's being passed in
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    return [self.myAccountStateData objectAtIndex:row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    //Store the selected State in a String Variable
    self.pickerSelectedNewString = [self.myAccountStateData objectAtIndex:row];
    
    NSLog(@"Selected State: %@",[NSString stringWithFormat:@"%@",self.pickerSelectedNewString]);
    
    
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


















