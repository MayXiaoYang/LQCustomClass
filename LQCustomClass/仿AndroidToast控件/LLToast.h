//
//  LLToast.h
//
//  Created by LYKJ on 17/5/16.
//  Copyright © 2017年 LYKJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LLToast : UIView

/** Toast显示(默认中间位置,时长3s) */
+ (void)showWithText:(NSString *)text;

/** Toast显示(默认中间,时长可调节) */
+ (void)showWithText:(NSString *)text duration:(CGFloat)duration;

/** Toast显示(显示底部,默认时长3s) */
+ (void)showBottomWithText:(NSString *)text;


@end
