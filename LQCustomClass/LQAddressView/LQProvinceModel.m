//
//  LQProvinceModel.m
//  LQCustomClass
//
//  Created by liang lee on 2019/8/19.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import "LQProvinceModel.h"
#import <MJExtension.h>
@implementation LQProvinceModel

+ (NSDictionary *)mj_objectClassInArray{
    return @{@"c":[LQCityModel class]};
}


@end

