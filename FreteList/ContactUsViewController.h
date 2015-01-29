//
//  ContactUsViewController.h
//  FreteList
//
//  Created by Joao Alves on 1/29/15.
//  Copyright (c) 2015 FreteList. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface ContactUsViewController : UIViewController<UITextFieldDelegate,MFMailComposeViewControllerDelegate>


- (IBAction)sendMessage:(id)sender;

@end
