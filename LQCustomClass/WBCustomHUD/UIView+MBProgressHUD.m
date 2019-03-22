//
//  UIView+MBProgressHUD.m
//  MBProgressHUD网络加载视图
//
//  Created by DFSJ on 2017/7/21.
//  Copyright © 2017年 dfsj. All rights reserved.
//

#import "UIView+MBProgressHUD.h"

@implementation UIView (MBProgressHUD)

// 只显示活动指示
- (MBProgressHUD *)showActivity
{
    MBProgressHUD *hud = [MBProgressHUD HUDForView:self];
    if (nil == hud) {
        hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
        hud.bezelView.color=[[UIColor blackColor]colorWithAlphaComponent:0.8];
        hud.contentColor = [UIColor whiteColor];
    }
    hud.removeFromSuperViewOnHide = YES;
    return hud;
}

// 显示活动指示及文本
- (MBProgressHUD *)showActivityWithText:(NSString *)text
{
    MBProgressHUD *hud = [MBProgressHUD HUDForView:self];
    if (nil == hud) {
        hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    }
    hud.label.text = text;
    hud.bezelView.color=[[UIColor blackColor]colorWithAlphaComponent:0.8];
    hud.contentColor = [UIColor whiteColor];

    hud.removeFromSuperViewOnHide = YES;
    return hud;
}

// 移除活动指示
- (void)hideActivity
{    
    [[MBProgressHUD HUDForView:self]hideAnimated:YES];
}

// 不显示活动指示，只显示文本，指定显示时长
- (MBProgressHUD *)showTextNoActivity:(NSString *)text timeLength:(CGFloat)time
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.bezelView.color=[[UIColor blackColor]colorWithAlphaComponent:0.8];
    hud.contentColor = [UIColor whiteColor];
    hud.label.text = text;
    [hud hideAnimated:YES afterDelay:time];
    return hud;
}

// 显示文本及指定图片，指定显示时长
- (MBProgressHUD *)showText:(NSString *)text image:(UIImage *)image timeLength:(CGFloat)time
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    hud.bezelView.color=[[UIColor blackColor]colorWithAlphaComponent:0.8];
    hud.contentColor = [UIColor whiteColor];
    hud.label.text = text;
    [hud hideAnimated:YES afterDelay:time];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    hud.customView = imageView;
    return hud;
}

// 显示文本及指定图片，指定显示时长
- (MBProgressHUD *)showText:(NSString *)text imageName:(NSString *)imageName timeLength:(CGFloat)time
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    hud.bezelView.color=[[UIColor blackColor]colorWithAlphaComponent:0.8];
    hud.contentColor = [UIColor whiteColor];
    hud.userInteractionEnabled = NO;
    hud .label.text = text;
    [hud hideAnimated:YES afterDelay:time];
    UIImage *image = [UIImage imageNamed:imageName];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    hud.customView = imageView;
    return hud;
}
#pragma mark ------- 在指定view上展示HUD
-(void)showCustomViewOnView:(UIView *)superView WithStr:(NSString *)str{
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:superView animated:YES];
    //修改样式，否则等待框背景色将为半透明
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    //设置等待框背景色为黑色
    hud.bezelView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
    //设置菊花框为白色
    hud.activityIndicatorColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
    hud.label.text = NSLocalizedString(str, @"HUD loading title");
    hud.label.textColor = [UIColor whiteColor];
    hud.userInteractionEnabled = YES;
}
-(void)HUDHideFromView:(UIView *)superView{
    [MBProgressHUD hideHUDForView:superView animated:YES];
}
#pragma mark ------- 在self.view上展示HUD
-(void)showCustomViewWithStr:(NSString *)str{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    //修改样式，否则等待框背景色将为半透明
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    //设置等待框背景色为黑色
    hud.bezelView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
    //设置菊花框为白色
    hud.activityIndicatorColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
    hud.label.text = NSLocalizedString(str, @"HUD loading title");
    hud.label.textColor = [UIColor whiteColor];
    hud.userInteractionEnabled = YES;
}
-(void)hideHUDFromSupView{
    [MBProgressHUD hideHUDForView:self animated:YES];
}

@end
