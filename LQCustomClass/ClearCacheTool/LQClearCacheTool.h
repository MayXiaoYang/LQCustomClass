//
//  LQClearCache.h
//  anomalyBtn
//
//  Created by LYKJ on 17/7/13.
//  Copyright © 2017年 LYKJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LQClearCacheTool : NSObject

/*
 *获取path路径下文件夹的大小
 *@param path 要获取的文件夹路径
 *@return 返回path 路径下的文件夹的大小
 */
+ (NSString *)getCacheSzieWithFilePath:(NSString *)path;

/*
 *清楚path路径下文件夹的缓存
 *@param path 要清除的文件夹的路径
 @return 是否清除成功
 */
+ (BOOL)clearCacheWithFilePath:(NSString *)path;
@end
