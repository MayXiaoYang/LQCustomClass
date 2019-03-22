//
//  NSDateFormatter+LQFormatter.h
//  UIViewCategory
//
//  Created by LYKJ on 17/6/12.
//  Copyright © 2017年 LYKJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (LQFormatter)

//设置时间格式化器时间格式
+(id)dateFormatterWithFormatter:(NSString *)dateFormat;

//默认为yyyy-MM-dd HH:mm:ss的时间格式化器
+(id)defaultDateFormatter;
@end
