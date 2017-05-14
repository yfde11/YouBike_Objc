//
//  Stations.h
//  YouBike_Objc
//
//  Created by 劉洧熏 on 2017/5/13.
//  Copyright © 2017年 劉洧熏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface Stations : NSObject

@property NSString *name;

@property NSString *id;

@property NSString *address;

@property NSNumber *numberOfRemainingBikes;

@property CLLocationCoordinate2D *coordinate;

@end
