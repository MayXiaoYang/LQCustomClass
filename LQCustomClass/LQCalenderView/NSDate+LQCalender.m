//
//  NSDate+LQCalender.m
//  LQCustomClass
//
//  Created by liang lee on 2019/8/17.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import "NSDate+LQCalender.h"

@implementation NSDate (LQCalender)

-(NSInteger)getCurrentDay{
    NSCalendar *calender = [NSCalendar currentCalendar];
    NSDateComponents *components = [calender components:NSCalendarUnitDay fromDate:self];
    return components.day;
}

-(NSInteger)getCurrentMonth{
    NSCalendar *calender = [NSCalendar currentCalendar];
    NSDateComponents *components = [calender components:NSCalendarUnitMonth fromDate:self];
    return components.month;
}

-(NSInteger)getCurrentYear{
    NSCalendar *calender = [NSCalendar currentCalendar];
    NSDateComponents *components = [calender components:NSCalendarUnitYear fromDate:self];
    return components.year;
}

-(NSInteger)getTotalDaysInMonth{
    NSInteger totalDays = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:self].length;
    return totalDays;
}
-(NSInteger)firstWeekDayInMonth{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:self];
    components.day = 1; // 定位到当月第一天
    NSDate *firstDay = [calendar dateFromComponents:components];
    // 默认一周第一天序号为 1 ，而日历中约定为 0 ，故需要减一
    NSInteger firstWeekday = [calendar ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitWeekOfMonth forDate:firstDay] - 1;
    return firstWeekday;
}

-(NSDate *)getLastMonthSomeDay{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:self];
    components.day = 15; // 定位到当月中间日子
    if (components.month == 1) {
        components.month = 12;
        components.year -= 1;
    } else {
        components.month -= 1;
    }
    NSDate *lastMonthDayDate = [calendar dateFromComponents:components];
    return lastMonthDayDate;
}
-(NSDate *)getNextMonthSomeDay{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:self];
    components.day = 15; // 定位到当月中间日子
    if (components.month == 12) {
        components.month = 1;
        components.year += 1;
    } else {
        components.month += 1;
    }
    NSDate *nextMonthDayDate = [calendar dateFromComponents:components];
    return nextMonthDayDate;
}
@end
