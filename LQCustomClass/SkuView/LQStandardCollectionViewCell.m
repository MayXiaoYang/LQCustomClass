//
//  LQStandardCollectionViewCell.m
//  LQCustomClass
//
//  Created by liang lee on 2019/5/20.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import "LQStandardCollectionViewCell.h"
#import "LQCustomControl.h"
@implementation LQStandardCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self configurationUI];
    }
    return self;
}

-(void)configurationUI{
    
    UILabel *lab_standard = [LQCustomControl createLabelWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) text:@"规格" bgColor:[UIColor lightGrayColor] textColor:[UIColor blackColor] font:FontThin(15.0*WidthRatio) textAlignment:NSTextAlignmentCenter];
    lab_standard.layer.masksToBounds = YES;
    lab_standard.layer.cornerRadius = 3*WidthRatio;
    [self addSubview:lab_standard];
    self.lab_standard = lab_standard;
    
}

-(void)setModel:(LQStandardSonModel *)model{
    _model = model;
    self.lab_standard.frame = CGRectMake(0, 0, model.itemWidth, 30*WidthRatio);
}
@end
