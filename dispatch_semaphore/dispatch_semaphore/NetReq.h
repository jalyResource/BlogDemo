//
//  NetReq.h
//  dispatch_semaphore
//
//  Created by kfz on 2017/5/4.
//  Copyright © 2017年 kongfz. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^SuccessBlock)(NSDictionary *data);
typedef void (^FailureBlock)(NSError *error);

@interface NetReq : NSObject


+ (void)getBookInfoWithShopId:(nonnull NSString *)shopId bookId:(nonnull NSString *)bookId success:(nonnull SuccessBlock)sb fail:(nonnull FailureBlock)fb ;
@end
