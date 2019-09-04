//
//  Person.m
//  dispatch_semaphore
//
//  Created by kfz on 2017/5/4.
//  Copyright © 2017年 kongfz. All rights reserved.
//

#import "Person.h"
//#import <objc/objc-runtime.h>
#import <objc/runtime.h>



@implementation Person
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.dog = [Dog new];
    }
    return self;
}

void run(id self, SEL _cmd)
{
    NSLog(@"%@ - Run", self);
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    NSLog(@"%s  sel:%@", __func__, NSStringFromSelector(sel));
//    NSString *selString = NSStringFromSelector(sel);
//    if ( [selString isEqualToString:@"run"] ) {
//        class_addMethod([self class], sel, (IMP)run, "v@:");
//        return YES;
//    }
    return [super resolveInstanceMethod:sel];
}


//
- (id)forwardingTargetForSelector:(SEL)aSelector {
    NSString *selString = NSStringFromSelector(aSelector);
    NSLog(@"%s  sel:%@", __func__, selString);
    if ( [selString isEqualToString:@"run"] ) {
        return self.dog;
    }
    return [super forwardingTargetForSelector:aSelector];
}
//
//- (void)forwardInvocation:(NSInvocation *)anInvocation {
//    
//}

- (void)say {
    NSLog(@"%s", __func__);
    
}
@end


@implementation Dog

- (void)run {
    NSLog(@"%s", __func__);
}

@end
