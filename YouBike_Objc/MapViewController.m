//
//  MapViewController.m
//  YouBike_Objc
//
//  Created by 劉洧熏 on 2017/5/15.
//  Copyright © 2017年 劉洧熏. All rights reserved.
//

#import "MapViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "MapViewController.h"

@interface MapViewController () <CLLocationManagerDelegate> {
    CLLocationManager *objLocationManager;
    double latitude_UserLocation, longitude_UserLocation;

    NSArray* routes;
    BOOL isUpdatingRoutes;
    
}

@property (strong, nonatomic) MKPlacemark *destination;
@property (strong,nonatomic) MKPlacemark *source;


@end

@implementation MapViewController

@synthesize segment;
@synthesize mapView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadUserLocation];
    [self getDirections];
    
   }


-(void)getDirections {
    MKDirectionsRequest *request = [[MKDirectionsRequest alloc] init];
    request.source = [MKMapItem mapItemForCurrentLocation];
    request.destination = _destination;
    request.requestsAlternateRoutes = NO;
    
   /* CLLocationCoordinate2D sourceCoords = CLLocationCoordinate2DMake(latitude_UserLocation, longitude_UserLocation);
    //shown area
    MKCoordinateSpan span;
    span.latitudeDelta = 0.2;
    span.longitudeDelta = 0.2;
    //staring point
    CLLocationCoordinate2D location2D;
    location2D.latitude = latitude_UserLocation;
    location2D.longitude = longitude_UserLocation;
    
    MKCoordinateRegion region;
    region.span = span;
    region.center = location2D;
    [mapView setRegion:region animated:true];
    */
    CLLocationCoordinate2D sourceCoords = CLLocationCoordinate2DMake(25.135915, 121.664099);
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    region.center = sourceCoords;
    span.latitudeDelta = 1;
    span.longitudeDelta = 1;
    region.span = span;
    [mapView setRegion:region animated:TRUE];
    
    MKPlacemark *placeMark = [[MKPlacemark alloc] initWithCoordinate:sourceCoords addressDictionary:nil];
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    annotation.coordinate = sourceCoords;
    annotation.title = @"title";
    [self.mapView addAnnotation:annotation];
    
    self.destination = placeMark;
    
    
    MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:_destination];
    CLLocationCoordinate2D destCoords = CLLocationCoordinate2DMake(25.035915, 121.564099);
    MKPlacemark *placeMark1 = [[MKPlacemark alloc] initWithCoordinate:destCoords addressDictionary:nil];
    
    MKPointAnnotation *annotation1 = [[MKPointAnnotation alloc] init];
    annotation1.coordinate = destCoords;
    annotation1.title = @"title2";
    [self.mapView addAnnotation:annotation1];
    
    self.source = placeMark1;
    //_source = placeMark1;
    
    MKMapItem *mapItem1 = [[MKMapItem alloc] initWithPlacemark:_source];
    
    
    request.source = mapItem1;
    
    
    
    MKDirections *directions = [[MKDirections alloc] initWithRequest:request];
    [directions calculateETAWithCompletionHandler:^(MKETAResponse * _Nullable response, NSError * _Nullable error) {
        
        
        if (error) {
            NSLog(@"ERROR");
            NSLog(@"%@", [error localizedDescription]);
        } else {
            [self showRoute: response];
        }
    }];
    
}

-(void)showRoute:(MKDirectionsResponse *)response {
    for (MKRoute * route in response.routes) {
        [mapView addOverlay:route.polyline level:MKOverlayLevelAboveRoads];
        
        for (MKRouteStep *step in route.steps) {
            NSLog(@"%@", step.instructions);
        }
    }
}

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay
{
    MKPolylineRenderer *renderer = [[MKPolylineRenderer alloc] initWithPolyline:overlay];
    renderer.strokeColor = [UIColor colorWithRed:0.0/255.0 green:171.0/255.0 blue:253.0/255.0 alpha:1.0];
    renderer.lineWidth = 10.0;
    return  renderer;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) loadUserLocation
{
    objLocationManager = [[CLLocationManager alloc] init];
    objLocationManager.delegate = self;
    objLocationManager.distanceFilter = kCLDistanceFilterNone;
    objLocationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    if ([objLocationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [objLocationManager requestWhenInUseAuthorization];
    }
    [objLocationManager startUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(nonnull NSArray<CLLocation *> *)locations; {
    CLLocation *newLocation = [locations objectAtIndex:0];
    latitude_UserLocation = newLocation.coordinate.latitude;
    longitude_UserLocation = newLocation.coordinate.longitude;
    [objLocationManager stopUpdatingLocation];
    //[self loadMapView];
}

- (void) locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    [objLocationManager stopUpdatingLocation];
}

/*- (void) loadMapView {
    
    //shown area
    MKCoordinateSpan span;
    span.latitudeDelta = 0.2;
    span.longitudeDelta = 0.2;
    //staring point
    CLLocationCoordinate2D location2D;
    location2D.latitude = latitude_UserLocation;
    location2D.longitude = longitude_UserLocation;
    
    MKCoordinateRegion region;
    region.span = span;
    region.center = location2D;
}*/
- (IBAction)mapSegment:(id)sender {
    switch (segment.selectedSegmentIndex) {
        case 0:
            [mapView setMapType:MKMapTypeStandard];
            break;
        case 1:
            [mapView setMapType:MKMapTypeSatellite];
            break;
        case 2:
            [mapView setMapType:MKMapTypeHybrid];
            break;
        default:
            break;
    }
}

@end
