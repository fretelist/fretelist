//
//  CategoriesCell.h
//  FreteList
//
//  Created by Joao Alves on 1/19/15.
//  Copyright (c) 2015 FreteList. All rights reserved.
//

#import <Parse/Parse.h>

@interface CategoriesCell : PFTableViewCell

@property(nonatomic, strong)UIButton *checkMarkButton;
@property(nonatomic, strong)UILabel *categoriesLabel;

@end
