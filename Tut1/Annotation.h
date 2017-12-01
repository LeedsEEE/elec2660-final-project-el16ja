//
//  Annotation.h
//  Tut1
//
//  Created by Joshua Acanthe [el16ja] on 01/12/2017.
//  Copyright © 2017 Joshua Acanthe [el16ja]. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import <UserNotifications/UserNotifications.h>

@interface Annotation : NSObject

@property MKCircle *overlay;
@property CLLocationCoordinate2D coords;
@property CLLocationDistance radius;
@property NSInteger index;

@end
