//
//  YoubikeManager.m
//  YouBike_Objc
//
//  Created by 劉洧熏 on 2017/5/9.
//  Copyright © 2017年 劉洧熏. All rights reserved.
//

#import "YoubikeManager.h"

@implementation YoubikeManager

+ (instancetype) shared
{
    static YoubikeManager *instance = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        instance = [[YoubikeManager alloc] init];
        
    });
    
    return instance;
}

-(void) getStations:(void (^)(Station *, NSError *))block
{

    NSString *url = [NSString stringWithFormat: @"setUrl"];
    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:@"token"];

    [self.requestSerializer setValue: token forHTTPHeaderField: @"Authorization"];

    [self GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {

        NSLog(@"downloadProgress: %@", downloadProgress);

    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        if (task == nil) {

            block(nil, responseObject);

        } else {

            Station *stations = [Station new];
            [stations address];
            // Unbox JSON
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

        if (block) {

            block(nil, error);

        }

    }];
}

@end
