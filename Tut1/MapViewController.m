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
    //self.mapView.showsUserLocation = YES; // displays Map View at users location
    
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

- (IBAction)mapTypeSelect:(UISegmentedControl *)sender {
    NSInteger clickedSegment = [sender selectedSegmentIndex];
    if (clickedSegment== 0){
        self.mapView.mapType = 0;
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

//https://stackoverflow.com/questions/30858360/adding-a-pin-annotation-to-a-map-view-on-a-long-press-in-swift

 - (IBAction)addAnnotation:(UILongPressGestureRecognizer *)longPress {
    //if(longPress.state == UIGestureRecognizerStateBegan){
        
   // }
     self.radius = 1000.00;
     CGPoint touchPoint = [longPress locationInView:self.mapView];
     CLLocationCoordinate2D annotationCoords = [self.mapView convertPoint:touchPoint toCoordinateFromView:self.mapView];
     
     
     /* Point Notification
      MKPointAnnotation *annotation = [[MKPointAnnotation alloc]init];
     annotation.coordinate = annotationCoords;
     annotation.title = @"placeholder title";
     annotation.subtitle = @"placeholder radius";
     */
     
     MKCircle *annotationCircle = [MKCircle circleWithCenterCoordinate:annotationCoords radius:self.radius]; // to create an annotation with an area (circular)
     annotationCircle.title = @"placeholder title";
     annotationCircle.subtitle = @"placeholder radius";
     // to do - create circle overlay
     

     [self.mapView addAnnotation:annotationCircle]; // method to add annotation
     
     
     //[self.mapView addOverlay:(nonnull id<MKOverlay>)];
}




@end
