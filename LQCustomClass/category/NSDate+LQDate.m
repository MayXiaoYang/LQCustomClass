//
//  NSDate+LQDate.m
//  UIViewCategory
//
//  Created by LYKJ on 17/6/12.
//  Copyright © 2017年 LYKJ. All rights reserved.
//

#import "NSDate+LQDate.h"
#import "NSDateFormatter+LQFormatter.h"
@implementation NSDate (LQDate)

//输入时间距离当前的时间的间隔
+(NSString *)timeIntervalDescriptionWithDate:(NSDate *)date{
    NSTimeInterval timeInterval = -[date timeIntervalSinceNow];
    NSLog(@"self ==== %lf",timeInterval);
    if (timeInterval < 60) {
        return @"一分钟内";//一分钟之内
    }else if (timeInterval >= 60 && timeInterval < 3600){
        return [NSString stringWithFormat:@"%.f分钟前",timeInterval/60];//一小时之内
    }else if (timeInterval >=3600 && timeInterval < 86400){
        return [NSString stringWithFormat:@"%.f小时前",timeInterval/3600];//一天之内
    }else if (timeInterval >= 86400 && timeInterval < 2592000){
        return [NSString stringWithFormat:@"%.f天前",timeInterval/86400];//一个月之内
    }else if (timeInterval >= 2592000 && timeInterval < 31536000){
        NSDateFormatter *dateFormatter = [NSDateFormatter dateFormatterWithFormatter:@"MM-dd"];//一年之内
        return [dateFormatter stringFromDate:date];
    }else{
         return [NSString stringWithFormat:@"%.f年前", timeInterval / 31536000];//其他的一律几年之内（float）类型
    }
}
//输出格式 星期 上（下）午 mm:ss
- (NSString *)minuteDescription
{
    NSDateFormatter *dateFormatter = [NSDateFormatter dateFormatterWithFormatter:@"yyyy-MM-dd"];
    NSString *theDay = [dateFormatter stringFromDate:self];//日期的年月日
    NSString *currentDay = [dateFormatter stringFromDate:[NSDate date]];//当前年月日
    if ([theDay isEqualToString:currentDay]) {//当天
        [dateFormatter setDateFormat:@"ah:mm"];
        return [dateFormatter stringFromDate:self];
    } else if ([[dateFormatter dateFromString:currentDay] timeIntervalSinceDate:[dateFormatter dateFromString:theDay]] == 86400) {//昨天
        [dateFormatter setDateFormat:@"ah:mm"];
        return [NSString stringWithFormat:@"昨天 %@", [dateFormatter stringFromDate:self]];
    } else if ([[dateFormatter dateFromString:currentDay] timeIntervalSinceDate:[dateFormatter dateFromString:theDay]] < 86400 * 7) {//间隔一周内
        [dateFormatter setDateFormat:@"EEEE ah:mm"];
        return [dateFormatter stringFromDate:self];
    } else {//以前
        [dateFormatter setDateFormat:@"yyyy-MM-dd ah:mm"];
        return [dateFormatter stringFromDate:self];
    }
}

-(NSString *)formattedDateDescription{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *theDay = [dateFormatter stringFromDate:self];//日期的年月日
    NSString *currentDay = [dateFormatter stringFromDate:[NSDate date]];//当前年月日
    
    NSInteger timeInterval = -[self timeIntervalSinceNow];
    if (timeInterval < 60) {
        return @"1分钟内";
    } else if (timeInterval < 3600) {//1小时内
        return [NSString stringWithFormat:@"%ld分钟前", timeInterval / 60];
    } else if (timeInterval < 21600) {//6小时内
        return [NSString stringWithFormat:@"%ld小时前", timeInterval / 3600];
    } else if ([theDay isEqualToString:currentDay]) {//当天
        [dateFormatter setDateFormat:@"HH:mm"];
        return [NSString stringWithFormat:@"今天 %@", [dateFormatter stringFromDate:self]];
    } else if ([[dateFormatter dateFromString:currentDay] timeIntervalSinceDate:[dateFormatter dateFromString:theDay]] == 86400) {//昨天
        [dateFormatter setDateFormat:@"HH:mm"];
        return [NSString stringWithFormat:@"昨天 %@", [dateFormatter stringFromDate:self]];
    } else {//以前
        [dateFormatter setDateFormat:@"MM-dd HH:mm"];
        return [dateFormatter stringFromDate:self];
    }
}
@end
