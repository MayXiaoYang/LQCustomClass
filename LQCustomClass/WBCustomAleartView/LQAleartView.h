//
//  LQAleartView.h
//  cocopodsTest
//
//  Created by 杨举 on 2018/1/30.
//  Copyright © 2018年 杨举. All rights reserved.
//


///alertView  宽
#define AlertW (0.75 * [UIScreen mainScreen].bounds.size.width)
///各个栏目之间的距离
#define LQSpace 10.0


#import <UIKit/UIKit.h>
typedef void(^AlertResult)(NSInteger index);
@interface LQAleartView : UIView

/** 弹窗*/
@property (nonatomic,retain) UIView *alertView;
/** title*/
@property (nonatomic,retain) UILabel *titleLbl;
/** 内容*/
@property (nonatomic,retain) UILabel *msgLbl;
/** 确认按钮*/
@property (nonatomic,retain) UIButton *sureBtn;
/** 取消按钮*/
@property (nonatomic,retain) UIButton *cancleBtn;
/** 横线线*/
@property (nonatomic,retain) UIView *lineView;
/** 竖线*/
@property (nonatomic,retain) UIView *verLineView;

/** buttonIndex*/
@property (nonatomic,copy) AlertResult resultIndex;

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message sureBtn:(NSString *)sureTitle cancleBtn:(NSString *)cancleTitle;

- (void)showLQAlertView;

@end
