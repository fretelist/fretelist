//
//  VehicleTypeFilterViewController.h
//  FreteList
//
//  Created by Joao Paulo Galvao Alves on 1/22/15.
//  Copyright (c) 2015 FreteList. All rights reserved.
//

#import <Parse/Parse.h>

@protocol vehicleTypeFilterDelegate <NSObject>

-(void)sendVehicleTypeFiltersToMainController:(NSArray*)arrayOfVehicleTypes;

@end

@interface VehicleTypeFilterViewController : PFQueryTableViewController

@property(nonatomic, assign) id delegate;
@property (nonatomic, strong)NSMutableArray *vehicleTypeFilter;

- (IBAction)closeVehicleType:(id)sender;
- (IBAction)applyVehicleType:(id)sender;


@end
