//
//  TableViewController.h
//  Tut1
//
//  Created by Joshua Acanthe [el16ja] on 14/11/2017.
//  Copyright © 2017 Joshua Acanthe [el16ja]. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UserNotifications/UserNotifications.h>
#import "DataModel.h"

@interface TableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UIButton *deleteAlarm;

- (IBAction)deleteAlarm:(UIButton *)sender;

@end
