//
//  NetReq.m
//  dispatch_semaphore
//
//  Created by kfz on 2017/5/4.
//  Copyright © 2017年 kongfz. All rights reserved.
//

#import "NetReq.h"
#import <AFNetworking.h>

@implementation NetReq

static NSString *const urlString = @"https://app.kongfz.com/shop/getItemInfo";

static AFHTTPSessionManager *manager = nil;
+ (AFHTTPSessionManager *)shareManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPSessionManager manager];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/xml", @"text/plain", nil];
        manager.requestSerializer.timeoutInterval = 30.;
    });
    return manager;
}

+ (void)getBookInfoWithShopId:(nonnull NSString *)shopId bookId:(nonnull NSString *)bookId success:(nonnull SuccessBlock)sb fail:(nonnull FailureBlock)fb {

    NSDictionary *d = @{
                        @"itemId": bookId,
                        @"shopId": shopId,
                        @"appName" : @"IOS_KFZ_COM",
                        @"appVersion" : @"2.0.6",
                        @"UserAgent" : @"IOS_KFZ_COM_2.0.0_iPhone Simulator_10.0"
                        };

    
    [[self shareManager] POST:urlString parameters:d progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *responseObject) {
        sb(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fb(error);
    }];
}


@end
