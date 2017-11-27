//
//  MapViewController.h
//  Tut1
//
//  Created by Joshua Acanthe [el16ja] on 27/11/2017.
//  Copyright © 2017 Joshua Acanthe [el16ja]. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import <UserNotifications/UserNotifications.h>



@interface MapViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>

@property (strong, nonatomic) CLLocationManager *location;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property CLLocationDistance radius;


//------------Part 1 of the lab (may not be needed) --------------
//@property CLLocationDegrees *latitude;
//@property CLLocationDegrees *longitude;
//----------------------------------------------------------------

- (IBAction)mapTypeSelect:(UISegmentedControl *)sender;
- (IBAction)addAnnotation:(UILongPressGestureRecognizer *)longPress;


@end
