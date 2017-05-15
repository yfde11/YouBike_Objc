//
//  ProfileViewController.h
//  YouBike_Objc
//
//  Created by 孟軒蕭 on 09/05/2017.
//  Copyright © 2017 劉洧熏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *facePicture;
@property (weak, nonatomic) IBOutlet UILabel *fbUserName;
@property (weak, nonatomic) IBOutlet UIView *fbconnBtnview2;
@property (weak, nonatomic) IBOutlet UIView *fbconnBtnview;
@property (weak, nonatomic) IBOutlet UIView *backYellowView;
- (IBAction)fbConnect:(id)sender;

@end
