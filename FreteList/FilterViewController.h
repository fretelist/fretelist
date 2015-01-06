//
//  FilterViewController.h
//  FreteList
//
//  Created by Joao Paulo Galvao Alves on 12/27/14.
//  Copyright (c) 2014 FreteList. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FilterViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *motoFreightButton;

@property (weak, nonatomic) IBOutlet UIButton *sTruckButton;
@property (weak, nonatomic) IBOutlet UIButton *mTruckButton;
@property (weak, nonatomic) IBOutlet UIButton *lTruckButton;


@property (weak, nonatomic) IBOutlet UIButton *sLorryButton;
@property (weak, nonatomic) IBOutlet UIButton *mLorryButton;
@property (weak, nonatomic) IBOutlet UIButton *lLorryButton;

@property (weak, nonatomic) IBOutlet UIButton *truckButton;
@property (weak, nonatomic) IBOutlet UIButton *carButton;


//Freight Types
@property (weak, nonatomic) IBOutlet UIButton *privateButton;
@property (weak, nonatomic) IBOutlet UIButton *corporateButton;

- (IBAction)dismissFilter:(id)sender;

@end
