//
//  NewSearchViewController.h
//  FreteList
//
//  Created by Joao Paulo Galvao Alves on 3/21/15.
//  Copyright (c) 2015 FreteList. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface NewSearchViewController : UIViewController<UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource>


@property(nonatomic, strong) PFObject *clickedSearch;
@property (weak, nonatomic) IBOutlet UISearchBar *search;

@end
