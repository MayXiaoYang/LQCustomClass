//
//  LQXibTestTableViewCell.m
//  LQCustomClass
//
//  Created by liang lee on 2019/8/20.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import "LQXibTestTableViewCell.h"

@implementation LQXibTestTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.lefImageView.layer.masksToBounds = YES;
    self.lefImageView.layer.cornerRadius = 20;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModel:(LQXibTestModel *)model{
    _model = model;
    self.label1.text = model.userName;
    self.label2.text = model.insertTime;
    self.label3.text = model.title;
}

@end
