//
//  FilterViewController.h
//  FreteList
//
//  Created by Joao Paulo Galvao Alves on 12/27/14.
//  Copyright (c) 2014 FreteList. All rights reserved.
//

#import <UIKit/UIKit.h>

//Set of instructions to pass Features Categories I selected
@protocol sendFeatures <NSObject>

-(void)sendFeaturesToMainController:(NSArray*)arrayOfFeatures;
-(void)sendTypesToMainController:(NSArray*)arrayOfTypes;

@end

@interface FilterViewController : UIViewController

//Create a delegate property to pass the protocol
@property(nonatomic, assign) id delegate;

//Creates de Array of Categories I will select
@property(nonatomic, strong) NSArray *filterArray;

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

//Creates the NSMutableArray property for categories I may select or not
@property (nonatomic, strong)NSMutableArray *catArray;

//Creates the NSMutableArray property for categories I may select or not
@property (nonatomic, strong)NSMutableArray *typesArray;

//Button Actions
- (IBAction)filterMotoFreights:(id)sender;
- (IBAction)filterSTrucks:(id)sender;
- (IBAction)filterMtrucks:(id)sender;
- (IBAction)filterLtrucks:(id)sender;
- (IBAction)filterSlorry:(id)sender;
- (IBAction)filterMlorry:(id)sender;
- (IBAction)filterLlorry:(id)sender;
- (IBAction)filterTrucks:(id)sender;
- (IBAction)filterCars:(id)sender;
- (IBAction)filterPrivate:(id)sender;
- (IBAction)filterCorporate:(id)sender;



- (IBAction)dismissFilter:(id)sender;
- (IBAction)filter:(id)sender;
-(void)checkFeature:(NSString *)feature;
-(void)checkType: (NSString *)typeFreight;

@end
