//
//  DetailViewController.h
//  tenhoDesconto
//
//  Created by Joao Paulo Galvao Alves on 11/22/14.
//  Copyright (c) 2014 tenhoDesconto. All rights reserved.
//

#import <ParseUI/ParseUI.h>
#import <Parse/Parse.h>

@interface DetailViewController : UIViewController<UINavigationControllerDelegate>

@property(nonatomic, strong) PFObject *clickedFreightDetail;
@property (weak, nonatomic) IBOutlet PFImageView *imgViewDetailPhoto;

@property (weak, nonatomic) IBOutlet UILabel *labelDetailName;

@property (weak, nonatomic) IBOutlet UILabel *labelDetailCompanyType;
@property (weak, nonatomic) IBOutlet UILabel *labelDetailDescription;
@property (weak, nonatomic) IBOutlet UILabel *labelDetailVehicleType;

@property (weak, nonatomic) IBOutlet UILabel *labelDetailCity;

@property (weak, nonatomic) IBOutlet UILabel *labelDetailState;

@property (weak, nonatomic) IBOutlet UITextView *txtViewDetailTelefone;
@property (weak, nonatomic) IBOutlet UITextView *txtViewDetailMob1;
@property (weak, nonatomic) IBOutlet UITextView *txtViewDetailMob2;

@property (nonatomic, strong)NSMutableArray *arrayOfVehicleTypesFromSearch;

@end
