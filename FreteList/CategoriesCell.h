//
//  CategoriesCell.h
//  FreteList
//
//  Created by Joao Alves on 1/19/15.
//  Copyright (c) 2015 FreteList. All rights reserved.
//

#import <Parse/Parse.h>
#import <ParseUI/ParseUI.h>

@interface CategoriesCell : PFTableViewCell

@property (weak, nonatomic) IBOutlet UILabel *categoriesLabel;
@property (weak, nonatomic) IBOutlet UILabel *checkMarkButton;


@end
