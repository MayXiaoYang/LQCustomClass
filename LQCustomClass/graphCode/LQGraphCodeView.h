//
//  LQGraphCodeView.h
//  LQCustomClass
//
//  Created by liang lee on 2019/3/24.
//  Copyright © 2019年 li xiao yang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    GraphCodeNumWithSpace,
    GraphCodeNumBetween,
} GraphCodeNumType;

typedef void(^graphCodeStringBlock)(void);
@interface LQGraphCodeView : UIView

@property (nonatomic, assign)NSInteger itemTextFont;

@property (nonatomic, strong)UIColor *itemTextColor;

@property (nonatomic, assign)GraphCodeNumType graphCodeType;

@property (nonatomic, assign)NSInteger itemCount;

@property (nonatomic, copy)graphCodeStringBlock graphCode;

@property (nonatomic, copy)NSString *graphCodeString;

-(instancetype)initWithFrame:(CGRect)frame withItemNum:(NSInteger)itemNum withGraphCodeType:(GraphCodeNumType)graphCodeType;

@end

NS_ASSUME_NONNULL_END
