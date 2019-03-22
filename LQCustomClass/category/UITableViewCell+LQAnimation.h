//
//  UITableViewCell+LQAnimation.h
//  UIViewCategory
//
//  Created by LYKJ on 17/6/13.
//  Copyright © 2017年 LYKJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (LQAnimation)
////延伸扩大动画
- (void) extendAnimation;

////类似百叶窗的动画(什么？！你不知道什么是百叶窗？！呵呵，百度去。)
- (void) shutterAnimation;

////累进递进出现的动画
- (void) graduatedAnimation;

@end
