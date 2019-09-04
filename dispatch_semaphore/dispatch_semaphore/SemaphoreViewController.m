//
//  SemaphoreViewController.m
//  dispatch_semaphore
//
//  Created by kfz on 2017/5/4.
//  Copyright © 2017年 kongfz. All rights reserved.
//

#import "SemaphoreViewController.h"
#import "NetReq.h"

@interface SemaphoreViewController ()

@end

@implementation SemaphoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self testSemaphore];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self testMultiNetRequest];
}

- (void)testSemaphore {
    // 信号量是为了解决多线程访问统一资源的情况
//    dispatch_semaphore_t sem = dispatch_semaphore_create(0);
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    
//    dispatch_async(queue, ^{
//        NSLog(@"%@    1", [NSThread currentThread]);
//        
//    });
//    dispatch_async(queue, ^{
//        NSLog(@"%@    1", [NSThread currentThread]);
//    });
//    dispatch_async(queue, ^{
//        NSLog(@"%@    1", [NSThread currentThread]);
//    });
//    dispatch_semaphore_wait(sem, 3);
//    NSLog(@"task over");
}


/**
 * 测试监听多个网络请求
 * 参考链接： http://www.cnblogs.com/breezemist/p/5667776.html
 */
- (void)testMultiNetRequest {
    dispatch_group_t group = dispatch_group_create();
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_group_enter(group);
    [NetReq getBookInfoWithShopId:@"3772" bookId:@"677500739" success:^(NSDictionary *data) {
        NSLog(@"%@  1 : %@", [NSThread currentThread], data[@"name"]);
        dispatch_group_leave(group);
    } fail:^(NSError *error) {
        NSLog(@"1 error");
        dispatch_group_leave(group);
    }];
    
    dispatch_group_enter(group);
    [NetReq getBookInfoWithShopId:@"3772" bookId:@"526377307" success:^(NSDictionary *data) {
        NSLog(@"%@  2 : %@", [NSThread currentThread], data[@"name"]);
        dispatch_group_leave(group);
    } fail:^(NSError *error) {
        NSLog(@"2 error");
        dispatch_group_leave(group);
    }];
    
    dispatch_group_enter(group);
    [NetReq getBookInfoWithShopId:@"3772" bookId:@"135387844" success:^(NSDictionary *data) {
        NSLog(@"%@  3 : %@", [NSThread currentThread], data[@"name"]);
        dispatch_group_leave(group);
    } fail:^(NSError *error) {
        NSLog(@"3 error");
        dispatch_group_leave(group);
    }];
    
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{  // 不阻塞当前线程
        NSLog(@"%@  任务完成", [NSThread currentThread]);
    });
}

- (void)testGroup {
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_semaphore_t sema = dispatch_semaphore_create(0);
    
    dispatch_group_async(group, queue, ^{
        [NetReq getBookInfoWithShopId:@"3772" bookId:@"677500739" success:^(NSDictionary *data) {
            NSLog(@"%@  1 : %@", [NSThread currentThread], data[@"name"]);
        } fail:^(NSError *error) {
            NSLog(@"1 error");
        }];
    });
    
    dispatch_group_async(group, queue, ^{
        [NetReq getBookInfoWithShopId:@"3772" bookId:@"526377307" success:^(NSDictionary *data) {
            NSLog(@"%@  2 : %@", [NSThread currentThread], data[@"name"]);
        } fail:^(NSError *error) {
            NSLog(@"2 error");
        }];
    });
    dispatch_group_async(group, queue, ^{
        [NetReq getBookInfoWithShopId:@"3772" bookId:@"135387844" success:^(NSDictionary *data) {
            NSLog(@"%@  3 : %@", [NSThread currentThread], data[@"name"]);
        } fail:^(NSError *error) {
            NSLog(@"3 error");
        }];
    });
    
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{  // 不阻塞当前线程
        NSLog(@"%@  任务完成", [NSThread currentThread]);
    });
    
    NSLog(@"test over");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
