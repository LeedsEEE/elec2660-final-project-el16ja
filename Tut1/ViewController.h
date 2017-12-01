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

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIDatePicker *picker;
@property (weak, nonatomic) IBOutlet UITextField *textField;
- (IBAction)setAlarm:(UIButton *)sender;
- (IBAction)backgroundPressed:(UIControl *)sender;



@end

