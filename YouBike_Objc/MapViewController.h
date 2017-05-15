//
//  MapViewController.h
//  YouBike_Objc
//
//  Created by 劉洧熏 on 2017/5/15.
//  Copyright © 2017年 劉洧熏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MapViewController : UIViewController 
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *mapSegment;

@end
