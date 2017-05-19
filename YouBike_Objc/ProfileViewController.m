//
//  ProfileViewController.m
//  YouBike_Objc
//
//  Created by 孟軒蕭 on 09/05/2017.
//  Copyright © 2017 劉洧熏. All rights reserved.
//

#import "ProfileViewController.h"
#import "ProfileNavgationViewController.h"
#import "YoubikeManager.h"
@import SafariServices;

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _fbconnBtnview.layer.cornerRadius = 10;
    _fbconnBtnview2.layer.cornerRadius = 10;
    _backYellowView.layer.cornerRadius = 20;
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"wood"]];
    self.navigationItem.title = @"Profile";

    _fbUserName.text = [[NSUserDefaults standardUserDefaults]stringForKey:@"firstName"];
    NSURL *imageUrl = [NSURL URLWithString:[[NSUserDefaults standardUserDefaults]stringForKey:@"url"]];
    NSData *imageData = [NSData dataWithData:UIImagePNGRepresentation([UIImage imageWithData:[NSData dataWithContentsOfURL:imageUrl]])];
    UIImage *image = [UIImage imageWithData:imageData];

    _facePicture.image = image;
    _facePicture.layer.cornerRadius = _facePicture.frame.size.width /2;
    _facePicture.clipsToBounds = YES;
    _facePicture.layer.borderWidth = 6;

    UIColor *color = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.3];
    _facePicture.layer.borderColor = color.CGColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (IBAction)fbConnect:(id)sender {
    SFSafariViewController *safariVC = [[SFSafariViewController alloc]initWithURL:[NSURL URLWithString:[[NSUserDefaults standardUserDefaults]stringForKey:@"link"]] entersReaderIfAvailable:NO];
    safariVC.delegate = self;
    [self presentViewController:safariVC animated:NO completion:nil];
    [YoubikeManager.shared getStations:^(NSMutableArray *stationsFromAPI, NSError *error) {
        NSLog(@"e04e040e04:  %@", stationsFromAPI);
    }];
}
@end
