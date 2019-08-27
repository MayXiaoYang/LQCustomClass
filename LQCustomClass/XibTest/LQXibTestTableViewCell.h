//
//  LQXibTestTableViewCell.h
//  LQCustomClass
//
//  Created by liang lee on 2019/8/20.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LQXibTestModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface LQXibTestTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *lefImageView;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;

@property (nonatomic, strong)LQXibTestModel *model;

@end

NS_ASSUME_NONNULL_END
