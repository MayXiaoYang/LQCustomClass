//
//  LQAddressScrollView.m
//  LQCustomClass
//
//  Created by liang lee on 2019/8/19.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import "LQAddressScrollView.h"

@interface LQAddressScrollView ()<UIGestureRecognizerDelegate>

@end

@implementation LQAddressScrollView

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return NO;
}

@end
