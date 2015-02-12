//
//  VehicleInfoCustomCell.h
//  FreteList
//
//  Created by Joao Alves on 2/12/15.
//  Copyright (c) 2015 FreteList. All rights reserved.
//

#import <Parse/Parse.h>

@interface VehicleInfoCustomCell : PFTableViewCell
@property (weak, nonatomic) IBOutlet UIView *vehicleInfoView;
@property (weak, nonatomic) IBOutlet UILabel *vehicleInfoTitle;
@property (weak, nonatomic) IBOutlet UILabel *vehicleInfoDescription;

@end
