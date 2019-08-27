//
//  LQAddressView.m
//  LQCustomClass
//
//  Created by liang lee on 2019/8/19.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import "LQAddressView.h"
#import <MJExtension.h>
#import "LQProvinceModel.h"
#import <Masonry.h>
#import "LQAddressScrollView.h"
#import "UIView+LQFrame.h"
@interface LQAddressView ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>

@property (nonatomic, strong)NSMutableArray *dataArray;
@property (nonatomic, strong)UITableView *provinceTableView;
@property (nonatomic, strong)UITableView *cityTableView;
@property (nonatomic, strong)UITableView *areaTableView;
@property (nonatomic, strong)NSIndexPath *provinceIndexPath;
@property (nonatomic, strong)NSIndexPath *cityIndexPath;
@property (nonatomic, strong)LQAddressScrollView *tableViewScrollView;
@property (nonatomic, strong)UIButton *provinceBtn;
@property (nonatomic, strong)UIButton *cityBtn;
@property (nonatomic, strong)UIButton *areaBtn;
@property (nonatomic, assign)BOOL isScrLeft;
@property (nonatomic, strong)UIView *bottomViewLine;
@property (nonatomic, assign)CGFloat lastContentOffset;

@end

@implementation LQAddressView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self requestJsonData];
        [self createTableView];
    }
    return self;
}
-(void)createTableView{
    
    UIView *backgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.width, self.frame.size.height)];
    [self addSubview:backgroundView];
    
    UIView *headView = [self createTableHeadView];
    headView.backgroundColor = [UIColor orangeColor];
    [backgroundView addSubview:headView];
    
    LQAddressScrollView *scrollow = [[LQAddressScrollView alloc]initWithFrame:CGRectMake(0, 40*WidthRatio, self.width, self.frame.size.height-40*WidthRatio)];
    scrollow.pagingEnabled = YES;
    scrollow.showsHorizontalScrollIndicator = NO;
    scrollow.showsVerticalScrollIndicator = NO;
    scrollow.delegate = self;
    scrollow.bounces = NO;
    [backgroundView addSubview:scrollow];
    self.tableViewScrollView = scrollow;
    
    
    for (int i = 0; i<3; i++) {
        
        UIView *tablebackgroundView = [[UIView alloc]initWithFrame:CGRectMake(self.width*(i%3), 0, scrollow.width, scrollow.height)];
        [scrollow addSubview:tablebackgroundView];
        
        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, scrollow.width, scrollow.height)];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.showsVerticalScrollIndicator = NO;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        if (i == 0) {
            self.provinceTableView = tableView;
        }else if (i == 1){
            self.cityTableView = tableView;
        }else{
            self.areaTableView = tableView;
        }
        [tablebackgroundView addSubview:tableView];
    }
}
-(void)requestJsonData{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"city" ofType:@"json"];
    NSError *error;
    NSString *fileString = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
    if (error) {
        return;
    }
    NSDictionary *dicData = [self dictionaryWithJsonString:fileString];
    if (!dicData) {
        return;
    }
    NSArray *citylist = [dicData objectForKey:@"citylist"];
    self.dataArray = [LQProvinceModel mj_objectArrayWithKeyValuesArray:citylist];
//    for (int i = 0; i<self.dataArray.count; i++) {
//        LQProvinceModel *model = self.dataArray[i];
//
//        NSLog(@"model.p--->>>%@,%@,%@",model.p,model.c[0].n,model.c.firstObject.a.firstObject.s);
//    }
    

}
- (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    
    NSData  * jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError * error;
    NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                         options:NSJSONReadingMutableContainers
                                                           error:&error];
    if(error) {
        return nil;
    }
    return dic;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.provinceTableView) {
        return self.dataArray.count;
    }else if (tableView == self.cityTableView){
        LQProvinceModel *model = self.dataArray[self.provinceIndexPath.row];
        if (model.c[self.cityIndexPath.row].a.count == 0) {
            return 1;
        }
        return model.c.count;
    }else if (tableView == self.areaTableView){
        LQProvinceModel *model = self.dataArray[self.provinceIndexPath.row];
        if (model.c[self.cityIndexPath.row].a.count == 0) {
            return model.c.count;
        }
        return model.c[self.cityIndexPath.row].a.count;
    }
    return 0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (tableView == self.provinceTableView) {
        LQProvinceModel *model = self.dataArray[indexPath.row];
        cell.textLabel.text = model.p;
    }else if (tableView == self.cityTableView){
        LQProvinceModel *model = self.dataArray[self.provinceIndexPath.row];
        if (model.c[indexPath.row].a.count == 0) {
            cell.textLabel.text = model.p;
        }else{
            cell.textLabel.text = model.c[indexPath.row].n;
        }
    }else if (tableView == self.areaTableView){
        LQProvinceModel *model = self.dataArray[self.provinceIndexPath.row];
        if (model.c[self.cityIndexPath.row].a.count == 0) {
            cell.textLabel.text = model.c[self.cityIndexPath.row].n;
        }else{
            cell.textLabel.text = model.c[self.cityIndexPath.row].a[indexPath.row].s;
        }
        
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.provinceTableView) {
        self.provinceIndexPath = indexPath;
        LQProvinceModel *model = self.dataArray[indexPath.row];
        [self.provinceBtn setTitle:model.p forState:UIControlStateNormal];
        NSInteger priceBtnWidth = ceilToTextWidth(model.p, 20*WidthRatio, 14.0f*WidthRatio) + 10*WidthRatio;
        self.provinceBtn.width = ceil(priceBtnWidth);
        self.cityBtn.x = CGRectGetMaxX(self.provinceBtn.frame)+15*WidthRatio;
        [self didTapCellToReloadHeadViewWithIndexPath:self.provinceTableView];
        [self.tableViewScrollView setContentOffset:CGPointMake(self.width, 0) animated:YES];
        [self.cityTableView reloadData];
    }else if (tableView == self.cityTableView){
        self.cityIndexPath = indexPath;
        LQProvinceModel *model = self.dataArray[self.provinceIndexPath.row];
        if (model.c[self.cityIndexPath.row].a.count == 0) {
            [self.cityBtn setTitle:model.p forState:UIControlStateNormal];
            NSInteger cityBtnWidth = ceilToTextWidth(model.p, 20*WidthRatio, 14.0f*WidthRatio) + 10*WidthRatio;
            self.cityBtn.width = ceil(cityBtnWidth);
            self.areaBtn.x = CGRectGetMaxX(self.cityBtn.frame)+15*WidthRatio;
            [self didTapCellToReloadHeadViewWithIndexPath:self.cityTableView];
            [self.tableViewScrollView setContentOffset:CGPointMake(self.width*2, 0) animated:YES];
            [self.areaTableView reloadData];
        }else{
            [self.cityBtn setTitle:model.c[indexPath.row].n forState:UIControlStateNormal];
            NSInteger cityBtnWidth = ceilToTextWidth(model.c[indexPath.row].n, 20*WidthRatio, 14.0f*WidthRatio) + 10*WidthRatio;
            self.cityBtn.width = ceil(cityBtnWidth);
            self.areaBtn.x = CGRectGetMaxX(self.cityBtn.frame)+15*WidthRatio;
            [self didTapCellToReloadHeadViewWithIndexPath:self.cityTableView];
            [self.tableViewScrollView setContentOffset:CGPointMake(self.width*2, 0) animated:YES];
            [self.areaTableView reloadData];
        }
    }else if (tableView == self.areaTableView){
        LQProvinceModel *model = self.dataArray[self.provinceIndexPath.row];
        if (model.c[self.cityIndexPath.row].a.count == 0) {
            [self.areaBtn setTitle:model.c[indexPath.row].n forState:UIControlStateNormal];
            NSInteger areaBtnWidth = ceilToTextWidth(model.c[indexPath.row].n, 20*WidthRatio, 14.0f*WidthRatio) + 10*WidthRatio;
            self.areaBtn.width = ceil(areaBtnWidth);
            self.areaBtn.x = CGRectGetMaxX(self.cityBtn.frame)+15*WidthRatio;
            self.bottomViewLine.width = self.areaBtn.width;
        }else{
            [self.areaBtn setTitle:model.c[self.cityIndexPath.row].a[indexPath.row].s forState:UIControlStateNormal];
            NSInteger areaBtnWidth = ceilToTextWidth(model.c[self.cityIndexPath.row].a[indexPath.row].s, 20*WidthRatio, 14.0f*WidthRatio) + 10*WidthRatio;
            self.areaBtn.width = ceil(areaBtnWidth);
            self.areaBtn.x = CGRectGetMaxX(self.cityBtn.frame)+15*WidthRatio;
            self.bottomViewLine.width = self.areaBtn.width;
        }
        if (self.resultBlcok) {
            self.resultBlcok(self.provinceBtn.titleLabel.text, self.cityBtn.titleLabel.text, self.areaBtn.titleLabel.text);
        }
    }
    
}

-(UIView *)createTableHeadView{
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.width, 40*WidthRatio)];
    
    NSInteger provinceBtnWidth = ceilToTextWidth(@"请选择", 20*WidthRatio, 14.0f*WidthRatio) + 10*WidthRatio;
    UIButton *provinceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    provinceBtn.frame = CGRectMake(20, 10*WidthRatio, ceil(provinceBtnWidth), 20*WidthRatio);
    provinceBtn.titleLabel.font = FontThin(14.0f*WidthRatio);
    [provinceBtn setTitle:@"请选择" forState:UIControlStateNormal];
    provinceBtn.tag = 7;
    [provinceBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [headView addSubview:provinceBtn];
    self.provinceBtn = provinceBtn;
    
    UIView *bottomLine = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(provinceBtn.frame)+ 2*WidthRatio, provinceBtn.width - 10*WidthRatio, 2*WidthRatio)];
    bottomLine.backgroundColor = [UIColor redColor];
    bottomLine.centerX = provinceBtn.centerX;
    [headView addSubview:bottomLine];
    self.bottomViewLine = bottomLine;
    
    UIButton *cityBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cityBtn.frame = CGRectMake(CGRectGetMaxX(provinceBtn.frame)+10*WidthRatio, 10*WidthRatio, ceil(provinceBtnWidth), 20*WidthRatio);
    cityBtn.titleLabel.font = FontThin(14.0f*WidthRatio);
    [cityBtn setTitle:@"请选择" forState:UIControlStateNormal];
    cityBtn.tag = 8;
    cityBtn.hidden = YES;
    [cityBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [headView addSubview:cityBtn];
    self.cityBtn = cityBtn;
    
    UIButton *areaBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    areaBtn.frame = CGRectMake(CGRectGetMaxX(provinceBtn.frame)+10*WidthRatio, 10*WidthRatio, ceil(provinceBtnWidth), 20*WidthRatio);
    areaBtn.titleLabel.font = FontThin(14.0f*WidthRatio);
    [areaBtn setTitle:@"请选择" forState:UIControlStateNormal];
    areaBtn.hidden = YES;
    areaBtn.tag = 9;
    [areaBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [headView addSubview:areaBtn];
    self.areaBtn = areaBtn;
    
    return headView;
}
-(void)didTapCellToReloadHeadViewWithIndexPath:(UITableView *)tableView{
    
    if ([tableView isEqual:self.provinceTableView]) {
        NSInteger cityBtnWidth = ceilToTextWidth(@"请选择", 20*WidthRatio, 14.0f*WidthRatio) + 10*WidthRatio;
        [self.cityBtn setTitle:@"请选择" forState:UIControlStateNormal];
        self.cityBtn.width = ceil(cityBtnWidth);
        self.cityBtn.hidden = NO;
        self.areaBtn.hidden = YES;
    }else if ([tableView isEqual:self.cityTableView]){
        NSInteger areaBtnWidth = ceilToTextWidth(@"请选择", 20*WidthRatio, 14.0f*WidthRatio) + 10*WidthRatio;
        [self.areaBtn setTitle:@"请选择" forState:UIControlStateNormal];
        self.areaBtn.width = ceil(areaBtnWidth);
        self.areaBtn.hidden = NO;
    }
    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    _lastContentOffset = scrollView.contentOffset.x;
//    if (scrollView.contentOffset.x < _lastContentOffset ){
//        //向右
//        _isScrLeft = YES;
//    } else if (scrollView. contentOffset.x > _lastContentOffset ){
//        //向左
//        _isScrLeft = NO;
//    }
    
    if (scrollView == self.tableViewScrollView) {
        if (self.cityBtn.hidden && self.areaBtn.hidden) {
            self.tableViewScrollView.contentSize = CGSizeMake(self.width, self.frame.size.height-40*WidthRatio);
        }else if (!self.cityBtn.hidden && self.areaBtn.hidden){
            self.tableViewScrollView.contentSize = CGSizeMake(self.width*2, self.frame.size.height-40*WidthRatio);
        }else{
            self.tableViewScrollView.contentSize = CGSizeMake(self.width*3, self.frame.size.height-40*WidthRatio);
        }
        NSInteger pageIndex = scrollView.contentOffset.x/self.width;
        if (pageIndex == 0) {
            [UIView animateWithDuration:0.2 animations:^{
                self.bottomViewLine.width = self.provinceBtn.width;
                self.bottomViewLine.centerX = self.provinceBtn.centerX;
            }];
        }else if (pageIndex == 1){
            [UIView animateWithDuration:0.2 animations:^{
                self.bottomViewLine.width = self.cityBtn.width;
                self.bottomViewLine.centerX = self.cityBtn.centerX;
            }];
        }else if (pageIndex == 2){
            if (self.cityBtn.hidden) {
                self.tableViewScrollView.scrollEnabled = NO;
                return;
            }else{
                self.tableViewScrollView.scrollEnabled = YES;;
            }
            [UIView animateWithDuration:0.2 animations:^{
                self.bottomViewLine.width = self.areaBtn.width;
                self.bottomViewLine.centerX = self.areaBtn.centerX;
            }];
        }
    }
    
}
-(void)btnClick:(UIButton *)sender{
    if (sender.tag == 7) {
        [self.tableViewScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    }else if (sender.tag == 8){
        [self.tableViewScrollView setContentOffset:CGPointMake(self.width, 0) animated:YES];
    }else{
        [self.tableViewScrollView setContentOffset:CGPointMake(self.width*2, 0) animated:YES];
    }
}
@end


