//
//  MJRefreshCustomHeader.m
//  WisdomBean
//
//  Created by liang lee on 2018/10/22.
//  Copyright © 2018年 li xiao yang. All rights reserved.
//

#import "MJRefreshCustomHeader.h"

@implementation MJRefreshCustomHeader

- (void)prepare{
    [super prepare];
    
    //所有的自定义东西都放在这里
    [self setTitle:@"下拉加载更多~" forState:MJRefreshStateIdle];
    [self setTitle:@"松开进入刷新状态~" forState:MJRefreshStatePulling];
    [self setTitle:@"拼命加载中..." forState:MJRefreshStateRefreshing];
    [self setTitle:@"即将刷新的状态" forState:MJRefreshStateWillRefresh];
    [self setTitle:@"我是有底线的~" forState:MJRefreshStateNoMoreData];
    
    self.lastUpdatedTimeLabel.hidden = YES;
    self.automaticallyChangeAlpha = YES;
    //一些其他属性设置
    /*
     // 设置字体
     self.stateLabel.font = [UIFont systemFontOfSize:15];
     self.lastUpdatedTimeLabel.font = [UIFont systemFontOfSize:14];
     
     // 设置颜色
     self.stateLabel.textColor = [UIColor redColor];
     self.lastUpdatedTimeLabel.textColor = [UIColor blueColor];
     // 隐藏时间
     self.lastUpdatedTimeLabel.hidden = YES;
     
     // 隐藏状态
     self.stateLabel.hidden = YES;
     // 设置自动切换透明度(在导航栏下面自动隐藏)
     self.automaticallyChangeAlpha = YES;
     */
}

//如果需要自己重新布局子控件
- (void)placeSubviews{
    [super placeSubviews];
    
    //如果需要自己重新布局子控件，请在这里设置
    //箭头
    //    self.arrowView.center =
}
@end
