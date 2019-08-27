//
//  LQAddressView.h
//  LQCustomClass
//
//  Created by liang lee on 2019/8/19.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^resultBlock)(NSString *province,NSString *city,NSString *area);

@interface LQAddressView : UIView

@property (nonatomic, copy)resultBlock resultBlcok;

@end

