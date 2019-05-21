//
//  LQTextAndImgViewController.m
//  LQCustomClass
//
//  Created by liang lee on 2019/5/20.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import "LQTextAndImgViewController.h"
#import "UIButton+Location.h"
@interface LQTextAndImgViewController ()

@end

@implementation LQTextAndImgViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100*WidthRatio, 48*WidthRatio);
    [btn setImage:[UIImage imageNamed:@"add3"] forState:UIControlStateNormal];
    [btn setTitle:@"add" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor redColor];
    [btn setBtnTextLeftAndImageRightWithSpace:10*WidthRatio];
    [self.view addSubview:btn];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(100, CGRectGetMaxY(btn.frame)+ 20, 100*WidthRatio, 100*WidthRatio);
    [btn2 setImage:[UIImage imageNamed:@"add3"] forState:UIControlStateNormal];
    [btn2 setTitle:@"add" forState:UIControlStateNormal];
    btn2.backgroundColor = [UIColor redColor];
    [btn2 setBtnImageTopAndTextBottomWithSpace:20*WidthRatio];
    [self.view addSubview:btn2];
    
}


@end
