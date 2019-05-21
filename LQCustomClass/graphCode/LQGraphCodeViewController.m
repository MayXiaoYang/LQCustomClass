//
//  LQGraphCodeViewController.m
//  LQCustomClass
//
//  Created by liang lee on 2019/5/20.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import "LQGraphCodeViewController.h"
#import "LQGraphCodeView.h"
@interface LQGraphCodeViewController ()
@property (nonatomic, strong)LQGraphCodeView *graphCodeView;
@end

@implementation LQGraphCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _graphCodeView = [[LQGraphCodeView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH - 80)/2,150, 100, 40) withItemNum:5 withGraphCodeType:GraphCodeNumBetween];
    NSLog(@"graphCodeString---->>>%@",_graphCodeView.graphCodeString);
    WeakSelf(self)
    _graphCodeView.graphCode = ^{
        NSLog(@"graphCodeString---->>>%@",weakSelf.graphCodeView.graphCodeString);
    };
    [self.view addSubview:_graphCodeView];
}


@end
