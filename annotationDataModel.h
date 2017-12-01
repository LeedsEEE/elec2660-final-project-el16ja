//
//  annotationDataModel.h
//  Tut1
//
//  Created by Joshua Acanthe [el16ja] on 01/12/2017.
//  Copyright © 2017 Joshua Acanthe [el16ja]. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Annotation.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import <UserNotifications/UserNotifications.h>

@interface annotationDataModel : NSObject

@property (strong, nonatomic) NSMutableArray *annotations;

+(annotationDataModel *) annotationShare;

- (void) storeAnnotationInArraywithIndex: (NSInteger) index
                         withCoordinates: (CLLocationCoordinate2D) coords withRadius: (CLLocationDistance) radius WithOverlay:(MKCircle *)overlay;

@end
