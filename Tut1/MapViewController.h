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
#import <EventKit/EventKit.h>
#import "Annotation.h"
#import "annotationDataModel.h"



@interface MapViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>

@property (strong, nonatomic) CLLocationManager *location;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property CLLocationDistance radius;
@property CLLocationCoordinate2D annotationCoords;
@property NSString *identifier;
@property MKCircle *overlay;
@property Annotation *annotation;
@property CLRegion *region;

//text field properties/methods
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *radiusTextField;
- (IBAction)titleTextFieldChanged:(UITextField *)sender;
- (IBAction)radiusTextFieldChanged:(UITextField *)sender;
- (IBAction)backgroundPressed:(UIControl *)sender;


- (IBAction)mapTypeSelect:(UISegmentedControl *)sender;
- (IBAction)addAnnotation:(UILongPressGestureRecognizer *)longPress;

#pragma mark core location delegate methods

- (void)locationManager:(CLLocationManager *)manager
         didEnterRegion:(CLRegion *)region;

- (void)locationManager:(CLLocationManager *)manager
didStartMonitoringForRegion:(CLRegion *)region;

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation;

#pragma mark Map delegate methods
- (MKAnnotationView *)mapView:(MKMapView *)theMapView viewForAnnotation:(id <MKAnnotation>)annotation;

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView viewForOverlay:(id <MKOverlay>)overlay;

- (void)registerRegionWithCircularOverlay:(MKCircle*)overlay andIdentifier:(NSString*)identifier;

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control;

@end
