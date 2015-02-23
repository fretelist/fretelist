//
//  FreightDetailCustomCell.h
//  FreteList
//
//  Created by Joao Alves on 2/23/15.
//  Copyright (c) 2015 FreteList. All rights reserved.
//

#import <Parse/Parse.h>

@interface FreightDetailCustomCell : PFTableViewCell

@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UILabel *labelCompanyType;
@property (weak, nonatomic) IBOutlet UILabel *labelDescription;
@property (weak, nonatomic) IBOutlet UILabel *labelVehicleType;
@property (weak, nonatomic) IBOutlet UILabel *labelCity;
@property (weak, nonatomic) IBOutlet UILabel *labelState;

@property (weak, nonatomic) IBOutlet UITextView *txtViewTelephone;
@property (weak, nonatomic) IBOutlet UITextView *txtViewMobile1;
@property (weak, nonatomic) IBOutlet UITextView *txtViewMobile2;



@end
