//
//  LogInViewController.m
//  YouBike_Objc
//
//  Created by 孟軒蕭 on 09/05/2017.
//  Copyright © 2017 劉洧熏. All rights reserved.
//

#import "LogInViewController.h"
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKAccessToken.h>
#import <FBSDKGraphRequest.h>
#import "TabbarViewController.h"
#import "YoubikeManager.h"

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
             [self presentViewController:vc animated:true completion:nil];
             NSLog(@"%@", FBSDKAccessToken.currentAccessToken.tokenString);

             [self getFacebookProfileInfos];
             [YoubikeManager.shared getToken];
         }
     }];
}

-(void)getFacebookProfileInfos {
    NSMutableDictionary* parameters = [NSMutableDictionary dictionary];
    [parameters setValue:@"id,first_name,email,link,last_name" forKey:@"fields"];


    FBSDKGraphRequest *requestMe = [[FBSDKGraphRequest alloc]initWithGraphPath:@"me" parameters:parameters];

    FBSDKGraphRequestConnection *connection = [[FBSDKGraphRequestConnection alloc] init];

    [connection addRequest:requestMe completionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {

        if(result)
        {

            if ([result objectForKey:@"first_name"]) {

                NSLog(@"First Name : %@",[result objectForKey:@"first_name"]);
                [[NSUserDefaults standardUserDefaults] setObject:[result objectForKey:@"first_name"] forKey:@"firstName"];

            }if ([result objectForKey:@"last_name"]) {

                NSLog(@"Last Name : %@",[result objectForKey:@"last_name"]);
                [[NSUserDefaults standardUserDefaults] setObject:[result objectForKey:@"last_name"] forKey:@"lastName"];
            }
            if ([result objectForKey:@"id"]) {
                
                NSLog(@"User id : %@",[result objectForKey:@"id"]);
                [[NSUserDefaults standardUserDefaults] setObject:[result objectForKey:@"id"] forKey:@"id"];

            }if ([result objectForKey:@"link"]) {

                NSLog(@"User link : %@",[result objectForKey:@"link"]);
                [[NSUserDefaults standardUserDefaults] setObject:[result objectForKey:@"link"] forKey:@"link"];

            }if ([result objectForKey:@"email"]) {

                NSLog(@"Email: %@",[result objectForKey:@"email"]);
                [[NSUserDefaults standardUserDefaults] setObject:[result objectForKey:@"email"] forKey:@"email"];
                
            }

        }
        
    }];
    
    [connection start];
}
@end
