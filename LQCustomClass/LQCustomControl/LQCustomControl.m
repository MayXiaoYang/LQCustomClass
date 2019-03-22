//
//  LQCustomControl.m
//  LQCustomControl
//
//  Created by LYKJ on 17/5/27.
//  Copyright © 2017年 LYKJ. All rights reserved.
//

#import "LQCustomControl.h"

@implementation LQCustomControl

//Label
+ (UILabel *)createLabelWithFrame:(CGRect)frame
                             text:(NSString *)text
                          bgColor:(UIColor *)bgColor
                        textColor:(UIColor *)textColor
                             font:(UIFont *)font
                    textAlignment:(NSTextAlignment)textAlignment{
    
    UILabel *lbl = [[UILabel alloc]initWithFrame:frame];
    lbl.text = text;
    lbl.textColor = textColor;
    lbl.backgroundColor = bgColor;
    lbl.font = font;
    lbl.textAlignment = textAlignment;
    return lbl;
}

//Button
+ (UIButton *)createBtnWithFrame:(CGRect)frame
                            text:(NSString *)text
                         bgColor:(UIColor *)bgColor
                       textColor:(UIColor *)textColor
                            font:(UIFont *)font
                           image:(UIImage *)image
                          target:(id)target
                          action:(SEL)action{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    btn.titleLabel.font = font;
    btn.backgroundColor = bgColor;
    [btn setTitle:text forState:UIControlStateNormal];
    [btn setImage:image forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

//TextField
+ (UITextField *)createTextFieldWithFrame:(CGRect)frame
                              placeholder:(NSString *)placeholder
                              borderStyle:(UITextBorderStyle)borderStyle
                          secureTextEntry:(BOOL)secureTextEntry{
    
    UITextField* textField = [[UITextField alloc]initWithFrame:frame];
    textField.placeholder = placeholder;
    textField.borderStyle = borderStyle;
    textField.secureTextEntry = secureTextEntry;
    return textField;
}

//TextView
+ (UITextView *)createTextViewWithFrame:(CGRect)frame
                        backgroundColor:(UIColor *)backgroundColor
                               editable:(BOOL)editable
                          scrollEnabled:(BOOL)scrollEnabled
                                   font:(UIFont *)font{
    
    UITextView *textView = [[UITextView alloc]initWithFrame:frame];
    textView.backgroundColor = backgroundColor;
    textView.editable = editable;
    textView.scrollEnabled = scrollEnabled;
    textView.font = font;
    return textView;
}

//ImageView
+ (UIImageView *)createImageViewWithFrame:(CGRect)frame
                                    image:(UIImage *)image{
    
    UIImageView* img = [[UIImageView alloc]initWithFrame:frame];
    img.image = image;
    return img;
}

//View
+ (UIView *)createViewWithFrame:(CGRect)frame
                        bgColor:(UIColor *)bgColor{
    
    UIView* view = [[UIView alloc]initWithFrame:frame];
    view.backgroundColor = bgColor;
    return view;
}


@end
