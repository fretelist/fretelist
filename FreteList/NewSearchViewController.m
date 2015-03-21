//
//  NewSearchViewController.m
//  FreteList
//
//  Created by Joao Paulo Galvao Alves on 3/21/15.
//  Copyright (c) 2015 FreteList. All rights reserved.
//

#import "NewSearchViewController.h"

@interface NewSearchViewController ()

@end

@implementation NewSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [[UISearchBar appearance] setBackgroundImage:[UIImage imageNamed:@"searchBar"]];
    
    for (UIView *view in self.search.subviews)
    {
        for (id subview in view.subviews)
        {
            if ( [subview isKindOfClass:[UIButton class]] )
            {
                // customize cancel button
                UIButton* cancelBtn = (UIButton*)subview;
                [cancelBtn setTitle:@"Cancelar" forState:UIControlStateNormal];
                //                [cancelBtn setEnabled:YES];
                break;
            }
        }
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView DataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 0;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}


#pragma mark - SearchBar Delegate

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
    
    [self loadObjects];
    
}



-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    
    
    [self.search resignFirstResponder];
    [self clear];
    
}

-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    
    
    
    // customize cancel button
    //[[UIButton appearanceWhenContainedIn: [UISearchBar class], nil] setTintColor:[UIColor whiteColor]];
    
    
    
    
    
}

-(void)searchBarTextDidEndEditing:(UISearchBar *)searchBar{
    [self clear];
    
}

#pragma mark - My Actions

-(void) loadObjects {
    
}

-(void) clear {
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
