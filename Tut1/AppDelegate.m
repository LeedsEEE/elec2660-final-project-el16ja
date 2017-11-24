//
//  AppDelegate.m
//  Tut1
//
//  Created by Joshua Acanthe [el16ja] on 14/11/2017.
//  Copyright © 2017 Joshua Acanthe [el16ja]. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Authorisation of Location use
    UNUserNotificationCenter* notificationCenter = [UNUserNotificationCenter currentNotificationCenter];
    [notificationCenter requestAuthorizationWithOptions:(UNAuthorizationOptionAlert + UNAuthorizationOptionSound)
                                      completionHandler:^(BOOL granted, NSError * _Nullable error) {
                                          
                                          if (granted == YES){ // if permission is allowed
                                              NSLog(@"Permission Granted.");
                                          }
                                          else { // if permission is not allowed
                                              NSLog(@"%@", error);
                                          }
    }];
    
    // Create the custom actions for expired notifications.
    UNNotificationAction* snoozeAction = [UNNotificationAction
                                          actionWithIdentifier:@"Snooze"
                                          title:@"Snooze"
                                          options:UNNotificationActionOptionNone];
    // Register the notification categories.
    UNNotificationAction* dismissAction = [UNNotificationAction
                                           actionWithIdentifier:@"Dismiss"
                                           title:@"Dismiss"
                                           options:UNNotificationActionOptionForeground];
    
    UNNotificationCategory* alarmCategory = [UNNotificationCategory
                                             categoryWithIdentifier:@"alarm"
                                             actions:@[snoozeAction, dismissAction]
                                             intentIdentifiers:@[]
                                             options:UNNotificationCategoryOptionCustomDismissAction];
    // Register Notification categories.
    [notificationCenter setNotificationCategories:[NSSet setWithObjects:alarmCategory, nil]];

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
