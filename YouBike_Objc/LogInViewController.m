//
//  LogInViewController.m
//  YouBike_Objc
//
//  Created by 孟軒蕭 on 09/05/2017.
//  Copyright © 2017 劉洧熏. All rights reserved.
//

#import "LogInViewController.h"
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "TabbarViewController.h"

@interface LogInViewController ()

@end

@implementation LogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [_loginBtn setTitle:@"Login with Facebook" forState:UIControlStateNormal];
    _btnBackView.layer.cornerRadius = 10;
    _btnBackView2.layer.cornerRadius = 10;
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"wood"]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)loginBtnClicked:(id)sender {
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login
     logInWithReadPermissions: @[@"public_profile"]
     fromViewController:self
     handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
         if (error) {
             NSLog(@"Process error");
         } else if (result.isCancelled) {
             NSLog(@"Cancelled");
         } else {
             NSLog(@"Logged in");
             //jump to tabbar controller
             NSString * storyboardName = @"Tabbar";
             UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
             UIViewController * vc = [storyboard instantiateViewControllerWithIdentifier:@"tabbarView"];
             [self presentViewController:vc animated:YES completion:nil];
             
         }
     }];
}
@end
