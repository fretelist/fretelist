//
//  MyAccountTableViewController.m
//  FreteList
//
//  Created by Joao Paulo Galvao Alves on 2/7/15.
//  Copyright (c) 2015 FreteList. All rights reserved.
//

#import "MyAccountTableViewController.h"
#import "VehicleTypeFilterViewController.h"
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
    
    self.isCliente = [[[PFUser currentUser] objectForKey:@"freightUserType"] isEqualToString:@"Cliente"];
    
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
    self.txtFieldDescription.text = [[PFUser currentUser] objectForKey:@"freightDescription"];
    
    //
    
    
    //Pass the selected state, otherwise crash will occur, due to Parse understanding what is being saved as nil
    self.pickerSelectedNewString = [[PFUser currentUser] objectForKey:@"state"];
    
    
    if (self.isCliente) {
        
        self.txtFieldTelephone.hidden = YES;
        self.txtFieldMob1.hidden = YES;
        self.txtFieldMob2.hidden = YES;
        self.txtFieldDescription.hidden = YES;
        self.btnChangePhoto.hidden = YES;
        self.btnChangeVehicleType.hidden = YES;
        self.labelTelephone.hidden = YES;
        self.labelMob1.hidden = YES;
        self.labelVehicleType.hidden = YES;
        self.labelMob2.hidden = YES;
        self.labelDescription.hidden = YES;
        
        self.myAccountStateData = [NSMutableArray arrayWithArray:self.myAccountUserStateArray] ;
        [self.pickerMyAccountState reloadAllComponents];
        
    } else {
        
        PFUser *userMyAccountCategories = [PFUser currentUser];
        [userMyAccountCategories fetch];
        
        NSArray *arrayOfCategories = [userMyAccountCategories objectForKey:@"vehicleType"];
        self.myAccountVehicleTypes = [[NSMutableArray alloc]init];
        
        for (PFObject *category in arrayOfCategories) {
            [category fetch];
            
            [self.myAccountVehicleTypes addObject:category];
        }
        
        NSString *result = [[self.myAccountVehicleTypes valueForKey:@"categories"] componentsJoinedByString:@","];
        self.labelVehicleType.text = result;
        
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

-(void)viewDidAppear:(BOOL)animated{
    
    PFUser *currentUser = [PFUser currentUser];
    
    NSString *userState = [currentUser objectForKey:@"state"];
    
    
    if (userState) {
        
        [self.pickerMyAccountState selectRow:[self.myAccountStateData indexOfObject:userState] inComponent:0 animated:YES];
        
    }
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    if (self.isCliente == NO) {
        NSString *result = [[self.myAccountVehicleTypes valueForKey:@"categories"] componentsJoinedByString:@","];
        self.labelVehicleType.text = result;
    }
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PFUser *currentUser = [PFUser currentUser];
    
    BOOL isCliente = [[currentUser objectForKey:@"freightUserType"] isEqualToString:@"Cliente"];
    BOOL isNormalUserCell = (indexPath.row == 0|| indexPath.row == 1 || indexPath.row == 5 || indexPath.row == 6 || indexPath.row == 7 || indexPath.row == 10);
    
    if (isNormalUserCell && isCliente) {
        return 0;
    } else if (indexPath.row == 0){
        return 105;
    } else if (indexPath.row == 9){
        return 105;
    }
    
    return 44;
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
    
    UIActionSheet *showUploadOptions = [[UIActionSheet alloc]initWithTitle:@"Foto"
                                                                  delegate:self
                                                         cancelButtonTitle:@"Cancel"
                                                    destructiveButtonTitle:nil
                                                         otherButtonTitles:@"Câmera",@"Biblioteca", nil];
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
        [currentUser setObject:self.myAccountVehicleTypes forKey:@"vehicleType"];
        
        // If it is not a normal user, save Photo. If it is a normal user, do not save, otherwise it will crash, as the field is disabled
        if (!self.isCliente) {
            
            NSData *newUserData = UIImageJPEGRepresentation(self.imgViewUserPhoto.image, 0.8);
            PFFile *newUserFile = [PFFile fileWithName:@"userPhoto.jpeg" data:newUserData];
            
            [currentUser setObject:newUserFile forKey:@"userPhoto"];
        }
       
        
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
        self.txtFieldDescription.enabled = YES;
        self.btnChangePhoto.enabled = YES;
        self.btnChangeVehicleType.enabled = YES;
        self.btnLogout.enabled = YES;
        self.pickerMyAccountState.userInteractionEnabled = YES;
        [self.btnCancel setEnabled:YES];
        [self.btnCancel setTintColor:self.view.tintColor];
        [self.btnSave setTitle:@"Salvar"];
        
    }
    
    
    
}

- (IBAction)cancelInfos:(id)sender {
    
    [self disableEdit];

    
    
}

- (IBAction)showMyAccountVehicleTypes:(id)sender {
    
    //Cast FilterViewController
    UINavigationController *navigationView = (UINavigationController*)[self.storyboard instantiateViewControllerWithIdentifier:@"VehicleTypeFilterNav" ];
    
    VehicleTypeFilterViewController *filterView = (VehicleTypeFilterViewController*)[navigationView.viewControllers objectAtIndex:0];
    
    
    //Init with an empty array, as I have not selected anything yet
    
    filterView.vehicleTypeFilter = [[NSMutableArray alloc] initWithArray:self.myAccountVehicleTypes];
    filterView.delegate = self;
    
    
    [self presentViewController:navigationView animated:YES completion:nil];
    
    
    
}

-(void) disableEdit{
    
    self.txtFieldName.enabled = NO;
    self.txtFieldEmail.enabled = NO;
    self.txtFieldPsswd.enabled = NO;
    self.txtFieldTelephone.enabled = NO;
    self.txtFieldMob1.enabled = NO;
    self.txtFieldMob2.enabled = NO;
    self.txtFieldCity.enabled = NO;
    self.txtFieldDescription.enabled = NO;
    self.btnChangePhoto.enabled = NO;
    self.btnChangeVehicleType.enabled = NO;
    self.btnLogout.enabled = NO;
    [self.btnCancel setEnabled:NO];
    self.pickerMyAccountState.userInteractionEnabled = NO;
    [self.btnCancel setTintColor:[UIColor clearColor]];
    [self.btnSave setTitle:@"Editar"];
    
    
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
    
//    PFUser *currentUser = [PFUser currentUser];
//    
//    NSString *userState = [currentUser objectForKey:@"state"];
//    
    NSString *currentState = [self.myAccountStateData objectAtIndex:row];
//    
//    if (userState) {
//    
//        [pickerView selectRow:[self.myAccountStateData indexOfObject:userState] inComponent:component animated:YES];
//        
//    }
//    
//    
//    
    return currentState;
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

#pragma mark - VehicleTypeFilterDelegate

-(void)sendVehicleTypeFiltersToMainController:(NSArray *)arrayOfVehicleTypes{
    
    NSMutableArray *myAccountTemp = [[NSMutableArray alloc]initWithArray:arrayOfVehicleTypes];
    self.myAccountVehicleTypes = myAccountTemp;
    
    
    
}

@end


















