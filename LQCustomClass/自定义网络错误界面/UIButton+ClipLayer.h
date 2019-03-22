//
//  UIButton+ClipLayer.h
//  EarnEveryDay
//
//  Created by LYKJ on 16/11/23.
//  Copyright © 2016年 LYKJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (ClipLayer)

- (void)clipLayerRadius:(CGFloat)radius andBackgroundColor:(UIColor *)backColor andTitle:(NSString *)title;


// 改变登录按钮
- (void)changeLoginBtnUI:(BOOL)change;

@end
