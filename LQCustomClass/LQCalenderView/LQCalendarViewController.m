//
//  LQCalendarViewController.m
//  LQCustomClass
//
//  Created by liang lee on 2019/8/17.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import "LQCalendarViewController.h"
#import "LQCalenderView.h"
#import "UIColor+Hex.h"
@interface LQCalendarViewController ()

@end

@implementation LQCalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    LQCalenderView *calendarView = [[LQCalenderView alloc]initWithFrame:CGRectMake(10*WidthRatio, navgationBarH + 80*WidthRatio, SCREEN_WIDTH - 20*WidthRatio, 50*WidthRatio *8)];
    
    calendarView.currentMonthTitleColor =[UIColor colorWithHexString:@"2c2c2c"];
    calendarView.lastMonthTitleColor =[UIColor colorWithHexString:@"8a8a8a"];
    calendarView.nextMonthTitleColor =[UIColor colorWithHexString:@"8a8a8a"];
    
    calendarView.isHaveAnimation = YES;
    
    
    
    calendarView.isCanScroll = YES;
    calendarView.isShowLastAndNextBtn = NO;
    
    calendarView.isShowLastAndNextDate = YES;
    
    calendarView.todayTitleColor =[UIColor redColor];
    
    calendarView.selectBackColor =[UIColor greenColor];
    
    
    
    [calendarView dealData];
    
    [self.view addSubview:calendarView];
}



@end
