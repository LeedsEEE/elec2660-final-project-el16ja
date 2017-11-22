//
//  TableViewController.m
//  Tut1
//
//  Created by Joshua Acanthe [el16ja] on 14/11/2017.
//  Copyright © 2017 Joshua Acanthe [el16ja]. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // snippet from developer.apple.com/library/content/documentation/NetworkingInternet/Conceptual/RemoteNotificationsPG/SupportingNotificationsinYourApp.html#//apple_ref/doc/uid/TP40008194-CH4-SW1 - The Apple User guide to notifications
    UNUserNotificationCenter* notificationCenter = [UNUserNotificationCenter currentNotificationCenter];
    [notificationCenter requestAuthorizationWithOptions:(UNAuthorizationOptionAlert + UNAuthorizationOptionSound)
                          completionHandler:^(BOOL granted, NSError * _Nullable error) {
                           
                              if (granted == YES){ // if permission is allowed
                                  NSLog(@"Permission Granted.");
                              }
                              else { // if permission is not allowed
                                  NSLog(@"%@", error);
                              }
                              
                          }];
    
        // Create the custom actions for expired timer notifications.
    UNNotificationAction* snoozeAction = [UNNotificationAction
                                          actionWithIdentifier:@"Snooze"
                                          title:@"Snooze"
                                          options:UNNotificationActionOptionNone];
        // Register the notification categories.
    UNNotificationAction* stopAction = [UNNotificationAction
                                        actionWithIdentifier:@"Stop"
                                        title:@"Stop"
                                        options:UNNotificationActionOptionForeground];
    
    UNNotificationCategory* alarmCategory = [UNNotificationCategory
                                             categoryWithIdentifier:@"alarm"
                                             actions:@[snoozeAction, stopAction]
                                             intentIdentifiers:@[]
                                             options:UNNotificationCategoryOptionCustomDismissAction];
        // Register Notification categories.
    [notificationCenter setNotificationCategories:[NSSet setWithObjects:alarmCategory, nil]];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
     }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"alarmCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)deleteAlarm:(UIButton *)sender {
    // -----------------------------------------------------
    //                     REMOVING A NOTIFICATION
    // -----------------------------------------------------
    // snippet from developer.apple.com/library/content/documentation/NetworkingInternet/Conceptual/RemoteNotificationsPG/SupportingNotificationsinYourApp.html#//apple_ref/doc/uid/TP40008194-CH4-SW1 - The Apple User guide to notifications
    
    /*
     Scheduled local notifications remain active until they are unscheduled by the system or until you cancel
     them explicitly. The system unschedules notifications automatically after they are delivered, unless the
     notificationís trigger is configured to repeat. To cancel an individual notification before it is delivered,
     or to cancel a repeating notification, call the removePendingNotificationRequestsWithIdentifiers: method of
     UNUserNotificationCenter. The notification being canceled must have an identifier assigned to its
     UNNotificationRequest object. To cancel all pending local notifications, regardless of whether they have a
     request identifier, call the removeAllPendingNotificationRequests method instead
     */
}

@end
