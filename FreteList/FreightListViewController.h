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
#import "CityTypeFilterTableViewController.h"
#import "FlurryAdInterstitialDelegate.h"

@interface FreightListViewController : PFQueryTableViewController<vehicleTypeFilterDelegate,companyTypeFilterDelegate,cityTypeFilterDelegate,UIActionSheetDelegate, FlurryAdInterstitialDelegate>


@property(nonatomic, strong) PFObject *clickedCell;
@property(nonatomic, strong) PFObject *clickedFreight;
@property (weak, nonatomic) IBOutlet PFImageView *paidOfferImageView;
@property (weak, nonatomic) IBOutlet UIView *paidOfferView;

// Created an Array for featuredCategories
@property (nonatomic, strong) NSArray *featCategories;

//Create an Array for freight types
@property (nonatomic, strong) NSArray *featTypes;

//Create an NSString for comapny types(you can only select one)
@property (nonatomic, strong)NSString *companyType;

//Create an NSString for city types(you can only select one for now - in other versions change it to an Array)
@property (nonatomic, strong)NSString *cityType;

- (IBAction)showFilter:(id)sender;
- (IBAction)showVehiclesInfo:(id)sender;

@end
