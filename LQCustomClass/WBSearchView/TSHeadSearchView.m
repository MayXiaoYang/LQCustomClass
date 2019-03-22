//
//  TSHeadSearchView.m
//  TraceSource
//
//  Created by liang lee on 2018/8/21.
//  Copyright © 2018年 li xiao yang. All rights reserved.
//

#import "TSHeadSearchView.h"
#import "LQCustomControl.h"
@interface TSHeadSearchView ()

@property (nonatomic, strong)UILabel *lbl_search;

@property (nonatomic, strong)UIImageView *img_search;

@end

@implementation TSHeadSearchView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        [self createSearchViewWithFrame:frame];
        
    }
    
    return self;
    
}

-(void)createSearchViewWithFrame:(CGRect)frame{
    
    UIButton *btn_search = [LQCustomControl createBtnWithFrame:CGRectMake(0, 0, frame.size.width, 30) text:nil bgColor:[UIColor whiteColor] textColor:[UIColor clearColor] font:FontThin(12.0f) image:nil target:self action:@selector(btnSearchClick:)];
    btn_search.layer.masksToBounds = YES;
    btn_search.layer.cornerRadius = 15;
    [self addSubview:btn_search];
    
    UIImageView *img_search = [LQCustomControl createImageViewWithFrame:CGRectMake(15*WidthRatio, 6, 18, 18) image:[UIImage imageNamed:@""]];
    [btn_search addSubview:img_search];
    self.img_search = img_search;
    
    UILabel *lbl_search = [LQCustomControl createLabelWithFrame:CGRectMake(CGRectGetMaxX(img_search.frame) + 10*WidthRatio, 6, btn_search.width - 20*WidthRatio - 18, 18) text:@"" bgColor:[UIColor clearColor] textColor:[UIColor whiteColor] font:FontThin(14.0f) textAlignment:NSTextAlignmentLeft];
    [btn_search addSubview:lbl_search];
    self.lbl_search = lbl_search;
    
}

-(void)btnSearchClick:(UIButton *)sender{
    
    if (self.searchClick) {
        self.searchClick();
    }
    
}

-(void)setSearchPlaceholder:(NSString *)searchPlaceholder{
    self.lbl_search.text = searchPlaceholder;
}

-(void)setSearchImageName:(NSString *)searchImageName{
    self.img_search.image = [UIImage imageNamed:searchImageName];
}
-(void)setPlaceHolderTextFont:(CGFloat)placeHolderTextFont{
    self.lbl_search.font = FontThin(placeHolderTextFont);
}
-(void)setPlaceHolderTextColor:(UIColor *)placeHolderTextColor{
    self.lbl_search.textColor = placeHolderTextColor;
}
@end
