//
//  LQClearCache.m
//  anomalyBtn
//
//  Created by LYKJ on 17/7/13.
//  Copyright © 2017年 LYKJ. All rights reserved.
//

#import "LQClearCacheTool.h"

@implementation LQClearCacheTool

#pragma mark ------- 获取path路径下的文件夹大小
+ (NSString *)getCacheSzieWithFilePath:(NSString *)path{
    
    //[ NSSearchPathForDirectoriesInDomains ( NSCachesDirectory , NSUserDomainMask , YES ) firstObject ];
    //[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    //获取path文件夹下的所有文件
    NSArray *subPathArray = [[NSFileManager defaultManager]subpathsAtPath:path];
    
    NSString *filePath = nil;
    NSInteger totalSize = 0;
    for (NSString *subPath in subPathArray) {
        
        //1.拼接每一个文件的全路径
        filePath = [path stringByAppendingPathComponent:subPath];
        //2.是否是文件夹，默认不是
        BOOL isDirectory = NO;
        
        //3.判断文件夹是否存在
        BOOL isExist = [[NSFileManager defaultManager] fileExistsAtPath:filePath isDirectory:&isDirectory];
        
        //4.以上判断目的是忽略不需要计算的文件
        if (!isExist || isDirectory || [filePath containsString:@".DS"]) {
            //过滤：1.文件夹不存在 2.过滤文件夹 3.隐藏文件
            continue;
        }
        
        //5.指定路径，获取这个路径的属性
        /**
         attributesOfItemAtPath: 文件夹路径
         该方法只能获取文件的属性, 无法获取文件夹属性, 所以也是需要遍历文件夹的每一个文件的原因
         */
        NSDictionary *dict = [[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:nil];
        
        //6.获取每一个文件的大小
        NSInteger size = [dict[@"NSFileSize"] integerValue];
        
        //7.计算总大小
        totalSize += size;
    }
    
    //8.将文件夹大小转换为M/KB/B
    NSString *totalStr = nil;
    if (totalSize >1000 * 1000) {
        totalStr = [NSString stringWithFormat:@"%0.2fM",totalSize /1000.00f/1000.00f];
    }else if (totalSize > 1000){
        totalStr = [NSString stringWithFormat:@"%0.2fKB",totalSize/1000.00f];
    }else{
        totalStr = [NSString stringWithFormat:@"%0.2fB",totalSize/1.00f];
    }
    
    return totalStr;
}
#pragma mark ------- 清除缓存
+ (BOOL)clearCacheWithFilePath:(NSString *)path{
    
    //拿到path路径的下一级目录的子文件夹
    NSArray *subPathArray = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:nil];
    
    NSString *filePath = nil;
    NSError *error = nil;
    
    for (NSString *subPath in subPathArray) {
        
        //拼接每一个文件的全路径
        filePath = [path stringByAppendingPathComponent:subPath];
        
        //移除子文件夹
        [[NSFileManager defaultManager]removeItemAtPath:filePath error:&error];
        if (error) {
            return NO;
        }
    }
    return YES;
}

@end
