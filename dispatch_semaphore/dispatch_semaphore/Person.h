//
//  Person.h
//  dispatch_semaphore
//
//  Created by kfz on 2017/5/4.
//  Copyright © 2017年 kongfz. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Dog;
@interface Person : NSObject

@property (strong, nonatomic) Dog *dog;
- (void)say;

@end


@interface Dog : NSObject

- (void)run ;

@end
