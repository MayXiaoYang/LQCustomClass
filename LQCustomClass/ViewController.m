//
//  ViewController.m
//  LQCustomClass
//
//  Created by liang lee on 2019/3/22.
//  Copyright © 2019年 li xiao yang. All rights reserved.
//

#import "ViewController.h"
#import "LQGraphCodeViewController.h"
#import "LQTextAndImgViewController.h"
#import "LQSkuViewController.h"
#import "LQYYTextTestViewController.h"
#import "LQCalendarViewController.h"
#import "LQAddressViewController.h"
#import "LQXibFaceViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>


@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSArray *array_titles;

@end

@implementation ViewController
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.frame];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
  
    self.array_titles = @[@"本地验证码",@"按钮（文字+图片）",@"商品规格Sku",@"YYText",@"日历",@"地址选址",@"Xib测试"];
    
    [self.view addSubview:self.tableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.array_titles.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = self.array_titles[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        LQGraphCodeViewController *graphCodeVC = [[LQGraphCodeViewController alloc]init];
        [self.navigationController pushViewController:graphCodeVC animated:YES];
    }else if (indexPath.row == 1){
        LQTextAndImgViewController *textAndImgVC = [[LQTextAndImgViewController alloc]init];
        [self.navigationController pushViewController:textAndImgVC animated:YES];
    }else if (indexPath.row == 2){
        LQSkuViewController *skuVC = [[LQSkuViewController alloc]init];
        [self.navigationController pushViewController:skuVC animated:YES];
    }else if (indexPath.row == 3){
        LQYYTextTestViewController *YYTextVC = [[LQYYTextTestViewController alloc]init];
        [self.navigationController pushViewController:YYTextVC animated:YES];
    }else if (indexPath.row == 4){
        LQCalendarViewController *calendarVC = [[LQCalendarViewController alloc]init];
        [self.navigationController pushViewController:calendarVC animated:YES];
    }else if (indexPath.row == 5){
        LQAddressViewController *addressVC = [[LQAddressViewController alloc]init];
        [self.navigationController pushViewController:addressVC animated:YES];
    }else if (indexPath.row == 6){
        LQXibFaceViewController *xibVC = [[LQXibFaceViewController alloc]initWithNibName:@"LQXibFaceViewController" bundle:nil];
        [self.navigationController pushViewController:xibVC animated:YES];
    }
}

@end
