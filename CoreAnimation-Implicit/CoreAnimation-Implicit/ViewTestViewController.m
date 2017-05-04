//
//  ViewTestViewController.m
//  CoreAnimation-Implicit
//
//  Created by kfz on 2017/5/4.
//  Copyright © 2017年 kongfz. All rights reserved.
//

#import "ViewTestViewController.h"

@interface ViewTestViewController ()
@property (weak, nonatomic) IBOutlet UIView *redView;

@end

@implementation ViewTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"%@   %@", nil ,[NSNull null]);
    NSLog(@"%@", [self.redView actionForLayer:self.redView.layer forKey:@"backgroundColor"]);
    

    [UIView animateWithDuration:0.1 animations:^{
        NSLog(@"%@", [self.redView actionForLayer:self.redView.layer forKey:@"backgroundColor"]);
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint p = [[touches anyObject] locationInView:self.view];
    self.redView.center = p;
}

- (IBAction)action1:(UIButton *)sender {
    if (_redView.layer.delegate == nil) {
        _redView.layer.delegate = _redView;
        [sender setTitle:@"delegate = redView" forState:UIControlStateNormal];
    } else {
        _redView.layer.delegate = nil;
        [sender setTitle:@"delegate = nil" forState:UIControlStateNormal];
    }
}


@end
