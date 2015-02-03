//
//  SearchViewController.m
//  tenhoDesconto
//
//  Created by Joao Paulo Galvao Alves on 11/23/14.
//  Copyright (c) 2014 tenhoDesconto. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()
@property(strong, nonatomic)IBOutlet UISearchBar *search;
@property(nonatomic, strong)NSMutableArray *searchResults;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    
//    if ([self.search isFirstResponder]) {
//        [self performSelector:@selector(searchBarSearchButtonClicked:)];
//    }
    
    self.search.delegate = self;
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
    
    
    
    
}

-(void)searchBarTextDidEndEditing:(UISearchBar *)searchBar{
    [self clear];
    
}



-(void)viewWillAppear:(BOOL)animated{
    
//    [self.searchResults removeAllObjects];
    [self becomeFirstResponder];
    [self.search.text isEqualToString:@""];
    
    
}

-(void)loadObjects{
    
    
    if (![self.search.text isEqualToString:@""]) {
        [super loadObjects];
    }
    
    
}


#pragma mark - PFQueryTableViewController

-(PFQuery*)queryForTable{
    
    
    if(![self.search.text isEqualToString:@""]){
        
        
        NSString *regexString = [NSString stringWithFormat:@"%@",self.search.text];
        
        // regex only works for string fields - do a Search on vehicleType
//        PFQuery *categoryQuery = [[PFQuery alloc] initWithClassName:@"_User"];
//        [categoryQuery whereKey:@"vehicleType" matchesRegex:regexString modifiers:@"i"];
        
 
        PFQuery *nameQuery = [[PFQuery alloc] initWithClassName:@"_User"];
        [nameQuery whereKey:@"name" matchesRegex:regexString modifiers:@"i"];


        PFQuery *companyCityQuery = [[PFQuery alloc] initWithClassName:@"_User"];
        [companyCityQuery whereKey:@"city" matchesRegex:regexString modifiers:@"i"];

        
        PFQuery *companyStateQuery = [[PFQuery alloc] initWithClassName:@"_User"];
        [companyStateQuery whereKey:@"state" matchesRegex:regexString modifiers:@"i"];

        
        PFQuery *descriptionQuery = [[PFQuery alloc] initWithClassName:@"_User"];
        [descriptionQuery whereKey:@"freightDescription" matchesRegex:regexString modifiers:@"i"];
        
        
        NSLog(@"%@", self.search.text);
    
    
    PFQuery *searchQuery = [PFQuery orQueryWithSubqueries:@[nameQuery,companyCityQuery,companyStateQuery, descriptionQuery]];
       
        return  searchQuery;
    }
    
    
    return [[PFQuery alloc] initWithClassName:@"_User"];
}

-(PFTableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object{
    
    static NSString *simpleTableIdentifier = @"SearchCell";
    
    PFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[PFTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    //PFObject *categoriesObject = [PFObject objectWithClassName:@"Categories"];

        
    cell.textLabel.text = [object objectForKey:@"name"];
   
//   if ([[nameObject objectForKey:@"freightUserType"] isEqualToString:@"Prestador de Serv."]) {
    
    
    
//    }
    
    
    return cell;
    
    
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












