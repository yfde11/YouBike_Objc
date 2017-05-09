//
//  LogInViewController.m
//  YouBike_Objc
//
//  Created by 孟軒蕭 on 09/05/2017.
//  Copyright © 2017 劉洧熏. All rights reserved.
//

#import "LogInViewController.h"
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface LogInViewController ()

@end

@implementation LogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    _loginBtn.titleLabel.text = @"Login with Facebook";
    [_loginBtn setTitle:@"Login with Facebook" forState:UIControlStateNormal];
    _btnBackView.layer.cornerRadius = 10;
    _btnBackView2.layer.cornerRadius = 10;
    
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    loginButton.center = self.view.center;
    [self.view addSubview:loginButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
