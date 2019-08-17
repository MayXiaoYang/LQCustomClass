//
//  LQTestTableViewCell.m
//  LQCustomClass
//
//  Created by liang lee on 2019/8/1.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import "LQTestTableViewCell.h"
@interface LQTestTableViewCell ()
@property (weak, nonatomic) IBOutlet UIButton *testBtn;

@end
@implementation LQTestTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
