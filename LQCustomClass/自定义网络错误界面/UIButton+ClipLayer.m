//
//  UIButton+ClipLayer.m
//  EarnEveryDay
//
//  Created by LYKJ on 16/11/23.
//  Copyright © 2016年 LYKJ. All rights reserved.
//
#define GRAYCOLOR RGB(208, 208, 208)
// 红色
#define REDCOLOR RGB(255, 62, 94)
// 颜色
#define RGB(r, g, b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0]
#import "UIButton+ClipLayer.h"

@implementation UIButton (ClipLayer)

// 改变登录按钮
- (void)changeLoginBtnUI:(BOOL)change
{
    if (change) {
        
        self.enabled = YES;
        self.backgroundColor = REDCOLOR;
        
    }else{
        self.enabled = NO;
        self.backgroundColor = GRAYCOLOR;
        
    }
}


- (void)clipLayerRadius:(CGFloat)radius andBackgroundColor:(UIColor *)backColor andTitle:(NSString *)title
{
    if (radius != 0) {
        
        self.layer.cornerRadius = radius;
        self.layer.masksToBounds = YES;
    }
    
    if (backColor != nil) {
       self.backgroundColor = backColor;
    }
    
    if (title.length != 0) {
        [self setTitle:title forState:(UIControlStateNormal)];
    }
}

@end
