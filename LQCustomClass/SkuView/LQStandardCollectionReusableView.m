//
//  LQStandardCollectionReusableView.m
//  LQCustomClass
//
//  Created by liang lee on 2019/5/20.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import "LQStandardCollectionReusableView.h"

@implementation LQStandardCollectionReusableView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self configurationUI];
    }
    return self;
}
-(void)configurationUI{
    UILabel *lab_standard = [LQCustomControl createLabelWithFrame:CGRectMake(15*WidthRatio, 10*WidthRatio, SCREEN_WIDTH - 30*WidthRatio, 14*WidthRatio) text:@"" bgColor:[UIColor whiteColor] textColor:[UIColor blackColor] font:FontThin(15.0f*WidthRatio) textAlignment:NSTextAlignmentLeft];
    [self addSubview:lab_standard];
    self.lab_standard = lab_standard;
}

@end
