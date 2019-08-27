//
//  LQProvinceModel.h
//  LQCustomClass
//
//  Created by liang lee on 2019/8/19.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LQCityModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface LQProvinceModel : NSObject

@property (nonatomic, strong)NSMutableArray <LQCityModel*>*c;//区数组
@property (nonatomic, copy)NSString *p;//城市名

@end

NS_ASSUME_NONNULL_END
