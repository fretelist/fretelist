//
//  DealsListViewController.h
//  tenhoDesconto
//
//  Created by Joao Paulo Galvao Alves on 11/20/14.
//  Copyright (c) 2014 tenhoDesconto. All rights reserved.
//

#import <Parse/Parse.h>
#import "FilterViewController.h"

@interface DealsListViewController : PFQueryTableViewController<sendFeatures>

@property(nonatomic, strong) PFObject *clickedCell;
@property(nonatomic, strong) PFObject *clickedDeal;
@property (weak, nonatomic) IBOutlet PFImageView *paidOfferImageView;
@property (weak, nonatomic) IBOutlet UIView *paidOfferView;

// Created an Array for featuredCategories
@property (nonatomic, strong) NSArray *featCategories;

- (IBAction)showFilter:(id)sender;

@end
