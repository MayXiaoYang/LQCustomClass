//
//  ViewController.m
//  LQCustomClass
//
//  Created by liang lee on 2019/3/22.
//  Copyright © 2019年 li xiao yang. All rights reserved.
//

#import "ViewController.h"
#import "LQGraphCodeView.h"
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
}


@end
