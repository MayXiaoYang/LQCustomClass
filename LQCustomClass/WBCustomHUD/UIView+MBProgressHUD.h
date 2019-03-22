//
//  UIView+MBProgressHUD.h
//  MBProgressHUD网络加载视图
//
//  Created by DFSJ on 2017/7/21.
//  Copyright © 2017年 dfsj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MBProgressHUD.h>
@interface UIView (MBProgressHUD)

// 只显示活动指示
- (MBProgressHUD *)showActivity;

// 显示活动指示及文本
- (MBProgressHUD *)showActivityWithText:(NSString *)text;

// 隐藏活动指示
- (void)hideActivity;

// 不显示活动指示，只显示文本，指定显示时长
- (MBProgressHUD *)showTextNoActivity:(NSString *)text timeLength:(CGFloat)time;

// 显示文本及指定图片，指定显示时长
- (MBProgressHUD *)showText:(NSString *)text image:(UIImage *)image timeLength:(CGFloat)time;

// 显示文本及指定图片，指定显示时长
- (MBProgressHUD *)showText:(NSString *)text imageName:(NSString *)imageName timeLength:(CGFloat)time;

/** 在指定view上展示HUD */
-(void)showCustomViewOnView:(UIView *)superView WithStr:(NSString *)str;
/** 移除指定view上的HUD */
-(void)HUDHideFromView:(UIView *)superView;
/** 在self.view上展示HUD */
-(void)showCustomViewWithStr:(NSString *)str;
/** 移除self.view上的HUD */
-(void)hideHUDFromSupView;
@end
