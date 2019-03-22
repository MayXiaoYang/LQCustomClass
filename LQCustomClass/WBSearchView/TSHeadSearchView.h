//
//  TSHeadSearchView.h
//  TraceSource
//
//  Created by liang lee on 2018/8/21.
//  Copyright © 2018年 li xiao yang. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^searchBlock)(void);
@interface TSHeadSearchView : UIView



/** 点击回调事件 */
@property (nonatomic, copy)searchBlock searchClick;

/** 设置placeholder */
@property (nonatomic, copy)NSString *searchPlaceholder;

/** 设置placeholder的文字颜色 */
@property (nonatomic, strong)UIColor *placeHolderTextColor;

/** 设置placeholder的文字大小 */
@property (nonatomic, assign)CGFloat placeHolderTextFont;

/** 设置搜索的图标 */
@property (nonatomic, copy)NSString *searchImageName;


@end
