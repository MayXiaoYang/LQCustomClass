//
//  LQCalenderHeadView.m
//  LQCustomClass
//
//  Created by liang lee on 2019/8/17.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import "LQCalenderHeadView.h"

@interface LQCalenderHeadView ()

@property (nonatomic, strong)UIButton *leftBtn;
@property (nonatomic, strong)UILabel *dateLabel;
@property (nonatomic, strong)UIButton *rightBtn;

@end

@implementation LQCalenderHeadView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self configurationUI];
    }
    return self;
}
-(void)configurationUI{
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(15*WidthRatio, 5*WidthRatio, 40*WidthRatio, 40*WidthRatio);
    leftBtn.backgroundColor = [UIColor orangeColor];
    [leftBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    leftBtn.tag = 9;
    [leftBtn setTitle:@"<" forState:UIControlStateNormal];
    [self addSubview:leftBtn];
    self.leftBtn = leftBtn;
    
    UILabel *dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(leftBtn.frame), 5*WidthRatio, self.frame.size.width - 110*WidthRatio, 40*WidthRatio)];
    dateLabel.textAlignment = NSTextAlignmentCenter;
    dateLabel.textColor = ColorWithRGB(64, 64, 64);
    dateLabel.font = FontThin(15.0f*WidthRatio);
    [self addSubview:dateLabel];
    self.dateLabel = dateLabel;
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(self.frame.size.width - 55*WidthRatio, 5*WidthRatio, 40*WidthRatio, 40*WidthRatio);
    [rightBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    rightBtn.tag = 10;
    rightBtn.backgroundColor = [UIColor orangeColor];
    [rightBtn setTitle:@">" forState:UIControlStateNormal];
    [self addSubview:rightBtn];
    self.rightBtn = rightBtn;
}
-(void)setDateStr:(NSString *)dateStr{
    _dateStr = dateStr;
    self.dateLabel.text = dateStr;
}
-(void)setIsShowLeftAndRightBtn:(BOOL)isShowLeftAndRightBtn{
    _isShowLeftAndRightBtn = isShowLeftAndRightBtn;
    self.leftBtn.hidden = self.rightBtn.hidden = !isShowLeftAndRightBtn;
}
-(void)hideLeftBtnAndRightBtn{
    self.leftBtn.hidden = self.rightBtn.hidden = YES;
}
-(void)btnClick:(UIButton *)sender{
    if (sender.tag == 9) {
        if (self.leftClickBlock) {
            self.leftClickBlock();
        }
    }else{
        if (self.rightClickBlock) {
            self.rightClickBlock();
        }
    }
}
@end
