//
//  MapViewController.m
//  Tut1
//
//  Created by Joshua Acanthe [el16ja] on 27/11/2017.
//  Copyright © 2017 Joshua Acanthe [el16ja]. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController
@synthesize mapView;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // https://spin.atomicobject.com/2015/07/16/geofencing-ios-objectivec/
    self.location = [[CLLocationManager alloc] init];
    self.location.delegate = self;
    self.mapView.delegate = self;
    NSLog(@"*NSLOG>  %d",[CLLocationManager authorizationStatus]);
    if ([CLLocationManager authorizationStatus] != kCLAuthorizationStatusAuthorizedAlways){
        [self.location requestAlwaysAuthorization];
    }

    self.mapView.showsUserLocation = YES; // displays Map View at users location
    CLLocation *currentLocation = self.location.location;
    CLLocationCoordinate2D locationcoords = currentLocation.coordinate;
    self.mapView.region = MKCoordinateRegionMake(locationcoords, MKCoordinateSpanMake(0.05,0.05));
    
    self.location.desiredAccuracy = kCLLocationAccuracyBest;
    
   self.location.allowsBackgroundLocationUpdates = YES; // THIS METHOD CRASHES THE APP *fixed by adding https://github.com/mauron85/react-native-background-geolocation/issues/60 solution to the plist
    
    
    
    
    //self.latitude = [some method];
    //self.longitude= [some method];
    //self.location = [[CLLocation alloc]initWithLatitude:latitude longitude:longitude];
    
    
    /* --------------------Creating a geofence -----------------------------
     // https://spin.atomicobject.com/2015/07/16/geofencing-ios-objectivec/
     CLLocationCoordinate2D center = CLLocationCoordinate2DMake(42.280597,
     -83.751891);
     CLRegion *bridge = [[CLCircularRegion alloc]initWithCenter:center
     radius:100.0
     identifier:@"Bridge"];
     [self.locationManager startMonitoringForRegion:bridge];
     */
    [self.location startUpdatingLocation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



/*
 - (void)locationManager:(CLLocationManager *)manager
         didEnterRegion:(CLRegion *)region {
    NSLog(@"*NSLOG>  didEnter : %@", region);
    
}
*/



//https://stackoverflow.com/questions/30858360/adding-a-pin-annotation-to-a-map-view-on-a-long-press-in-swift

 - (IBAction)addAnnotation:(UILongPressGestureRecognizer *)longPress {
    //if(longPress.state == UIGestureRecognizerStateBegan){
        
   // }
     self.radius = 500.00;
     
         CGPoint touchPoint = [longPress locationInView:self.mapView];
         self.annotationCoords = [self.mapView convertPoint:touchPoint toCoordinateFromView:self.mapView];
     
         /* Point Notification
          MKPointAnnotation *annotation = [[MKPointAnnotation alloc]init];
          annotation.coordinate = annotationCoords;
          annotation.title = @"placeholder title";
          annotation.subtitle = @"placeholder radius";
          */
     
         MKCircle *annotation = [MKCircle circleWithCenterCoordinate:self.annotationCoords radius:self.radius]; // to create an annotation with an area (circular)
         annotation.title = @"placeholder title";
         annotation.subtitle = @"placeholder radius";
         // to do - create circle overlay
          // creates pin as described in the map delegate method
         [self.mapView viewForAnnotation:annotation];
         [self.mapView addAnnotation:annotation]; // method to add annotation
         [self.mapView addOverlay:annotation]; // method to add overlay
     self.identifier = annotation.title;

     
     }
     

#pragma mark Button Methods

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control{
    CLRegion *geofence = [[CLCircularRegion alloc]initWithCenter:self.annotationCoords
                                                          radius:self.radius
                                                      identifier:self.identifier];
    if (control == view.rightCalloutAccessoryView){
        [self.location startMonitoringForRegion:geofence];
        NSLog(@"*NSLOG> monitoring...");
    }
    else if (control == view.leftCalloutAccessoryView){
        [self.mapView removeAnnotation:view.annotation];
        //[self.mapView removeOverlay:overlay];
        [self.location stopMonitoringForRegion:geofence];
        NSLog(@"*NSLOG> geofence deleted.");
    }
    

    
}

#pragma mark Map delegate methods

- (MKAnnotationView *)mapView:(MKMapView *)theMapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    // Try to dequeue an existing pin view first (code not shown).
    NSString *annotationIdentifier = (@"Default");
    // If no pin view already exists, create a new one.
    MKPinAnnotationView *customPinView = [[MKPinAnnotationView alloc]
                                          initWithAnnotation:annotation reuseIdentifier:annotationIdentifier];
    customPinView.pinTintColor = [MKPinAnnotationView greenPinColor];
    customPinView.animatesDrop = YES;
    customPinView.canShowCallout = YES;
    customPinView.draggable = YES;
    // Because this is an iOS app, add the detail disclosure button to display details about the annotation in another view.
    
    //@selector(mapView:annotationView:calloutAccessoryControlTapped:)
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [rightButton addTarget:annotation action:nil forControlEvents:UIControlEventTouchUpInside];
    customPinView.rightCalloutAccessoryView = rightButton;
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [leftButton addTarget:annotation action:nil forControlEvents:UIControlEventTouchUpInside];
    customPinView.leftCalloutAccessoryView = leftButton;
    
    // Add a custom image to the left side of the callout.
    //UIImageView *myCustomImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MyCustomImage.png"]];
    //customPinView.leftCalloutAccessoryView = myCustomImage;
    
    return customPinView;
}

// TO SELECT WHAT TYPE OF MAP VIEW (SATELLITE, DEFAULT, ETC)
- (IBAction)mapTypeSelect:(UISegmentedControl *)sender {
    NSInteger clickedSegment = [sender selectedSegmentIndex];
    if (clickedSegment== 0){ // clicked segment has a value of 0 when the standard segment is clicked
        self.mapView.mapType = 0; // 0 = standard
        NSLog(@"*NSLOG> MapView Changed to Standard/Default ");
    }
    if (clickedSegment ==1){
        self.mapView.mapType = MKMapTypeSatellite;
        NSLog(@"*NSLOG>  1 ");
    }
    if (clickedSegment ==2){
        self.mapView.mapType = MKMapTypeHybrid;
        NSLog(@"*NSLOG>  2 ");
    }
}

- (void)registerRegionWithCircularOverlay:(MKCircle*)overlay andIdentifier:(NSString*)identifier {
    
    // If the overlay's radius is too large, registration fails automatically,
    // so clamp the radius to the max value.
    CLLocationDistance radius = overlay.radius;
    if (radius > self.location.maximumRegionMonitoringDistance) {
        radius = self.location.maximumRegionMonitoringDistance;
    }
    
    // Create the geographic region to be monitored.
    CLCircularRegion *geoRegion = [[CLCircularRegion alloc]
                                   initWithCenter:overlay.coordinate
                                   radius:radius
                                   identifier:identifier];
    geoRegion.notifyOnExit = NO;
    [self.location startMonitoringForRegion:geoRegion];
}

// OVERLAY RENDERER
- (MKOverlayRenderer *)mapView:(MKMapView *)mapView viewForOverlay:(id <MKOverlay>)overlay
{
    if ([overlay isKindOfClass:[MKCircle class]])
    {
        MKCircleRenderer*    aRenderer = [[MKCircleRenderer alloc] initWithCircle:(MKCircle *) overlay];
        
        aRenderer.fillColor = [[UIColor cyanColor] colorWithAlphaComponent:0.2];
        aRenderer.strokeColor = [[UIColor blueColor] colorWithAlphaComponent:0.7];
        aRenderer.lineWidth = 3;
        
        return aRenderer;
    }
    
    return nil;
}

@end
