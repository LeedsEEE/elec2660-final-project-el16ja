//
//  ViewController.h
//  Tut1
//
//  Created by Joshua Acanthe [el16ja] on 14/11/2017.
//  Copyright © 2017 Joshua Acanthe [el16ja]. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UserNotifications/UserNotifications.h>
#import "DataModel.h"
#import "Alarm.h"
#import <EventKit/EventKit.h>

@interface ViewController : UIViewController <UNUserNotificationCenterDelegate>
@property (weak, nonatomic) IBOutlet UIDatePicker *picker;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) UNUserNotificationCenter *center;
- (IBAction)setAlarm:(UIButton *)sender;
- (IBAction)backgroundPressed:(UIControl *)sender;

#pragma mark UNUserNotificationCenterDelegate Methods

- (void)userNotificationCenter:(UNUserNotificationCenter *)center
       willPresentNotification:(UNNotification *)notification
         withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler;

@end

