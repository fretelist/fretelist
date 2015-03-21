//
//  ContactUsViewController.m
//  FreteList
//
//  Created by Joao Alves on 1/29/15.
//  Copyright (c) 2015 FreteList. All rights reserved.
//

#import "ContactUsViewController.h"


@interface ContactUsViewController ()

@end

@implementation ContactUsViewController

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.navigationController.navigationBar.barTintColor = [UIColor colorWithHue:354.0 saturation:90.0 brightness:89.0 alpha:1.0];
//    [self.navigationController.navigationBar
//     setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - MFMailComposeDelegate
-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    
    //Change Navigation Bar Color
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"navigation_centerLogo"] forBarMetrics:UIBarMetricsDefault];

    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - My Actions


- (IBAction)sendMessage:(id)sender {
    
    //Change Navigation Bar Color
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@""] forBarMetrics:UIBarMetricsDefault];
    
    NSString *emailTitle = @"";
    
    NSString *emailMessage = @"";
    
    NSArray *toRecipients = [NSArray arrayWithObjects:@"fretelist@gmail.com", nil];
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    
    mc.mailComposeDelegate = self;
    mc.navigationItem.title = @"";
    mc.topViewController.navigationItem.title = nil;
    [mc setSubject:emailTitle];
    [mc setMessageBody:emailMessage isHTML:NO];
    [mc setToRecipients:toRecipients];
    
    [self presentViewController:mc animated:YES completion:nil];
    
    
    
}
@end
