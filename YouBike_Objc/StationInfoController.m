//
//  StationInfoController.m
//  YouBike_Objc
//
//  Created by 劉洧熏 on 2017/5/12.
//  Copyright © 2017年 劉洧熏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StationInfoController.h"
#import "Station.h"

@interface StationInfoController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation StationInfoController


- (void)viewDidLoad {

    [super viewDidLoad];
    [self setUpTableView];

}

-(void)setUpTableView {

    self.stationsTableView.delegate = self;
    self.stationsTableView.dataSource = self;

}


@end
