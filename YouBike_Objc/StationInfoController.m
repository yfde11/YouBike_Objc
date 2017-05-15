//
//  StationInfoController.m
//  YouBike_Objc
//
//  Created by 劉洧熏 on 2017/5/12.
//  Copyright © 2017年 劉洧熏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StationsTableViewCell.h"
#import "StationInfoController.h"
#import "Stations.h"


@interface StationInfoController () <UITableViewDelegate, UITableViewDataSource>

{
    NSArray<Stations *> *stationsArray;
}

@end

@implementation StationInfoController

@synthesize listSwitch;
@synthesize stationsCollectionView;
@synthesize stationsTableView;

- (void)viewDidLoad {

    [super viewDidLoad];
    [self setUpTableView];
    self.stationsCollectionView.hidden = YES;

}

-(void)setUpTableView
{

    self.stationsTableView.delegate = self;
    self.stationsTableView.dataSource = self;
    [stationsTableView registerNib: [UINib nibWithNibName: @"StationsTableViewCell" bundle:nil]
             forCellReuseIdentifier: @"StationsTableViewCell"];

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    StationsTableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier: @"StationsTableViewCell"];

//    if (tableViewCell == nil) {
//
//        tableViewCell = [[StationsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"StationsTableViewCell"];
//
//    }

    return tableViewCell;
}

- (IBAction)switchList:(UISegmentedControl *)sender {

    switch (listSwitch.selectedSegmentIndex) {

        case 0:

            stationsTableView.hidden = NO;
            stationsCollectionView.hidden = YES;

            break;

        case 1:

            stationsTableView.hidden = YES;
            stationsCollectionView.hidden = NO;

        default:

            break;

    }
}
@end


















