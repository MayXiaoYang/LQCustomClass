//
//  NSDate+LQDate.h
//  UIViewCategory
//
//  Created by LYKJ on 17/6/12.
//  Copyright © 2017年 LYKJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (LQDate)
////距离当前的时间间隔
+(NSString *)timeIntervalDescriptionWithDate:(NSDate *)date;

////精确到分钟的日期
-(NSString *)minuteDescription;

////格式化日期
-(NSString *)formattedDateDescription;

@end
