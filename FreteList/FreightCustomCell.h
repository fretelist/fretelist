//
//  FreightCustomCell.h
//  FreteList
//
//  Created by Joao Paulo Galvao Alves on 1/21/15.
//  Copyright (c) 2015 FreteList. All rights reserved.
//

#import <Parse/Parse.h>
#import <ParseUI/ParseUI.h>

@interface FreightCustomCell : PFTableViewCell

@property(nonatomic, weak) IBOutlet UILabel *labelName;
@property(nonatomic, weak) IBOutlet UILabel *labelDescription;
@property(nonatomic, weak) IBOutlet UILabel *labelCity;
@property(nonatomic, weak) IBOutlet UILabel *labelState;
//@property(nonatomic, weak) IBOutlet UILabel *labelTelephone;
@property (weak, nonatomic) IBOutlet UILabel *labelCompanyType;

@property (weak, nonatomic) IBOutlet UITextView *txtViewTelephone;

@property (weak, nonatomic) IBOutlet UILabel *labelType;
@property (weak, nonatomic) IBOutlet PFImageView *imgUserPhoto;

@end
