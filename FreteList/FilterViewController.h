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




- (IBAction)dismissFilter:(id)sender;

@end
