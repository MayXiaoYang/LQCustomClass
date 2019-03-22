//
//  UIView+LQFrame.m
//  UIViewCategory
//
//  Created by LYKJ on 17/6/12.
//  Copyright © 2017年 LYKJ. All rights reserved.
//

#import "UIView+LQFrame.h"
@implementation UIView (LQFrame)
//摇动动画
-(void)startShakeAnimation{
    CGFloat rotation = 0.05;
    CABasicAnimation *shake = [CABasicAnimation animationWithKeyPath:@"transform"];
    shake.duration = 0.2;
    shake.autoreverses = YES;
    shake.repeatCount = MAXFLOAT;
    shake.removedOnCompletion = NO;
    shake.fromValue = [NSValue valueWithCATransform3D:CATransform3DRotate(self.layer.transform, -rotation, 0.0, 0.0, 1.0)];
    shake.toValue   = [NSValue valueWithCATransform3D:CATransform3DRotate(self.layer.transform,  rotation, 0.0, 0.0, 1.0)];
    [self.layer addAnimation:shake forKey:@"shakeAnimation"];
}
//停止动画
-(void)stopShakeAnimation{
    [self.layer removeAnimationForKey:@"shakeAnimation"];
}
//开始旋转360度动画
-(void)startRotateAnimation{
    CABasicAnimation *shake = [CABasicAnimation animationWithKeyPath:@"transform"];
    shake.duration = 0.5;
    shake.autoreverses = NO;
    shake.repeatCount = MAXFLOAT;
    shake.removedOnCompletion = NO;
    shake.fromValue = [NSValue valueWithCATransform3D:CATransform3DRotate(self.layer.transform, M_PI, 0.0, 0.0, 1.0)];
    shake.toValue   = [NSValue valueWithCATransform3D:CATransform3DRotate(self.layer.transform,  0.0, 0.0, 0.0, 1.0)];
    [self.layer addAnimation:shake forKey:@"rotateAnimation"];
}
//停止旋转动画
-(void)stopRotateAnimation{
    [self.layer removeAnimationForKey:@"rotateAnimation"];
}
//弹簧动画
- (void)startSpringingAnimation{
    CAKeyframeAnimation *praiseAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    praiseAnimation.repeatCount = MAXFLOAT;
    praiseAnimation.duration = 0.4;
    praiseAnimation.values = @[@(0.1),@(1.0),@(1.2)];
    praiseAnimation.keyTimes = @[@(0.0),@(0.5),@(0.8),@(1.0)];
    praiseAnimation.calculationMode = kCAAnimationLinear;
    [self.layer addAnimation:praiseAnimation forKey:@"springAnimation"];}
//停止弹簧动画
-(void)stopSpringingAnimation{
    [self.layer removeAnimationForKey:@"springAnimation"];
}
//180度旋转
-(void)startTrans180DegreeAnimation{
    CABasicAnimation *animation = [CABasicAnimation
                                       animationWithKeyPath: @"transform" ];
    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    //围绕Z轴旋转，垂直与屏幕
    animation.toValue = [NSValue valueWithCATransform3D:
                      CATransform3DMakeRotation(M_PI, 0.0, 1.0, 0.0) ];
    animation.duration = 0.5;
    [self.layer addAnimation:animation forKey:nil];
}
//屏幕截图
-(UIImage *)screenShot{
    //开启上下文  设置截屏大小
    UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, 2.0f);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    //获取图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    //关闭上下文
    UIGraphicsEndImageContext();
    return image;
}

//加载view到window
- (void)addToWindow{
    id appDelegate = [[UIApplication sharedApplication] delegate];
    if ([appDelegate respondsToSelector:@selector(window)]) {
        UIWindow *window = (UIWindow *)[appDelegate performSelector:@selector(window)];
        [window addSubview:self];
    }
}

//重写x的setter方法 设置控件x的值
-(void)setX:(CGFloat)x{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}
//重写x的getter方法 返回控件x的值
-(CGFloat)x{
    return self.frame.origin.x;
}
//重写y的setter方法 设置控件y的值
-(void)setY:(CGFloat)y{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
//重写y的getter方法 返回控件y的值
-(CGFloat)y{
    return self.frame.origin.y;
}

//重写width的setter方法 设置控件的width值
-(void)setWidth:(CGFloat)width{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
//重写width的getter方法 设置控件的width值
-(CGFloat)width{
    return self.frame.size.width;
}
//重写height的setter方法 设置控件的height值
-(void)setHeight:(CGFloat)height{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
//重写height的getter方法 设置控件的height值
-(CGFloat)height{
    return self.frame.size.height;
}

@end