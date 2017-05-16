//
//  Stations.m
//  YouBike_Objc
//
//  Created by 劉洧熏 on 2017/5/13.
//  Copyright © 2017年 劉洧熏. All rights reserved.
//

#import "Stations.h"

@implementation Stations

-(id)initWithName:(NSString *)name enName:(NSString *)enName address:(NSString *)address enaddress:(NSString *)enaddress numberOfRemainingBikes:(NSString *)numberOfReminingBikes stationNumber:(NSString *)stationNumber coordinate:(CLLocationCoordinate2D *)coordinate
{

    if ((self = [super self])) {

        self.name = name;
        self.enName = enName;
        self.address = address;
        self.enAddress = enaddress;
        self.numberOfRemainingBikes = numberOfReminingBikes;
        self.stationNumber = stationNumber;
        self.coordinate = coordinate;

    }

    return self;

}
@end
