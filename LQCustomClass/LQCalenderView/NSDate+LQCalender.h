//
//  NSDate+LQCalender.h
//  LQCustomClass
//
//  Created by liang lee on 2019/8/17.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSDate (LQCalender)

/** 获取当前天数 */
-(NSInteger)getCurrentDay;

/** 获取当前月份 */
-(NSInteger)getCurrentMonth;

/** 获取当前年份 */
-(NSInteger)getCurrentYear;

/** 获取月份的天数 */
-(NSInteger)getTotalDaysInMonth;

/** 获取月份第一天所属的星期 */
-(NSInteger)firstWeekDayInMonth;

/** 获取上个月的某一天 */
-(NSDate *)getLastMonthSomeDay;

/** 获取下个月的某一天 */
-(NSDate *)getNextMonthSomeDay;
@end

