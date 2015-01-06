//
//  FilterViewController.m
//  FreteList
//
//  Created by Joao Paulo Galvao Alves on 12/27/14.
//  Copyright (c) 2014 FreteList. All rights reserved.
//

#import "FilterViewController.h"

@interface FilterViewController ()

@end

@implementation FilterViewController


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.motoFreightButton.layer.borderWidth = 0.5f;
    self.motoFreightButton.layer.borderColor = [[UIColor blackColor] CGColor];
    
    self.sTruckButton.layer.borderWidth = 0.5f;
    self.sTruckButton.layer.borderColor = [[UIColor blackColor] CGColor];
    
    self.mTruckButton.layer.borderWidth = 0.5f;
    self.mTruckButton.layer.borderColor = [[UIColor blackColor] CGColor];
    
    self.lTruckButton.layer.borderWidth = 0.5f;
    self.lTruckButton.layer.borderColor = [[UIColor blackColor] CGColor];
    
    self.sLorryButton.layer.borderWidth = 0.5f;
    self.sLorryButton.layer.borderColor = [[UIColor blackColor] CGColor];
    
    self.mLorryButton.layer.borderWidth = 0.5f;
    self.mLorryButton.layer.borderColor = [[UIColor blackColor] CGColor];
    
    self.lLorryButton.layer.borderWidth = 0.5f;
    self.lLorryButton.layer.borderColor = [[UIColor blackColor] CGColor];
    
    self.truckButton.layer.borderWidth = 0.5f;
    self.truckButton.layer.borderColor = [[UIColor blackColor] CGColor];
    
    self.carButton.layer.borderWidth = 0.5f;
    self.carButton.layer.borderColor = [[UIColor blackColor] CGColor];
    
    self.privateButton.layer.borderWidth = 0.5f;
    self.privateButton.layer.borderColor = [[UIColor blackColor] CGColor];
    
    self.corporateButton.layer.borderWidth = 0.5f;
    self.corporateButton.layer.borderColor = [[UIColor blackColor] CGColor];
}


#pragma mark - Actions


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)dismissFilter:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
