//
//  AppDelegate.h
//  tenhoDesconto
//
//  Created by Joao Paulo Galvao Alves on 4/3/14.
//  Copyright (c) 2014 tenhoDesconto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlurryAdInterstitial.h"
#import "FlurryAdInterstitialDelegate.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate,FlurryAdInterstitialDelegate>

@property (strong, nonatomic) UIWindow *window;



@end
