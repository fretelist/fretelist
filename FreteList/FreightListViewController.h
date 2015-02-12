//
//  DealsListViewController.h
//  tenhoDesconto
//
//  Created by Joao Paulo Galvao Alves on 11/20/14.
//  Copyright (c) 2014 tenhoDesconto. All rights reserved.
//

#import <Parse/Parse.h>
#import "VehicleTypeFilterViewController.h"
#import "CompanyTypeFilterViewController.h"

@interface FreightListViewController : PFQueryTableViewController<vehicleTypeFilterDelegate,companyTypeFilterDelegate,UIActionSheetDelegate>


@property(nonatomic, strong) PFObject *clickedCell;
@property(nonatomic, strong) PFObject *clickedDeal;
@property (weak, nonatomic) IBOutlet PFImageView *paidOfferImageView;
@property (weak, nonatomic) IBOutlet UIView *paidOfferView;

// Created an Array for featuredCategories
@property (nonatomic, strong) NSArray *featCategories;

//Create an Array for freight types
@property (nonatomic, strong) NSArray *featTypes;

//Creat an NSString for comapny types(you can only select one)
@property (nonatomic, strong)NSString *companyType;

- (IBAction)showFilter:(id)sender;
- (IBAction)showVehiclesInfo:(id)sender;

@end
