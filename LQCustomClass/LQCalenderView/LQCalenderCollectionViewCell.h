//
//  LQCalenderCollectionViewCell.h
//  LQCustomClass
//
//  Created by liang lee on 2019/8/17.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "LQCalenderMonthModel.h"
#import "LQCalenderDayModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface LQCalenderCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong)LQCalenderDayModel *model;

@end

NS_ASSUME_NONNULL_END
