//
//  VehiclesViewController.h
//  FreteList
//
//  Created by Joao Paulo Galvao Alves on 1/17/15.
//  Copyright (c) 2015 FreteList. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ParseUI/ParseUI.h>

@interface VehicleTypeSignUpTableViewController : PFQueryTableViewController

@property(nonatomic, strong)PFUser *freightUser;
@property(nonatomic, strong)NSMutableArray *categoriesSelected;
- (IBAction)saveVehicleTypes:(id)sender;

@end
