//
//  UIView+LQFrame.h
//  UIViewCategory
//
//  Created by LYKJ on 17/6/12.
//  Copyright © 2017年 LYKJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LQFrame)

@property (nonatomic, assign)CGFloat x;
@property (nonatomic, assign)CGFloat y;
@property (nonatomic, assign)CGFloat width;
@property (nonatomic, assign)CGFloat height;

////摇动动画
-(void)startShakeAnimation;

////停止摇动动画
-(void)stopShakeAnimation;

////360度旋转动画
-(void)startRotateAnimation;

////停止360度旋转动画
-(void)stopRotateAnimation;

////放大的弹簧动画
-(void)startSpringingAnimation;

////停止放大的弹簧动画
-(void)stopSpringingAnimation;

////围绕Z轴旋转180度
-(void)startTrans180DegreeAnimation;

////屏幕截图
-(UIImage *)screenShot;

//把view加在window上
- (void)addToWindow;

@end
