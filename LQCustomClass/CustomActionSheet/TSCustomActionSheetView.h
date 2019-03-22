//
//  TSCustomActionSheetView.h
//  TraceSource
//
//  Created by liang lee on 2018/8/22.
//  Copyright © 2018年 li xiao yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TSCustomActionSheetView : UIView

-(instancetype)initWithHeadView:(UIView *)HeadView
                 titleArray:(NSArray *)titles
                    cancleTitle:(NSString *)cancleTitle
                  selectedBlock:(void(^)(NSInteger))selectedBlock
                    cancelBlock:(void(^)(void))cancelBlock;


@end
