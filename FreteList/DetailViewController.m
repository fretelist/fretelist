//
//  DetailViewController.m
//  tenhoDesconto
//
//  Created by Joao Paulo Galvao Alves on 11/22/14.
//  Copyright (c) 2014 tenhoDesconto. All rights reserved.
//

#import "DetailViewController.h"
#import "FreightDetailCustomCell.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"ClickedData: %@",self.clickedFreightDetail);
    
    self.navigationItem.title = [self.clickedFreightDetail objectForKey:@"name"];
    
    //Texts
    self.labelDetailName.text = [self.clickedFreightDetail objectForKey:@"name"];
    self.labelDetailCompanyType.text = [self.clickedFreightDetail objectForKey:@"companyType"];
    self.labelDetailDescription.text = [self.clickedFreightDetail objectForKey:@"freightDescription"];
    self.labelDetailCity.text = [self.clickedFreightDetail objectForKey:@"city"];
    self.labelDetailState.text = [self.clickedFreightDetail objectForKey:@"state"];
    self.txtViewDetailTelefone.text = [self.clickedFreightDetail objectForKey:@"telephone"];
    self.txtViewDetailMob1.text = [self.clickedFreightDetail objectForKey:@"mobile1"];
    self.txtViewDetailMob2.text = [self.clickedFreightDetail objectForKey:@"mobile2"];
    
    
    
    //Vehicle Types
    NSArray *arrayOfTypes = [self.clickedFreightDetail objectForKey:@"vehicleType"];
    self.labelDetailVehicleType.text = [[arrayOfTypes valueForKey:@"categories"] componentsJoinedByString:@" / "];
    
    //Photos
    PFFile *thumbnail = [self.clickedFreightDetail objectForKey:@"userPhoto"];
    self.imgViewDetailPhoto.image = [UIImage imageNamed:@"promotion_logo_placeholder.png"];
    self.imgViewDetailPhoto.file = thumbnail;
    [self.imgViewDetailPhoto loadInBackground];

   

}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
























