//
//  ProfileViewController.m
//  YouBike_Objc
//
//  Created by 孟軒蕭 on 09/05/2017.
//  Copyright © 2017 劉洧熏. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _fbconnBtnview.layer.cornerRadius = 10;
    _fbconnBtnview2.layer.cornerRadius = 10;
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"wood"]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (IBAction)fbConnect:(id)sender {
}
@end
