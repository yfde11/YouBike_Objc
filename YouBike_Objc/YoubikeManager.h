//
//  YoubikeManager.h
//  YouBike_Objc
//
//  Created by 劉洧熏 on 2017/5/9.
//  Copyright © 2017年 劉洧熏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>


@interface YoubikeManager : AFHTTPSessionManager

+ (instancetype) shared;

//- (void) getStations: (void (^) (Station *stationsFromAPI, NSError *error))block;

@end
