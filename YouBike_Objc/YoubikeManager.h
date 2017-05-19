//
//  YoubikeManager.h
//  YouBike_Objc
//
//  Created by 劉洧熏 on 2017/5/9.
//  Copyright © 2017年 劉洧熏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
#import "Stations.h"
#import <CoreLocation/CoreLocation.h>


@interface YoubikeManager : AFHTTPSessionManager

+ (instancetype) shared;

@property NSMutableArray<Stations *> *stations;

- (void) getStations: (void (^) (NSMutableArray *stationsFromAPI, NSError *error))block;
- (void) getToken;


@end
