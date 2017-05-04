//
//  QuestionViewController.m
//  CoreAnimation-Implicit
//
//  Created by kfz on 2017/5/4.
//  Copyright © 2017年 kongfz. All rights reserved.
//

#import "QuestionViewController.h"

@interface QuestionViewController ()
@property (weak, nonatomic) IBOutlet UIView *redView;

@end

@implementation QuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint p = [[touches anyObject] locationInView:self.view];
    self.redView.center = p;
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
