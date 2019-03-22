//
//  NSDateFormatter+LQFormatter.m
//  UIViewCategory
//
//  Created by LYKJ on 17/6/12.
//  Copyright © 2017年 LYKJ. All rights reserved.
//

#import "NSDateFormatter+LQFormatter.h"

@implementation NSDateFormatter (LQFormatter)

//设置时间格式化器时间格式
+(id)dateFormatterWithFormatter:(NSString *)dateFormat{
    NSDateFormatter *dateFormatter = [[self alloc]init];
    dateFormatter.dateFormat = dateFormat;
    return dateFormatter;
}

//默认为yyyy-MM-dd HH:mm:ss的时间格式化器
+(id)defaultDateFormatter{
    return [self dateFormatterWithFormatter:@"yyyy-MM-dd HH:mm:ss"];
}
@end
