//
//  VehicleInfoTableViewController.h
//  FreteList
//
//  Created by Joao Alves on 2/12/15.
//  Copyright (c) 2015 FreteList. All rights reserved.
//

#import <ParseUI/ParseUI.h>


@interface VehicleInfoTableViewController : PFQueryTableViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnCancel;

- (IBAction)closeInfo:(id)sender;

@end
