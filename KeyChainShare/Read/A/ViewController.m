//
//  ViewController.m
//  A
//
//  Created by li’Pro on 2019/9/4.
//  Copyright © 2019 li’Pro. All rights reserved.
//

#import "ViewController.h"
#import <SAMKeychain/SAMKeychain.h>

static NSString *const kService = @"com.jaly.www.service";
static NSString *const kAccount = @"com.jaly.www.service.account";

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lblTip;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}

- (IBAction)btnClicked:(id)sender {
    NSString *psw = [SAMKeychain passwordForService:kService account:kAccount];
    self.lblTip.text = psw;
}

@end
