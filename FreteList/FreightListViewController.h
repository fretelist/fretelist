//
//  DealsListViewController.h
//  tenhoDesconto
//
//  Created by Joao Paulo Galvao Alves on 11/20/14.
//  Copyright (c) 2014 tenhoDesconto. All rights reserved.
//

#import <Parse/Parse.h>
#import "VehicleTypeFilterViewController.h"

@interface FreightListViewController : PFQueryTableViewController<vehicleTypeFilterDelegate,UIActionSheetDelegate>


@property(nonatomic, strong) PFObject *clickedCell;
@property(nonatomic, strong) PFObject *clickedDeal;
@property (weak, nonatomic) IBOutlet PFImageView *paidOfferImageView;
@property (weak, nonatomic) IBOutlet UIView *paidOfferView;

// Created an Array for featuredCategories
@property (nonatomic, strong) NSArray *featCategories;

//Create an Array for freight types
@property (nonatomic, strong) NSArray *featTypes;

- (IBAction)showFilter:(id)sender;

@end
