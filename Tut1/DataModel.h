//
//  DataModel.h
//  Tut1
//
//  Created by Joshua Acanthe [el16ja] on 20/11/2017.
//  Copyright © 2017 Joshua Acanthe [el16ja]. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UserNotifications/UserNotifications.h>
#import "Alarm.h"



@interface DataModel : NSObject

@property (strong, nonatomic) NSMutableArray *alarms;

+ (DataModel *) alarmShare;
- (void) storeAlarmInArraywithIdentifier: (NSString *) identifier
                      withcontent: (UNMutableNotificationContent *) content;
- (void) loadArray;
@end
