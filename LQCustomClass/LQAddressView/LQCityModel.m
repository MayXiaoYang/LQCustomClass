//
//  LQCityModel.m
//  LQCustomClass
//
//  Created by liang lee on 2019/8/19.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import "LQCityModel.h"
#import <MJExtension.h>
@implementation LQCityModel

+ (NSDictionary *)mj_objectClassInArray{
    return @{@"a":[LQAreaModel class]};
}

@end
