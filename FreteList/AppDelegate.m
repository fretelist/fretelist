//
//  AppDelegate.m
//  tenhoDesconto
//
//  Created by Joao Paulo Galvao Alves on 4/3/14.
//  Copyright (c) 2014 tenhoDesconto. All rights reserved.
//

#import "AppDelegate.h"
#import <GoogleMaps/GoogleMaps.h>
#import <Parse/Parse.h>
#import <ParseCrashReporting/ParseCrashReporting.h>
#import "Flurry.h"
#import "FlurryAds.h"
#import "FlurryAdInterstitialDelegate.h"
#import "FlurryAdInterstitial.h"




@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Enable Crash Reporting
    //[ParseCrashReporting enable];
    
    [Parse setApplicationId:@"SugGbA8zng2b8C3dH5SCgHwV5Anock00tj2N3vyn"
                  clientKey:@"xcLyhMCdN1OVwVRDCayNhxBsfREDyDr25tdwPv1A"];
    
    //[GMSServices provideAPIKey:@"AIzaSyC6SaZZvFgJCrHhR8mp3xX1CXLzVWVLneA"];
//
    
    //init Flurry
    [Flurry startSession:@"TGSNSHRQG474TMW58G56"];
    
        
    // Register for Push Notitications, if running iOS 8
    if ([application respondsToSelector:@selector(registerUserNotificationSettings:)]) {
        UIUserNotificationType userNotificationTypes = (UIUserNotificationTypeAlert |
                                                        UIUserNotificationTypeBadge |
                                                        UIUserNotificationTypeSound);
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:userNotificationTypes
                                                                                 categories:nil];
        [application registerUserNotificationSettings:settings];
        [application registerForRemoteNotifications];
    } else {
        // Register for Push Notifications before iOS 8
        [application registerForRemoteNotificationTypes:(UIUserNotificationTypeBadge |
                                                         UIUserNotificationTypeAlert |
                                                         UIUserNotificationTypeSound)];
    }
    
    //Change TabBar Color
    UIImage *tabBarBackground = [UIImage imageNamed:@"tabBarBlue"];
    [[UITabBar appearance] setBackgroundImage:tabBarBackground];
    NSLog(@"TabBAr: %@",tabBarBackground);
    
    //Change TabBar button Color
    [[UITabBar appearance] setTintColor:[UIColor colorWithRed:0.98 green:0.647 blue:0.106 alpha:1]];
    
    //www.touch-code-magazine.com/web-color-to-uicolor-convertor - FAA51B/
    
    //Change Navigation Bar Color
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"navigation_centerLogo"] forBarMetrics:UIBarMetricsDefault];
    
    

    
    //
    
    return YES;
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    // Store the deviceToken in the current installation and save it to Parse.
    PFInstallation *currentInstallation = [PFInstallation currentInstallation];
    [currentInstallation setDeviceTokenFromData:deviceToken];
    [currentInstallation saveInBackground];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    [PFPush handlePush:userInfo];
}

							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}




@end
