//
//  LLToast.m
//
//  Created by LYKJ on 17/5/16.
//  Copyright © 2017年 LYKJ. All rights reserved.
//

#import "LLToast.h"

@interface LLToast (){
    //显示的字符串
    NSString *_text;
    //显示的Label
//    UILabel *_contentView;
    //显示的时间
    CGFloat _duration;
    
}
@property (nonatomic, strong)UILabel *contentView;

@end

@implementation LLToast

-(id)initWithText:(NSString* )text{
    if (self = [super init]) {
        
        _text = [text copy];
        
        UIFont* font = [UIFont systemFontOfSize:15.0f];
        
        CGSize textSize = [text boundingRectWithSize:CGSizeMake(280, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font} context:nil].size;
        
        _contentView = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, textSize.width + 20, textSize.height + 20)];
        
        _contentView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.7];
        
        _contentView.textColor = [UIColor whiteColor];
        
        _contentView.textAlignment = NSTextAlignmentCenter;
        
        _contentView.font = font;
        
        _contentView.text = text;
        
        _contentView.numberOfLines = 0;
        
        _contentView.layer.cornerRadius = 5.0f;
        
        _contentView.layer.masksToBounds = YES;
        
//        _contentView.layer.borderWidth = 1.0f;
//        
//        _contentView.layer.borderColor = [[UIColor blackColor]colorWithAlphaComponent:0.7].CGColor;
        
        _duration = 2.0f; //提示框显示时间
    }
    return self;
}
#pragma mark ------- 自定义私有方法
-(void)setDuration:(CGFloat)duration{
    
    _duration = duration;
}

//显示自定义控件
-(void)show{
    
    UIWindow* window = [UIApplication sharedApplication].keyWindow;
    
    _contentView.center = window.center;
    
    [window addSubview:_contentView];
    //执行显示方法
    [self showAnimation];
    //几秒种后自动消失
    [self performSelector:@selector(hideAnimation) withObject:nil afterDelay:_duration];
    
}
//改变toast的透明度
-(void)showAnimation{
    
    [UIView animateWithDuration:0.3 animations:^{
        
        self->_contentView.alpha = 1.0f;
        
    }];
}
//先改变控件的透明度再移除控件
-(void)hideAnimation{
    WeakSelf(self);
    [UIView animateWithDuration:_duration animations:^{
        
        weakSelf.contentView.alpha = 0.0f;
        
    } completion:^(BOOL finished) {
        
        [weakSelf.contentView removeFromSuperview];
        
    }];
}
//底部展示toast
-(void)showBottom{
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    _contentView.center = CGPointMake(window.center.x, [UIScreen mainScreen].bounds.size.height - 100);
    
    [window addSubview:_contentView];
    
    [self showAnimation];
    
    [self performSelector:@selector(hideAnimation) withObject:nil afterDelay:_duration];
}
#pragma mark ------- 公共方法
//直接在屏幕中间显示toast，默认3秒
+(void)showWithText:(NSString *)text{
    
    [self showWithText:text duration:3.0f];
}
//可以控制显示时间
+(void)showWithText:(NSString *)text duration:(CGFloat)duration{
    
    LLToast *toast = [[LLToast alloc]initWithText:text];
    
    [toast setDuration:duration];
    
    [toast show];
}
//在底部显示toast，不可控时间，默认两秒
+(void)showBottomWithText:(NSString *)text{
    
    LLToast *toast = [[LLToast alloc]initWithText:text];
    
    [toast setDuration:2.0f];
    
    [toast showBottom];
}
@end
