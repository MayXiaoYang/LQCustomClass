//
//  ILNaviagtionController.m
//  IntelligentLamp
//
//  Created by liang lee on 2018/11/3.
//  Copyright © 2018年 li xiao yang. All rights reserved.
//

#import "ILNaviagtionController.h"

@interface ILNaviagtionController (){
    UIButton *_btn_back;
}

@end

@implementation ILNaviagtionController
/**
 *  是否正在手势返回中的标示状态
 */
static BOOL _isPoping;

-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    if (!_isPoping) {
        _isPoping = YES;
        return YES;
    }
    return NO;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //开启ios右滑返回
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = nil;
    }
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    //在didAppear时置为NO
    _isPoping = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count > 0) { // 如果push进来的不是第一个控制器
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"jiantou1"] forState:UIControlStateNormal];
        btn.frame = CGRectMake(0, 0, 40, 40);
        // 让按钮内部的所有内容左对齐
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        //设置内边距，让按钮靠近屏幕边缘
        btn.contentEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 0);
        [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
        viewController.hidesBottomBarWhenPushed = YES; // 隐藏底部的工具条
    }
    // 一旦调用super的pushViewController方法,就会创建子控制器viewController的view并调用viewController的viewDidLoad方法。可以在viewDidLoad方法中重新设置自己想要的左上角按钮样式
    [super pushViewController:viewController animated:animated];
    
}

-(void)back{
    [self popViewControllerAnimated:YES];
}

@end
