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
    
    
    //Create each button's borders
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
    
    //If the Array of categories is empty, initialize it
    if (self.catArray == nil) {
        self.catArray = [[NSMutableArray alloc]init];
    }
    
    //If the Array of types is empty, initialize it
    if (self.typesArray == nil) {
        self.typesArray = [[NSMutableArray alloc]init];
    }
    
    //Check strings for each button, that will be added to catArray
    for (NSString *features in self.catArray) {
        if ([features isEqualToString:@"Moto Freight"])  {
            self.motoFreightButton.selected = YES;
        }
        
        if ([features isEqualToString:@"S Trucks"])  {
            self.sTruckButton.selected = YES;
        }
        
        if ([features isEqualToString:@"M Trucks"])  {
            self.mTruckButton.selected = YES;
        }
        
        if ([features isEqualToString:@"L Trucks"])  {
            self.lTruckButton.selected = YES;
        }
        
        if ([features isEqualToString:@"S Lorry"])  {
            self.sLorryButton.selected = YES;
        }
        
        if ([features isEqualToString:@"M Lorry"])  {
            self.mLorryButton.selected = YES;
        }
        
        if ([features isEqualToString:@"L Lorry"])  {
            self.lLorryButton.selected = YES;
        }
        
        if ([features isEqualToString:@"Trucks"])  {
            self.truckButton.selected = YES;
        }
        
        if ([features isEqualToString:@"Cars"])  {
            self.carButton.selected = YES;
        }
        
    }
    
   
    //Check strings for each button, that will be added to typesArray
    for (NSString *types in self.typesArray) {
        if ([types isEqualToString:@"Corporate"]) {
            self.corporateButton.selected = YES;
        }
        
        if ([types isEqualToString:@"Private"]) {
            self.privateButton.selected = YES;
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
    
    [self checkFeature:@"Moto Freight"];
    self.motoFreightButton.selected = !self.motoFreightButton.selected;
}

- (IBAction)filterSTrucks:(id)sender {
    
    [self checkFeature:@"S Trucks"];
    self.sTruckButton.selected = !self.sTruckButton.selected;
    
}

- (IBAction)filterMtrucks:(id)sender {
    
    
    [self checkFeature:@"M Trucks"];
    self.mTruckButton.selected = !self.mTruckButton.selected;

    
    
}

- (IBAction)filterLtrucks:(id)sender {
    
    [self checkFeature:@"L Trucks"];
    self.lTruckButton.selected = !self.lTruckButton.selected;
    
}

- (IBAction)filterSlorry:(id)sender {
    
    [self checkFeature:@"S Lorry"];
    self.sLorryButton.selected = !self.sLorryButton.selected;
    
    
    
}

- (IBAction)filterMlorry:(id)sender {
    
    [self checkFeature:@"M Lorry"];
    self.mLorryButton.selected = !self.mLorryButton.selected;
    
}

- (IBAction)filterLlorry:(id)sender {
    
    [self checkFeature:@"L Lorry"];
    self.lLorryButton.selected = !self.lLorryButton.selected;
}

- (IBAction)filterTrucks:(id)sender {
    
    [self checkFeature:@"Trucks"];
    self.truckButton.selected = !self.truckButton.selected;
}

- (IBAction)filterCars:(id)sender {
    
    [self checkFeature:@"Cars"];
    self.carButton.selected = !self.carButton.selected;

}

- (IBAction)filterPrivate:(id)sender {
    
    [self checkType:@"Private"];
    self.privateButton.selected = !self.privateButton.selected;
    
}

- (IBAction)filterCorporate:(id)sender {
    
    [self checkType:@"Corporate"];
    self.corporateButton.selected = !self.corporateButton.selected;
    
}



- (IBAction)dismissFilter:(id)sender {
    
    //[self.delegate sendFeaturesToMainController:[NSArray arrayWithArray:self.catArray]];
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

-(void)checkType:(NSString *)typeFreight{
    
    if ([self.typesArray containsObject:typeFreight]) {
        [self.typesArray removeObject:typeFreight];
    }else {
        [self.typesArray addObject:typeFreight];
    }
}

@end
















