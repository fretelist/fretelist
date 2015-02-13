//
//  CityTypeFilterTableViewController.h
//  FreteList
//
//  Created by Joao Alves on 2/13/15.
//  Copyright (c) 2015 FreteList. All rights reserved.
//

#import <Parse/Parse.h>

@protocol cityTypeFilterDelegate <NSObject>

-(void)sendCityTypeFiltersToMainController:(NSString*)cityTypes;

@end

@interface CityTypeFilterTableViewController : UITableViewController

@property(nonatomic, assign) id delegate;
@property (nonatomic, strong)NSArray *cityTypes;
@property (nonatomic, strong)NSString *cityTypeSelected;

- (IBAction)closeCityTypeFilter:(id)sender;
- (IBAction)applyCityTypeFilter:(id)sender;


@end
