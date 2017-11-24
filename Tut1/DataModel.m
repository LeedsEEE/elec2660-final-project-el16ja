//
//  DataModel.m
//  Tut1
//
//  Created by Joshua Acanthe [el16ja] on 20/11/2017.
//  Copyright © 2017 Joshua Acanthe [el16ja]. All rights reserved.
//

#import "DataModel.h"

@implementation DataModel

static DataModel *_alarmShare;

- (id) init {
    if (self = [super init]) {
        self.alarms = [NSMutableArray array];
        Alarm *testAlarm = [[Alarm alloc] init];
        testAlarm.identifier = @"identifier of testAlarm!";
        [self.alarms addObject:testAlarm];
        
    }
    return self;
}

+ (DataModel  *) alarmShare;
{
    if (!_alarmShare) {
        _alarmShare = [[DataModel alloc] init];
        _alarmShare.alarms = [NSMutableArray array];
    }
    return _alarmShare;
}

- (void) storeAlarmInArraywithIdentifier: (NSString *) identifier
                      withcontent: (UNMutableNotificationContent *) content

            {
                 Alarm *alarmDetails = [[Alarm alloc] init];
                alarmDetails.content = content;
                alarmDetails.identifier = identifier;
                [_alarmShare.alarms addObject:alarmDetails];
                Alarm *placementObject = _alarmShare.alarms[0];
                NSLog(@"identifier stored: %@ ",placementObject.identifier);
                
                

                
}

@end
