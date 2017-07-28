//
//  MsgForwardViewController.m
//  dispatch_semaphore
//
//  Created by kfz on 2017/5/4.
//  Copyright © 2017年 kongfz. All rights reserved.
//

#import "MsgForwardViewController.h"
#import "Person.h"
#import "NSObject+logVarMethod.h"

@interface MsgForwardViewController ()
@property (strong, nonatomic) Person *p;
@end

@implementation MsgForwardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.p = [Person new];
    [self.p say];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self testMsgForward];
}


- (void)testMsgForward {
    
    SEL sel = @selector(run);
    [self.p performSelector:sel];
}



@end
