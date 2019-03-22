//
//  LoadErrorView.m
//  EarnEveryDay
//
//  Created by LYKJ on 16/12/19.
//  Copyright © 2016年 LYKJ. All rights reserved.
//



#import "LoadErrorView.h"
#import <Masonry.h>
#import "UIButton+ClipLayer.h"

@implementation LoadErrorView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = WHITECOLOR;
        
        [self initEmptyUI];
    }
    return self;
}

- (void)initEmptyUI{
    
    // 按钮
    _goBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _goBtn.titleLabel.font      = FONT_BOLD(14);
    _goBtn.layer.masksToBounds  = YES;
    [_goBtn clipLayerRadius:39/2 andBackgroundColor:nil andTitle:nil];
    _goBtn.layer.borderWidth = 1;
    _goBtn.layer.borderColor = RGB(255, 62, 94).CGColor;
    [_goBtn setTitleColor:RGB(255, 62, 94) forState:(UIControlStateNormal)];
    [self addSubview:_goBtn];

    [_goBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self.mas_left).offset(42*RATIO);
        make.right.equalTo(self.mas_right).offset(-42*RATIO);
        make.height.equalTo(@39);
        make.bottom.equalTo(self.mas_bottom).offset(-65*VRATIO);
        
    }];
    
    
    // 图片
    _img = [[UIImageView alloc] init];
    _img.contentMode = UIViewContentModeCenter;
    [self addSubview:_img];
   
    
    // 文字
    _text = [[UILabel alloc] init];
    _text.font = FONT_SYSTEM(15);
    _text.textColor = RGB(100, 100, 100);
    [self addSubview:_text];

    [_text mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerX.equalTo(self.mas_centerX);
        make.height.equalTo(@15);
        make.top.equalTo(_img.mas_bottom).offset(20);
        
    }];
    
    // 第二行文字
    _detailText = [[UILabel alloc] init];
    _detailText.font = FONT_SYSTEM(15);
    _detailText.textColor = RGB(100, 100, 100);
    [self addSubview:_detailText];
   
    [_detailText mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self.mas_centerX);
        make.height.equalTo(@15);
        make.top.equalTo(_text.mas_bottom).offset(10);
        
    }];
  
    
    
}

- (void)reloadUI{
    switch (_errorStatus) {
            case 0:
        {// 没有数据
                [_img mas_makeConstraints:^(MASConstraintMaker *make) {
            
                      make.top.equalTo(self.mas_top).offset(20);
                      make.width.equalTo(self.mas_width);
                      make.left.equalTo(self.mas_left);
                      make.height.equalTo(@(244*VRATIO));
                
                  }];
            _img.image          = [UIImage imageNamed:@"no_num"];
            _text.text          = @"";
            _detailText.text    = @"";
            _goBtn.hidden       = YES;
        }
            break;
  
        case 1:
        {// 没网络
                [_img mas_makeConstraints:^(MASConstraintMaker *make) {
            
                      make.top.equalTo(self.mas_top).offset(20);
                      make.width.equalTo(self.mas_width);
                      make.left.equalTo(self.mas_left);
                      make.height.equalTo(@(244*VRATIO));
                
                  }];
            _img.image          = [UIImage imageNamed:@"no_inter"];
            _text.text          = @"网络正在开小差";
            _detailText.text    = @"请查看网络设置或稍后再试";
            [_goBtn setTitle:@"重新尝试" forState:UIControlStateNormal];
            
        }
            break;
        case 2:
        {// 加载超时
                [_img mas_makeConstraints:^(MASConstraintMaker *make) {
            
                      make.top.equalTo(self.mas_top).offset(20);
                      make.width.equalTo(self.mas_width);
                      make.left.equalTo(self.mas_left);
                      make.height.equalTo(@(244*VRATIO));
                
                  }];
            _img.image          = [UIImage imageNamed:@"404"];
            _text.text          = @"暂时不知道跑到哪里去了";
            [_goBtn setTitle:@"重新加载" forState:UIControlStateNormal];
        }
            break;
            
        case 3:
        {// 评论被删除
            
        [_img mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.mas_top).offset(40);
            make.width.equalTo(self.mas_width);
            make.left.equalTo(self.mas_left);
            make.height.equalTo(@(244*VRATIO));
        }];
            
            _img.image          = [UIImage imageNamed:@"delet"];
            _text.text          = @"该评论已被删除";
            [_goBtn setTitle:@"重新加载" forState:UIControlStateNormal];
           _goBtn.hidden       = YES;
        }
            break;
            
        default:
            break;
    }
}


@end
