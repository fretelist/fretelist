//
//  FreightDetailCustomCell.h
//  FreteList
//
//  Created by Joao Alves on 2/23/15.
//  Copyright (c) 2015 FreteList. All rights reserved.
//

#import <ParseUI/ParseUI.h>

@interface FreightDetailCustomCell : PFTableViewCell

@property (weak, nonatomic) IBOutlet UILabel *labelDetailName;
@property (weak, nonatomic) IBOutlet UILabel *labelDetailCompanyType;
@property (weak, nonatomic) IBOutlet UILabel *labelDetailDescription;
@property (weak, nonatomic) IBOutlet UILabel *labelDetailVehicleType;
@property (weak, nonatomic) IBOutlet UILabel *labelDetailCity;
@property (weak, nonatomic) IBOutlet UILabel *labelDetailState;

@property (weak, nonatomic) IBOutlet UITextView *txtViewDetailTelephone;
@property (weak, nonatomic) IBOutlet UITextView *txtViewDetailMobile1;
@property (weak, nonatomic) IBOutlet UITextView *txtViewDetailMobile2;
@property (weak, nonatomic) IBOutlet PFImageView *imgDetailUserPhoto;



@end
