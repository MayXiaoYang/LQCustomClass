//
//  LQCalenderView.h
//  LQCustomClass
//
//  Created by liang lee on 2019/8/17.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^SelectBlock) (NSInteger year ,NSInteger month ,NSInteger day);
@interface LQCalenderView : UIView
/*
 * 当前月的title颜色
 */
@property(nonatomic,strong)UIColor *currentMonthTitleColor;
/*
 * 上月的title颜色
 */
@property(nonatomic,strong)UIColor *lastMonthTitleColor;
/*
 * 下月的title颜色
 */
@property(nonatomic,strong)UIColor *nextMonthTitleColor;

/*
 * 选中的背景颜色
 */
@property(nonatomic,strong)UIColor *selectBackColor;

/*
 * 今日的title颜色
 */
@property(nonatomic,strong)UIColor *todayTitleColor;

/*
 * 选中的是否动画效果
 */
@property(nonatomic,assign)BOOL     isHaveAnimation;



/*
 * 是否禁止手势滚动
 */
@property(nonatomic,assign)BOOL     isCanScroll;

/*
 * 是否显示上月，下月的按钮
 */
@property(nonatomic,assign)BOOL     isShowLastAndNextBtn;

/*
 * 是否显示上月，下月的的数据
 */
@property(nonatomic,assign)BOOL     isShowLastAndNextDate;

/*
 * 在配置好上面的属性之后执行
 */
-(void)dealData;

//选中的回调
@property(nonatomic,copy)SelectBlock selectBlock;
@end

NS_ASSUME_NONNULL_END
