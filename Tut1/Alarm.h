//
//  alarm.h
//  Tut1
//
//  Created by Joshua Acanthe [el16ja] on 20/11/2017.
//  Copyright © 2017 Joshua Acanthe [el16ja]. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UserNotifications/UserNotifications.h>
#import <EventKit/EventKit.h>

@interface Alarm : NSObject

@property (nonatomic,strong) NSString *identifier;
@property (nonatomic, strong) UNMutableNotificationContent *content;





@end
