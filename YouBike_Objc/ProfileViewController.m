//
//  ProfileViewController.m
//  YouBike_Objc
//
//  Created by 孟軒蕭 on 09/05/2017.
//  Copyright © 2017 劉洧熏. All rights reserved.
//

#import "ProfileViewController.h"
#import "ProfileNavgationViewController.h"
@import SafariServices;

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _fbconnBtnview.layer.cornerRadius = 10;
    _fbconnBtnview2.layer.cornerRadius = 10;
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"wood"]];
    self.navigationItem.title = @"Profile";

    _fbUserName.text = [[NSUserDefaults standardUserDefaults]stringForKey:@"firstName"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (IBAction)fbConnect:(id)sender {
    SFSafariViewController *safariVC = [[SFSafariViewController alloc]initWithURL:[NSURL URLWithString:[[NSUserDefaults standardUserDefaults]stringForKey:@"link"]] entersReaderIfAvailable:NO];
    safariVC.delegate = self;
    [self presentViewController:safariVC animated:NO completion:nil];
}
@end
