//
//  DataModel.h
//  Tut1
//
//  Created by Joshua Acanthe [el16ja] on 20/11/2017.
//  Copyright © 2017 Joshua Acanthe [el16ja]. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Alarm.h"



@interface DataModel : NSObject

@property (strong, nonatomic) NSMutableArray *alarms;

+ (DataModel *) sharedInstance;
- (void) storeAlarmInArray: (Alarm *) alarm;
@end
