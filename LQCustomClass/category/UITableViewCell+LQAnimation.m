//
//  UITableViewCell+LQAnimation.m
//  UIViewCategory
//
//  Created by LYKJ on 17/6/13.
//  Copyright © 2017年 LYKJ. All rights reserved.
//

#import "UITableViewCell+LQAnimation.h"

@implementation UITableViewCell (LQAnimation)
//延伸扩大动画
-(void)extendAnimation
{
    self.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1);
    [UIView animateWithDuration:0.25 animations:^{
        self.layer.transform = CATransform3DMakeScale(1, 1, 1);
    }];
}
//百叶窗动画
-(void)shutterAnimation
{
    self.layer.transform = CATransform3DMakeScale(1, 0.1, 0.1);
    [UIView animateWithDuration:0.35 animations:^{
        self.layer.transform = CATransform3DMakeScale(1, 1, 1);
    }];
}
//累进递进动画
-(void)graduatedAnimation
{
    self.transform = CGAffineTransformMakeScale(0.8, 0.8);
    self.alpha = 0.0;
    [UIView animateWithDuration:0.3 animations:^{
        self.transform = CGAffineTransformMakeScale(1.0, 1.0);
        self.alpha = 1.0;
    }];
}
@end
