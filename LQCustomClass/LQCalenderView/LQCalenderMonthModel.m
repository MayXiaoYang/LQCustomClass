//
//  LQCalenderMonthModel.m
//  LQCustomClass
//
//  Created by liang lee on 2019/8/17.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import "LQCalenderMonthModel.h"
#import "NSDate+LQCalender.h"
@implementation LQCalenderMonthModel

- (instancetype)initWithDate:(NSDate *)date {
    
    if (self = [super init]) {
        
        _monthDate = date;
        
        _totalDays = [self setupTotalDays];
        _firstWeekday = [self setupFirstWeekday];
        _year = [self setupYear];
        _month = [self setupMonth];
        
    }
    
    return self;
    
}


- (NSInteger)setupTotalDays {
    return [_monthDate getTotalDaysInMonth];
}

- (NSInteger)setupFirstWeekday {
    return [_monthDate firstWeekDayInMonth];
}

- (NSInteger)setupYear {
    return [_monthDate getCurrentYear];
}

- (NSInteger)setupMonth {
    return [_monthDate getCurrentMonth];
}


@end
