//
//  ViewController.m
//  Tut1
//
//  Created by Joshua Acanthe [el16ja] on 14/11/2017.
//  Copyright © 2017 Joshua Acanthe [el16ja]. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.picker.minimumDate = [self.picker date];
    
    self.center.delegate = self;
    
    // Authorisation of Location use
    self.center = [UNUserNotificationCenter currentNotificationCenter];
    
    [self.center requestAuthorizationWithOptions:(UNAuthorizationOptionAlert + UNAuthorizationOptionSound)
                               completionHandler:^(BOOL granted, NSError * _Nullable error) {
                                   
                                   if (granted == YES){ // if permission is allowed
                                       NSLog(@"*NSLOG>  Permission Granted.");
                                   }
                                   else { // if permission is not allowed
                                       NSLog(@"*NSLOG>  %@", error);
                                   }
                               }];
    self.center = [UNUserNotificationCenter currentNotificationCenter];
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
    [self.center setNotificationCategories:[NSSet setWithObjects:alarmCategory, nil]];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)setAlarm:(UIButton *)sender {
    DataModel *alarmData = [DataModel alarmShare];
    // ----------------------------------------------------
    //                        CONFIGURE A NOTIFICATION
    // ----------------------------------------------------
    
    //from: https://developer.apple.com/library/content/documentation/NetworkingInternet/Conceptual/RemoteNotificationsPG/SchedulingandHandlingLocalNotifications.html#//apple_ref/doc/uid/TP40008194-CH5-SW1
    
    
    /*     Create and configure a UNMutableNotificationContent object with the notification details.
     Create a UNCalendarNotificationTrigger, UNTimeIntervalNotificationTrigger, or UNLocationNotificationTrigger
				 object to describe the conditions under which the notification is delivered.
     Create a UNNotificationRequest object with the content and trigger information.
     Call the addNotificationRequest:withCompletionHandler: method to schedule the notification; see Scheduling Local Notifications for Delivery
     */
    
    NSDate *date = [self.picker date];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"HH:mm cccc d MMM"];
    NSLog(@"*NSLOG>  date = %@",date);
    NSString *identifier = [dateFormat stringFromDate:date];
    NSLog(@"*NSLOG>  identifier = %@",identifier);
    
    NSString *notificationContent = self.textField.text; // the notification content string
    
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    UNMutableNotificationContent* content = [[UNMutableNotificationContent alloc] init];
    content.title = [NSString localizedUserNotificationStringForKey:notificationContent arguments:nil];
    content.body = [NSString localizedUserNotificationStringForKey:@"Tap here to open the app!" arguments:nil];
    content.sound = [UNNotificationSound defaultSound]; // plays default sound
    
    // Configure the trigger for a 7am wakeup
    
    NSDateComponents* dateComponents = [[NSDateComponents alloc] init];
    dateComponents.year = [gregorianCalendar component:NSCalendarUnitYear fromDate:date];
    dateComponents.month = [gregorianCalendar component:NSCalendarUnitMonth fromDate:date];
    dateComponents.day = [gregorianCalendar component:NSCalendarUnitDay fromDate:date];
    dateComponents.hour = [gregorianCalendar component:NSCalendarUnitHour fromDate:date];
    dateComponents.minute = [gregorianCalendar component:NSCalendarUnitMinute fromDate:date];

    
    UNCalendarNotificationTrigger* trigger = [UNCalendarNotificationTrigger
                                              triggerWithDateMatchingComponents:dateComponents repeats:NO];
    
    // Create the request object.
    UNNotificationRequest* request = [UNNotificationRequest
                                      requestWithIdentifier: identifier content:content trigger:trigger];
    

    // ----------------------------------------------------------------------------------------------------------------------------
    //                     SCHEDULING NOTIFICATION FOR DELIVERY
    // ----------------------------------------------------------------------------------------------------------------------------
    
    // Create the request object.
    
    
    [self.center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        if (error != nil) {
            NSLog(@"*NSLOG>  %@", error.localizedDescription);
        }
    }];
    [alarmData storeAlarmInArraywithIdentifier: (NSString *) identifier
            withcontent: (UNMutableNotificationContent *)content];
    
    
}

- (IBAction)backgroundPressed:(UIControl *)sender {
    if ([self.textField isFirstResponder]){
        [self.textField resignFirstResponder];
    }
}

#pragma mark UNUserNotificationCenterDelegate Methods

- (void)userNotificationCenter:(UNUserNotificationCenter *)center
       willPresentNotification:(UNNotification *)notification
         withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler {
    // Update the app interface directly.
    NSLog(@"*NSLOG> Notification in Foreground!");
    completionHandler(UNNotificationPresentationOptionAlert);
    //completionHandler(UNNotificationPresentationOptionSound);
}


@end
