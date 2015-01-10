//
//  FilterViewController.m
//  FreteList
//
//  Created by Joao Paulo Galvao Alves on 12/27/14.
//  Copyright (c) 2014 FreteList. All rights reserved.
//

#import "FilterViewController.h"
#import <Parse/Parse.h>

@interface FilterViewController ()

@end

@implementation FilterViewController{
    
}


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
    
    //
    if (self.catArray == nil) {
        self.catArray = [[NSMutableArray alloc]init];
    }
    
    //Check strings for each button, that will be added to catArray
    for (NSString *features in self.catArray) {
        if ([features isEqualToString:@"Cars"])  {
            self.carButton.selected = YES;
        }
        
        if ([features isEqualToString:@"S Lorry"])  {
            self.sLorryButton.selected = YES;
        }
    }
    
    
    
    
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

- (IBAction)filterMotoFreights:(id)sender {
    
    if (self.motoFreightButton.selected) {
        [self.motoFreightButton setSelected:NO];
    }
    else {
       [self.motoFreightButton setSelected:YES];
    }
}

- (IBAction)filterSTrucks:(id)sender {
    
    if (self.sTruckButton.selected) {
        [self.sTruckButton setSelected:NO];
    }
    else {
        [self.sTruckButton setSelected:YES];
    }
    
}

- (IBAction)filterMtrucks:(id)sender {
    
    
    if (self.mTruckButton.selected) {
        [self.mTruckButton setSelected:NO];
    }
    else {
        [self.mTruckButton setSelected:YES];
    }

    
    
}

- (IBAction)filterLtrucks:(id)sender {
    
    if (self.lTruckButton.selected) {
        [self.lTruckButton setSelected:NO];
    }
    else {
        [self.lTruckButton setSelected:YES];
    }
    
}

- (IBAction)filterSlorry:(id)sender {
    
    [self checkFeature:@"S Lorry"];
    self.sLorryButton.selected = !self.sLorryButton.selected;
    
    
    
}

- (IBAction)filterMlorry:(id)sender {
    
    if (self.mLorryButton.selected) {
        [self.mLorryButton setSelected:NO];
    }
    else {
        [self.mLorryButton setSelected:YES];
    }
    
    
}

- (IBAction)filterLlorry:(id)sender {
    
    if (self.lLorryButton.selected) {
        [self.lLorryButton setSelected:NO];
    }
    else {
        [self.lLorryButton setSelected:YES];
    }
}

- (IBAction)filterTrucks:(id)sender {
    
    if (self.truckButton.selected) {
        [self.truckButton setSelected:NO];
    }
    else {
        [self.truckButton setSelected:YES];
    }
}

- (IBAction)filterCars:(id)sender {
    
    [self checkFeature:@"Cars"];
    self.carButton.selected = !self.carButton.selected;

}

- (IBAction)filterPrivate:(id)sender {
    
    if (self.privateButton.selected) {
        [self.privateButton setSelected:NO];
    }
    else {
        [self.privateButton setSelected:YES];
    }
    
}

- (IBAction)filterCorporate:(id)sender {
    
    self.corporateButton.selected = !self.corporateButton.selected;
    
}



- (IBAction)dismissFilter:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)filter:(id)sender {
    
    //Sends 
    [self.delegate sendFeaturesToMainController:[NSArray arrayWithArray:self.catArray]];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)checkFeature:(NSString *)feature{
    
    if ([self.catArray containsObject:feature]) {
        [self.catArray removeObject:feature];
    } else {
        [self.catArray addObject:feature];
    }
    
}

@end
















