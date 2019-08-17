//
//  LQCalenderCollectionViewCell.m
//  LQCustomClass
//
//  Created by liang lee on 2019/8/17.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import "LQCalenderCollectionViewCell.h"

@interface LQCalenderCollectionViewCell ()
@property (nonatomic, strong)UILabel *dateLabel;
@end

@implementation LQCalenderCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self configurationUI];
    }
    return self;
}
-(void)configurationUI{
    UILabel *dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(5*WidthRatio, (self.height - self.width + 10*WidthRatio)/2, self.width - 10*WidthRatio, self.width - 10*WidthRatio)];
    dateLabel.textAlignment = NSTextAlignmentCenter;
    dateLabel.textColor = ColorWithRGB(64, 64, 64);
    dateLabel.font = FontThin(15.0f*WidthRatio);
    dateLabel.layer.masksToBounds = YES;
    dateLabel.layer.cornerRadius =(self.width - 10*WidthRatio)/2;
    [self addSubview:dateLabel];
    self.dateLabel = dateLabel;
}
-(void)setModel:(LQCalenderDayModel *)model{
    self.dateLabel.text = [NSString stringWithFormat:@"%ld",model.day];
    
    
    if (model.isSelected) {
        self.dateLabel.backgroundColor = model.selectBackColor?model.selectBackColor:[UIColor greenColor];
        self.dateLabel.textColor = [UIColor whiteColor];
        if (model.isHaveAnimation) {
            [self addAnimaiton];
        }
        
    }else{
        self.dateLabel.backgroundColor = [UIColor whiteColor];
        if (model.isLastMonth) {
            self.dateLabel.textColor = model.lastMonthTitleColor;
        }
        if (model.isNextMonth) {
            self.dateLabel.textColor = model.nextMonthTitleColor;
        }
        if (model.isCurrentMonth) {
            self.dateLabel.textColor = model.currentMonthTitleColor;
        }
        if (model.isToday) {
            self.dateLabel.textColor = model.todayTitleColor;
        }
    }
}
-(void)addAnimaiton{
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    
    
    anim.values = @[@0.6,@1.2,@1.0];
    //    anim.fromValue = @0.6;
    anim.keyPath = @"transform.scale";  // transform.scale 表示长和宽都缩放
    anim.calculationMode = kCAAnimationPaced;
    anim.duration = 0.25;                // 设置动画执行时间
    //    anim.repeatCount = MAXFLOAT;        // MAXFLOAT 表示动画执行次数为无限次
    
    //    anim.autoreverses = YES;            // 控制动画反转 默认情况下动画从尺寸1到0的过程中是有动画的，但是从0到1的过程中是没有动画的，设置autoreverses属性可以让尺寸0到1也是有过程的
    
    [self.dateLabel.layer addAnimation:anim forKey:nil];
}
@end

