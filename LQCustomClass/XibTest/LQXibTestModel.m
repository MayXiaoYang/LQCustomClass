//
//  LQXibTestModel.m
//  LQCustomClass
//
//  Created by liang lee on 2019/8/20.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import "LQXibTestModel.h"

@implementation LQXibTestModel

-(void)calCellHeight{
    CGRect bounds = ceilToTextHeight(self.title, SCREEN_WIDTH - 30, 16);
    NSInteger height = ceil(bounds.size.height)+1;
    
    self.totalHeight = 80 + height;
}

@end
