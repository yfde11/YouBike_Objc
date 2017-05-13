//
//  ProfileNavgationViewController.m
//  YouBike_Objc
//
//  Created by 孟軒蕭 on 12/05/2017.
//  Copyright © 2017 劉洧熏. All rights reserved.
//

#import "ProfileNavgationViewController.h"
#import "ProfileViewController.h"
#import <UIKit/UIKit.h>

@interface ProfileNavgationViewController ()

@end

@implementation ProfileNavgationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIStoryboard *pSB = [UIStoryboard storyboardWithName:@"Profile" bundle:nil];
    ProfileViewController *pVC = [pSB instantiateViewControllerWithIdentifier:@"profilePage"];
    [self pushViewController:pVC animated:true];
    
//    [self.navigationController setViewControllers:[NSArray arrayWithObject:pVC] animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
