//
//  SearchViewController.h
//  tenhoDesconto
//
//  Created by Joao Paulo Galvao Alves on 11/23/14.
//  Copyright (c) 2014 tenhoDesconto. All rights reserved.
//

#import <Parse/Parse.h>
#import <ParseUI/ParseUI.h>

@interface SearchViewController : PFQueryTableViewController<UISearchBarDelegate, UITextFieldDelegate>


@property(nonatomic, strong) PFObject *clickedSearch;


@end
