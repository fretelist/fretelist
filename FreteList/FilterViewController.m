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
