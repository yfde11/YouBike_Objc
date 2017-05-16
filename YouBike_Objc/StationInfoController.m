//
//  StationInfoController.m
//  YouBike_Objc
//
//  Created by 劉洧熏 on 2017/5/12.
//  Copyright © 2017年 劉洧熏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StationsTableViewCell.h"
#import "StationsCollectionViewCell.h"
#import "StationInfoController.h"
#import "Stations.h"

@interface StationInfoController () <UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource>

{
    NSArray<Stations *> *stationsArray;
}

@end

@implementation StationInfoController

- (void)viewDidLoad {

    [super viewDidLoad];
    [self setUpTableView];
    [self setUpCollectionView];
    self.stationsCollectionView.hidden = YES;

}

-(void)setUpTableView
{

    self.stationsTableView.delegate = self;
    self.stationsTableView.dataSource = self;
    [self.stationsTableView registerNib: [UINib nibWithNibName: @"StationsTableViewCell" bundle:nil]
             forCellReuseIdentifier: @"StationsTableViewCell"];

}

-(void)setUpCollectionView
{

    CGRect screenSize = UIScreen.mainScreen.bounds;
    self.stationsCollectionView.delegate = self;
    self.stationsCollectionView.dataSource = self;
    [self.stationsCollectionView registerNib:[UINib nibWithNibName: @"StationsCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"StationsCollectionViewCell"];

    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(14, 14, 14, 14);
    layout.minimumLineSpacing = 14;
    layout.minimumInteritemSpacing = 14;
    layout.itemSize = CGSizeMake((screenSize.size.width - 42) / 2, (screenSize.size.width - 42) / 2);

    self.stationsCollectionView.collectionViewLayout = layout;

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 122;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 5;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    StationsTableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier: @"StationsTableViewCell"];

    return tableViewCell;

}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    return 20;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    StationsCollectionViewCell *collectionCell = [collectionView dequeueReusableCellWithReuseIdentifier: @"StationsCollectionViewCell" forIndexPath: indexPath];

    return collectionCell;

}
- (IBAction)switchList:(UISegmentedControl *)sender {

    switch (self.listSwitch.selectedSegmentIndex) {

        case 0:

            self.stationsTableView.hidden = NO;
            self.stationsCollectionView.hidden = YES;

            break;

        case 1:

            self.stationsTableView.hidden = YES;
            self.stationsCollectionView.hidden = NO;

        default:

            break;

    }
}

@end
