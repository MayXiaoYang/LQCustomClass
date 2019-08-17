//
//  LQCalenderWeekView.m
//  LQCustomClass
//
//  Created by liang lee on 2019/8/17.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import "LQCalenderWeekView.h"

@implementation LQCalenderWeekView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self configurationUI];
    }
    return self;
}
-(void)configurationUI{
    NSArray *weeks = @[@"周日",@"周一",@"周二",@"周三",@"周四",@"周五",@"周六"];
    CGFloat weekWidth = self.width/weeks.count;
    for (int i = 0; i<weeks.count; i++) {
        UILabel *week = [[UILabel alloc]initWithFrame:CGRectMake(weekWidth*(i%weeks.count), 0, weekWidth, self.frame.size.height)];
        week.textAlignment = NSTextAlignmentCenter;
        week.font = FontThin(14.0f*WidthRatio);
        week.textColor = [UIColor redColor];
        week.text = weeks[i];
        [self addSubview:week];
    }
}

@end
