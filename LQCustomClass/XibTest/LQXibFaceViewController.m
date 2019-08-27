//
//  LQXibFaceViewController.m
//  LQCustomClass
//
//  Created by liang lee on 2019/8/20.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import "LQXibFaceViewController.h"
#import "MJRefreshCustomFooter.h"
#import "LQCustomRefreshFooter.h"
#import "LQXibTestTableViewCell.h"
#import "LQXibTestModel.h"
#import <MJExtension.h>
@interface LQXibFaceViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *xibTableView;
@property (nonatomic, strong)NSMutableArray *dataArray;

@end

@implementation LQXibFaceViewController

-(void)initWithData{
    
    NSArray *array = @[@{@"userName" : @"李雷",
                           @"insertTime" : @"2019-08-01",
                         @"title" : @"中国欢迎你"},
                       @{@"userName" : @"韩梅梅",
                         @"insertTime" : @"2019-08-02",
                         @"title" : @"中国欢迎你中国欢迎你"},
                       @{@"userName" : @"莉莉",
                         @"insertTime" : @"2019-08-03",
                         @"title" : @"中国欢迎你中国欢迎你中国欢迎你中国欢迎你"},
                       @{@"userName" : @"露西",
                         @"insertTime" : @"2019-08-04",
                         @"title" : @"中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你"},
                       @{@"userName" : @"汤姆",
                         @"insertTime" : @"2019-08-05",
                         @"title" : @"中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你"},
                       @{@"userName" : @"黄飞鸿",
                         @"insertTime" : @"2019-08-06",
                         @"title" : @"中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你"},
                       @{@"userName" : @"李连杰",
                         @"insertTime" : @"2019-08-07",
                         @"title" : @"中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你"},
                       @{@"userName" : @"李雷",
                         @"insertTime" : @"2019-08-01",
                         @"title" : @"中国欢迎你"},
                       @{@"userName" : @"韩梅梅",
                         @"insertTime" : @"2019-08-02",
                         @"title" : @"中国欢迎你中国欢迎你"},
                       @{@"userName" : @"莉莉",
                         @"insertTime" : @"2019-08-03",
                         @"title" : @"中国欢迎你中国欢迎你中国欢迎你中国欢迎你"},
                       @{@"userName" : @"露西",
                         @"insertTime" : @"2019-08-04",
                         @"title" : @"中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你"},
                       @{@"userName" : @"汤姆",
                         @"insertTime" : @"2019-08-05",
                         @"title" : @"中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你"},
                       @{@"userName" : @"黄飞鸿",
                         @"insertTime" : @"2019-08-06",
                         @"title" : @"中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你"},
                       @{@"userName" : @"李连杰",
                         @"insertTime" : @"2019-08-07",
                         @"title" : @"中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你中国欢迎你"},
                       ];
    
    self.dataArray = [LQXibTestModel mj_objectArrayWithKeyValuesArray:array];
    
    [self.xibTableView reloadData];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    self.xibTableView.rowHeight = 60*WidthRatio;
    [self.view addSubview:self.xibTableView];
    self.xibTableView.tableFooterView = [UIView new];
    self.xibTableView.estimatedRowHeight = 100;
    
    [self initWithData];
//    WeakSelf(self);
//    self.xibTableView.mj_footer = [LQCustomRefreshFooter footerWithRefreshingBlock:^{
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [weakSelf.xibTableView.mj_footer endRefreshing];
//        });
//    }];
//    [_xibTableView.mj_footer beginRefreshing];
    
    [self.xibTableView registerNib:[UINib nibWithNibName:@"LQXibTestTableViewCell" bundle:nil] forCellReuseIdentifier:@"cellID"];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    static NSString *cellID = @"cellID";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
//    if (!cell) {
//        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
//    }
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行",indexPath.row];
//    return cell;
    static NSString *cellID = @"cellID";
    LQXibTestTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
//    if (indexPath.row%2==0) {
//        cell.label3.hidden = YES;
//    }else{
//        cell.label3.hidden = NO;
//    }
    cell.model = self.dataArray[indexPath.row];
    return cell;
}



@end
