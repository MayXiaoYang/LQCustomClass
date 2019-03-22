//
//  LQCustomControl.h
//  LQCustomControl
//
//  Created by LYKJ on 17/5/27.
//  Copyright © 2017年 LYKJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface LQCustomControl : NSObject

////一句代码创建label
+ (UILabel *)createLabelWithFrame:(CGRect)frame text:(NSString *)text bgColor:(UIColor *)bgColor textColor:(UIColor *)textColor font:(UIFont *)font textAlignment:(NSTextAlignment)textAlignment;

////一句代码创建btn
+ (UIButton *)createBtnWithFrame:(CGRect)frame text:(NSString *)text bgColor:(UIColor *)bgColor textColor:(UIColor *)textColor font:(UIFont *)font image:(UIImage *)image target:(id)target action:(SEL)action;

////一句话创建UITextField
+ (UITextField *)createTextFieldWithFrame:(CGRect)frame placeholder:(NSString *)placeholder borderStyle:(UITextBorderStyle)borderStyle secureTextEntry:(BOOL)secureTextEntry;

////一句话创建UITextView
+ (UITextView *)createTextViewWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor editable:(BOOL)editable scrollEnabled:(BOOL)scrollEnabled font:(UIFont *)font;

////一句话创建imageView
+ (UIImageView *)createImageViewWithFrame:(CGRect)frame image:(UIImage *)image;

////一句话创建view
+ (UIView *)createViewWithFrame:(CGRect)frame bgColor:(UIColor *)bgColor;


@end
