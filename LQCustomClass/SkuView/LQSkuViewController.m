//
//  LQSkuViewController.m
//  LQCustomClass
//
//  Created by liang lee on 2019/5/20.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import "LQSkuViewController.h"
#import "LQSkuView.h"
#import "UIButton+Location.h"
#import "LQStandardModel.h"
@interface LQSkuViewController ()
@property (nonatomic, strong)LQSkuView *skuView;
@property (nonatomic, strong)NSMutableArray *array_dataSource;
@property (nonatomic, strong)UILabel *lab_standard;
@end

@implementation LQSkuViewController
-(NSMutableArray *)array_dataSource{
    if (!_array_dataSource) {
        _array_dataSource = [[NSMutableArray alloc]initWithCapacity:0];
    }
    return _array_dataSource;
}
-(LQSkuView *)skuView{
    if (!_skuView) {
        _skuView = [[LQSkuView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT) withDataSource:self.array_dataSource];
        WeakSelf(self);
        _skuView.btnClick = ^{
            [UIView animateWithDuration:0.5 animations:^{
                weakSelf.skuView.y = SCREEN_HEIGHT;
            }];
        };
        _skuView.proStandard = ^(NSString *proStandardStr, NSString *proStandardIdStr,BOOL isReady) {
            if (isReady) {
                NSLog(@"proStandardStr------>>>%@ \n proStandardIdStr------->>>%@",proStandardStr,proStandardIdStr);
                weakSelf.skuView.lab_standard.text = proStandardStr;
                weakSelf.lab_standard.text = proStandardStr;
            }else{
                weakSelf.skuView.lab_standard.text = @"请选择规格";
            }
        };
        [_skuView getProStndardMsg];
        [_skuView addToWindow];
    }
    return _skuView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"proJson" ofType:@"txt"];
    NSString *proJson = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSDictionary *responseObject = [self dictionaryWithJsonString:proJson];
    if ([responseObject[@"code"] integerValue] == 200) {
        NSDictionary *data = responseObject[@"data"];
        NSArray *jsonGroupArray = data[@"jsonGroupArray"];
        [jsonGroupArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            LQStandardModel *model = [LQStandardModel modelWithDictionary:obj];
            model.proIdx = idx;
            NSLog(@"model.proIdx----->>>%ld",model.proIdx);
            [self.array_dataSource addObject:model];
        }];
        
    }
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100*WidthRatio, 48*WidthRatio);
    btn.center = self.view.center;
    [btn setImage:[UIImage imageNamed:@"add3"] forState:UIControlStateNormal];
    [btn setTitle:@"add" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor redColor];
    [btn setBtnTextLeftAndImageRightWithSpace:10*WidthRatio];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UILabel *lab_standard = [[UILabel alloc]initWithFrame:CGRectMake(15*WidthRatio, CGRectGetMaxY(btn.frame)+40*WidthRatio, SCREEN_WIDTH-30*WidthRatio, 20*WidthRatio)];
    lab_standard.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:lab_standard];
    self.lab_standard = lab_standard;
}
-(void)btnClick:(UIButton *)sender{
    [UIView animateWithDuration:0.5 animations:^{
        self.skuView.y = 0;
    }];
}
- (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err)
    {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}
@end
