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

@interface MapViewController () <CLLocationManagerDelegate> {
    CLLocationManager *objLocationManager;
    double latitude_UserLocation, longitude_UserLocation;

    

}



@end

@implementation MapViewController

@synthesize mapSegment;
@synthesize mapView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    [mapSegment addTarget:self action:@selector(changeMapType) forControlEvents:UIControlEventTouchUpInside];
    
    [self changeMapType];
   }

-(void) changeMapType {
    NSLog(@"%ld", (long)mapSegment.selectedSegmentIndex);
    if (mapSegment.selectedSegmentIndex == 0) {
        [mapView setMapType: MKMapTypeStandard];
    } else if (mapSegment.selectedSegmentIndex == 1) {
        [mapView setMapType: MKMapTypeSatellite];
    } else if (mapSegment.selectedSegmentIndex == 2) {
        [mapView setMapType: MKMapTypeHybrid];
    }

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

@end
