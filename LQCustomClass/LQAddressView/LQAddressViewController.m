//
//  LQAddressViewController.m
//  LQCustomClass
//
//  Created by liang lee on 2019/8/19.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import "LQAddressViewController.h"
#import "LQAddressView.h"
@interface LQAddressViewController ()
@property (nonatomic, strong)LQAddressView *addressView;
@property (nonatomic, strong)UILabel *chooseLabel;
@property (nonatomic, strong)UIView *addressbackground;
@property (nonatomic, strong)UIButton *btn_choose;
@end

@implementation LQAddressViewController
-(UIView *)addressbackground{
    if (!_addressbackground) {
        _addressbackground = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _addressbackground.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.3];
        _addressbackground.alpha = 0;
        [_addressbackground addToWindow];
    }
    return _addressbackground;
}
-(LQAddressView *)addressView{
    if (!_addressView) {
        _addressView = [[LQAddressView alloc]initWithFrame:CGRectMake(10*WidthRatio, SCREEN_HEIGHT, SCREEN_WIDTH - 20*WidthRatio, SCREEN_HEIGHT - navgationBarH - 100*WidthRatio - safeSeraH)];
        [self.addressbackground addSubview:_addressView];
    }
    return _addressView;
}
-(UILabel *)chooseLabel{
    if (!_chooseLabel) {
        _chooseLabel = [[UILabel alloc]initWithFrame:CGRectMake(15*WidthRatio, CGRectGetMaxY(self.addressView.frame)+30*WidthRatio, SCREEN_WIDTH - 30*WidthRatio, 20*WidthRatio)];
        _chooseLabel.text = @"请选择省市区/县";
        _chooseLabel.textAlignment = NSTextAlignmentCenter;
        _chooseLabel.textColor = [UIColor whiteColor];
        [self.view addSubview:_chooseLabel];
    }
    return _chooseLabel;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
//    self.addressView.backgroundColor = [UIColor orangeColor];
//    self.chooseLabel.backgroundColor = [UIColor orangeColor];
    
    
    UIButton *btn_choose = [UIButton buttonWithType:UIButtonTypeCustom];
    btn_choose.frame = CGRectMake(15*WidthRatio, 0, SCREEN_WIDTH - 30*WidthRatio, 40*WidthRatio);
    btn_choose.center = self.view.center;
    btn_choose.backgroundColor = [UIColor orangeColor];
    [btn_choose setTitle:@"请选择省市区/县" forState:UIControlStateNormal];
    [btn_choose addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn_choose];
    self.btn_choose = btn_choose;
    
    WeakSelf(self);
    self.addressView.resultBlcok = ^(NSString *province, NSString *city, NSString *area) {
        [weakSelf addressPullDown];
        [weakSelf.btn_choose setTitle:[NSString stringWithFormat:@"%@ %@ %@",province,city,area] forState:UIControlStateNormal];
    };
}

-(void)btnClick:(UIButton *)sender{
    [UIView animateWithDuration:0.2 animations:^{
        self.addressbackground.alpha = 1;
        self.addressView.y = navgationBarH + 100*WidthRatio;
    }];
}
-(void)addressPullDown{
    [UIView animateWithDuration:0.2 animations:^{
        self.addressbackground.alpha = 0;
        self.addressView.y = SCREEN_HEIGHT;
    }];
}


@end
