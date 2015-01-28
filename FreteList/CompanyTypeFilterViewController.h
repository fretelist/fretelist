//
//  CompanyTypeFilterViewController.h
//  FreteList
//
//  Created by Joao Paulo Galvao Alves on 1/28/15.
//  Copyright (c) 2015 FreteList. All rights reserved.
//

#import <Parse/Parse.h>

@protocol companyTypeFilterDelegate <NSObject>

-(void)sendCompanyTypeFiltersToMainController:(NSString*)companyTypes;

@end


@interface CompanyTypeFilterViewController : UITableViewController

@property(nonatomic, assign) id delegate;
@property (nonatomic, strong)NSArray *companyTypes;
@property (nonatomic, strong)NSString *companyTypeSelected;

- (IBAction)closeCompanyTypeFilter:(id)sender;

- (IBAction)applyCompanyTypeFilter:(id)sender;

@end
