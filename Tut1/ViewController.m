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
    NSLog(@"date = %@",date);
    NSString *identifier = [dateFormat stringFromDate:date];
    NSLog(@"identifier = %@",identifier);
    
    
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    UNMutableNotificationContent* content = [[UNMutableNotificationContent alloc] init];
    content.title = [NSString localizedUserNotificationStringForKey:@"Wake up!" arguments:nil];
    content.body = [NSString localizedUserNotificationStringForKey:@"Rise and shine! It's morning time!"arguments:nil];
    
    // Configure the trigger for a 7am wakeup
    
    NSDateComponents* dateComponents = [[NSDateComponents alloc] init];
    dateComponents.year = [gregorianCalendar component:NSCalendarUnitYear fromDate:date];
    dateComponents.month = [gregorianCalendar component:NSCalendarUnitMonth fromDate:date];
    dateComponents.hour = [gregorianCalendar component:NSCalendarUnitDay fromDate:date];
    dateComponents.minute = [gregorianCalendar component:NSCalendarUnitHour fromDate:date];
    dateComponents.day = [gregorianCalendar component:NSCalendarUnitMinute fromDate:date];

    
    UNCalendarNotificationTrigger* trigger = [UNCalendarNotificationTrigger
                                              triggerWithDateMatchingComponents:dateComponents repeats:NO];
    
    // Create the request object.
    UNNotificationRequest* request = [UNNotificationRequest
                                      requestWithIdentifier: identifier content:content trigger:trigger];
    

    // ----------------------------------------------------------------------------------------------------------------------------
    //                     SCHEDULING NOTIFICATION FOR DELIVERY
    // ----------------------------------------------------------------------------------------------------------------------------
    
    // Create the request object.
    
    UNUserNotificationCenter* center = [UNUserNotificationCenter currentNotificationCenter];
    [center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        if (error != nil) {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
    [alarmData storeAlarmInArraywithIdentifier: (NSString *) identifier
            withcontent: (UNMutableNotificationContent *)content];
    
    
}


@end
