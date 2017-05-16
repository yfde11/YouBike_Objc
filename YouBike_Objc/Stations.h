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
@property NSString *enName;
@property NSString *address;
@property NSString *enAddress;
@property NSString *numberOfRemainingBikes;
@property NSString *stationNumber;
@property CLLocationCoordinate2D *coordinate;

- (id)initWithName: (NSString *)name enName: (NSString *)enName address: (NSString *)address enaddress: (NSString *)enaddress numberOfRemainingBikes: (NSString *)numberOfReminingBikes stationNumber: (NSString *)stationNumber coordinate: (CLLocationCoordinate2D *)coordinate;

@end
