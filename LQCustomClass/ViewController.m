//
//  ViewController.m
//  LQCustomClass
//
//  Created by liang lee on 2019/3/22.
//  Copyright © 2019年 li xiao yang. All rights reserved.
//

#import "ViewController.h"
#import "LQGraphCodeView.h"
#import "UIButton+Location.h"
@interface ViewController (){
   
}
@property (nonatomic, strong)LQGraphCodeView *graphCodeView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _graphCodeView = [[LQGraphCodeView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH - 80)/2,150, 100, 40) withItemNum:5 withGraphCodeType:GraphCodeNumBetween];
    NSLog(@"graphCodeString---->>>%@",_graphCodeView.graphCodeString);
    WeakSelf(self)
    _graphCodeView.graphCode = ^{
        NSLog(@"graphCodeString---->>>%@",weakSelf.graphCodeView.graphCodeString);
    };
    [self.view addSubview:_graphCodeView];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 100*WidthRatio, 48*WidthRatio);
    btn.center = self.view.center;
    [btn setImage:[UIImage imageNamed:@"add3"] forState:UIControlStateNormal];
    [btn setTitle:@"add" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor redColor];
//    [btn setBtnImageTopAndTextBottomWithSpace:20*WidthRatio];
    [btn setBtnTextLeftAndImageRightWithSpace:10*WidthRatio];
    [self.view addSubview:btn];
}


@end
