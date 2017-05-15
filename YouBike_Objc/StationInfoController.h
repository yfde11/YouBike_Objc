//
//  StationInfoController.h
//  YouBike_Objc
//
//  Created by 劉洧熏 on 2017/5/12.
//  Copyright © 2017年 劉洧熏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StationInfoController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *stationsTableView;
@property (weak, nonatomic) IBOutlet UICollectionView *stationsCollectionView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *listSwitch;

- (IBAction)switchList:(UISegmentedControl *)sender;

@end
