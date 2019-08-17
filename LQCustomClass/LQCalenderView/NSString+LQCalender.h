//
//  NSString+LQCalender.h
//  LQCustomClass
//
//  Created by liang lee on 2019/8/17.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (LQCalender)

/** 时间转换为时间戳 */
+(NSString *)timeIntervalFromTimeStr:(NSString *)timeStr;

/** 时间戳转换为时间 */
+(NSString *)formateDate:(NSString *)string;

/** 获取当前的时间戳 */
+(NSInteger)getNowInterVal;

/** 获取当前的时间字符串 */
+(NSString *)getNowTime;

/** 时间戳转换为时间 */
+(NSString *)formateDateToDay:(NSString *)string;

/** 时间戳转换为时间 */
+(NSString *)formateDateOnlyYueri:(NSString *)string;

/** 时间戳转换为时间 */
+(NSString *)formateDateOnlyShifen:(NSString *)string;

/** 年月日转换为date */
+(NSDate *)dateFromTimeStr:(NSString *)timeStr;

/** 随机的32位字符串 */
+(NSString *)ret32bitString;

@end

NS_ASSUME_NONNULL_END
