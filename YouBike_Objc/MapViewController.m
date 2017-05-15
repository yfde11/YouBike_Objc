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

    

}




@end

@implementation MapViewController

@synthesize segment;
@synthesize mapView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
;
    
    [self changeMapType];
   }

-(void) changeMapType {


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
    [self loadMapView];
}

- (void) locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    [objLocationManager stopUpdatingLocation];
}

- (void) loadMapView {
    
    
    
        
    
    MKCoordinateSpan objCoorSpan = {
        
    };
}
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
