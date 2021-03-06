//
//  SearchViewController.m
//  tenhoDesconto
//
//  Created by Joao Paulo Galvao Alves on 11/23/14.
//  Copyright (c) 2014 tenhoDesconto. All rights reserved.
//

#import "SearchViewController.h"
#import "DetailViewController.h"

@interface SearchViewController ()
@property(strong, nonatomic)IBOutlet UISearchBar *search;
@property(nonatomic, strong)NSMutableArray *searchResults;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//
    [[UISearchBar appearance] setBackgroundImage:[UIImage imageNamed:@"searchBar"]];

//    self.search.barTintColor = [UIColor colorWithHue:354.0 saturation:90.0 brightness:89.0 alpha:1.0];
//    self.navigationController.navigationBar.barTintColor = [UIColor colorWithHue:354.0 saturation:90.0 brightness:89.0 alpha:1.0];
//    [self.navigationController.navigationBar
//     setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    self.search.delegate = self;
    
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


-(void)viewWillAppear:(BOOL)animated{
    
//    [self.searchResults removeAllObjects];
    [self becomeFirstResponder];
    [self.search.text isEqualToString:@""];
    
    
}



#pragma mark - PFQueryTableViewController

-(PFQuery*)queryForTable{
    
    
    if(![self.search.text isEqualToString:@""]){
        
        
        NSString *regexString = [NSString stringWithFormat:@"%@",self.search.text];
        
        // regex only works for string fields - do a Search on vehicleType
//        PFQuery *categoryQuery = [[PFQuery alloc] initWithClassName:@"_User"];
//        [categoryQuery whereKey:@"vehicleType" matchesRegex:regexString modifiers:@"i"];
        
 
        PFQuery *nameQuery = [[PFQuery alloc] initWithClassName:@"_User"];
        
        [nameQuery whereKey:@"freightUserType" equalTo:@"Prestador de Serv."];
        
        [nameQuery whereKey:@"name" matchesRegex:regexString modifiers:@"i"];


        PFQuery *companyCityQuery = [[PFQuery alloc] initWithClassName:@"_User"];
        [companyCityQuery whereKey:@"freightUserType" equalTo:@"Prestador de Serv."];
        [companyCityQuery whereKey:@"city" matchesRegex:regexString modifiers:@"i"];

        
        PFQuery *companyStateQuery = [[PFQuery alloc] initWithClassName:@"_User"];
        [companyStateQuery whereKey:@"freightUserType" equalTo:@"Prestador de Serv."];
        [companyStateQuery whereKey:@"state" matchesRegex:regexString modifiers:@"i"];

        
        PFQuery *descriptionQuery = [[PFQuery alloc] initWithClassName:@"_User"];
        [descriptionQuery whereKey:@"freightUserType" equalTo:@"Prestador de Serv."];
        [descriptionQuery whereKey:@"freightDescription" matchesRegex:regexString modifiers:@"i"];
        
        
        
        
        
        NSLog(@"%@", self.search.text);
    
    
    PFQuery *searchQuery = [PFQuery orQueryWithSubqueries:@[nameQuery,companyCityQuery,companyStateQuery, descriptionQuery]];
        
    
       
        return  searchQuery;
    }
    
    PFQuery *emptyQuery = [[PFQuery alloc] initWithClassName:@"_User"];
    
    [emptyQuery whereKey:@"name" equalTo:@""];
    
    return emptyQuery;
}

-(PFTableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object{
    
    static NSString *simpleTableIdentifier = @"SearchCell";
    
    PFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[PFTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    //PFObject *categoriesObject = [PFObject objectWithClassName:@"Categories"];

        
    cell.textLabel.text = [object objectForKey:@"name"];
   
    
    return cell;
    
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    self.clickedSearch = [self objectAtIndexPath:indexPath];
    [self performSegueWithIdentifier:@"fromSearchToDetail" sender:self];
    
}


#pragma mark - Navigation



// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"fromSearchToDetail"]) {
        DetailViewController *destinationDetail = segue.destinationViewController;
        destinationDetail.clickedFreightDetail = self.clickedSearch;
    }
    
    
}


@end












