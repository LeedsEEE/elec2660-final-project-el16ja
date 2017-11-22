//
//  DataModel.m
//  Tut1
//
//  Created by Joshua Acanthe [el16ja] on 20/11/2017.
//  Copyright © 2017 Joshua Acanthe [el16ja]. All rights reserved.
//

#import "DataModel.h"

@implementation DataModel

static DataModel *_sharedInstance;

- (id) init {
    if (self = [super init]) {
        self.alarms = [[NSMutableArray array] init];
    }
    return self;
}

+ (DataModel  *) sharedInstance
{
    if (!_sharedInstance) {
        _sharedInstance = [[DataModel alloc] init];
    }
    return _sharedInstance;
}

- (void) storeAlarmInArraywithIdentifier: (NSString *) identifier
                      withDateTimeString: (NSDate *) dateTimeString

            {
                Alarm *alarmDetails = [[Alarm alloc] init];
                alarmDetails.identifier = identifier;
                alarmDetails.dateTimeString = dateTimeString;
                
}

@end
