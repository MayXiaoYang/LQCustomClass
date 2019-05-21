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
  
    self.array_titles = @[@"本地验证码",@"按钮（文字+图片）",@"商品规格Sku"];
    
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
    }
}

@end
