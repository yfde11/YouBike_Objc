//
//  YoubikeManager.m
//  YouBike_Objc
//
//  Created by 劉洧熏 on 2017/5/9.
//  Copyright © 2017年 劉洧熏. All rights reserved.
//

#import "YoubikeManager.h"
#import <Foundation/Foundation.h>
#import <FBSDKAccessToken.h>

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

-(void) getStations:(void (^)(Stations *, NSError *))block
{

    NSString *url = [NSString stringWithFormat: @"http://52.198.40.72/youbike/v1/stations"];
    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:@"token"];
    NSString *tokenType = [[NSUserDefaults standardUserDefaults] objectForKey:@"tokenType"];
    NSString *requestString = [NSString stringWithFormat:@"%@ %@", tokenType, token];

    [self.requestSerializer setValue: requestString forHTTPHeaderField: @"Authorization"];

    [self GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {

        NSLog(@"downloadProgress: %@", downloadProgress);

    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        // Unbox JSON
        //for loop 存station進去stations array
        //取得json內的資料
        NSDictionary *jsonDict = (NSDictionary *) responseObject;

        NSArray *stationArray = [jsonDict objectForKey:@"data"];

        for (NSDictionary *stationDict in stationArray) {
            NSLog(@"ar: %@", stationDict[@"ar"]);
        }

        block(task, nil);

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

        if (block) {

            block(nil, error);

        }

    }];
}

-(void) getToken {
    NSDictionary *headers = @{ @"content-type": @"application/json" };
    NSDictionary *parameters = @{ @"accessToken": FBSDKAccessToken.currentAccessToken.tokenString };

    NSData *postData = [NSJSONSerialization dataWithJSONObject:parameters options:0 error:nil];

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://52.198.40.72/youbike/v1/sign-in/facebook"]
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:10.0];
    [request setHTTPMethod:@"POST"];
    [request setAllHTTPHeaderFields:headers];
    [request setHTTPBody:postData];

    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
                                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                    if (error) {
                                                        NSLog(@"%@", error);
                                                    } else {
                                                        NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                                                        NSDictionary *dataObject = jsonObject[@"data"];
                                                        [[NSUserDefaults standardUserDefaults] setObject:dataObject[@"token"] forKey:@"token"];
                                                        NSLog(@"%@", dataObject[@"token"]);
                                                        [[NSUserDefaults standardUserDefaults] setObject:dataObject[@"tokenType"] forKey:@"tokenType"];
                                                        NSLog(@"%@", dataObject[@"tokenType"]);
                                                    }
                                                }];
    [dataTask resume];
}


@end
