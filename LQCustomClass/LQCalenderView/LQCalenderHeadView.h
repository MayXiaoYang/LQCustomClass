//
//  LQCalenderHeadView.h
//  LQCustomClass
//
//  Created by liang lee on 2019/8/17.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^leftClickBlock) (void);

typedef void (^rightClickBlock) (void);
@interface LQCalenderHeadView : UIView


@property(nonatomic,copy)leftClickBlock leftClickBlock;
@property(nonatomic,copy)rightClickBlock rightClickBlock;

@property(nonatomic,assign)BOOL isShowLeftAndRightBtn; //是否显示左右两侧按钮

@property (nonatomic, copy)NSString *dateStr;



@end

