//
//  LQBaseViewController.m
//  LQCustomClass
//
//  Created by liang lee on 2019/3/22.
//  Copyright © 2019年 li xiao yang. All rights reserved.
//

#import "LQBaseViewController.h"

@interface LQBaseViewController (){
    UIImageView *navBarHairlineImageView;
    UIActivityIndicatorView *_activityIndicator;
}


@end

@implementation LQBaseViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    navBarHairlineImageView.hidden = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //prevent view move down
    self.automaticallyAdjustsScrollViewInsets = NO;
    //set view backgroundColor
    self.view.backgroundColor = [UIColor whiteColor];
    //set nav backgroundColor
    [self setNavigationBarBackgroundImageWithColor:[UIColor whiteColor]];
    //wipe out the black line under the navigation bar
    UINavigationBar *navigationBar = self.navigationController.navigationBar;
    navBarHairlineImageView = [self  slnFindHairlineImageViewUnder:navigationBar];
}
#pragma mark ------- set nav left item
-(void)createBackBtnWithImageName:(NSString *)imageName{
    UIButton *btn_back = [UIButton buttonWithType:UIButtonTypeCustom];
    btn_back.frame = CGRectMake(0, 0, 40, 30);
    btn_back.contentEdgeInsets = UIEdgeInsetsMake(0, -2, 0, 0);
    btn_back.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [btn_back setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    btn_back.tag = 9;
    //保证所有touch事件button的highlighted属性为NO,即可去除高亮效果
    [btn_back addTarget:self action:@selector(preventFlicker:) forControlEvents:UIControlEventAllTouchEvents];
    [btn_back addTarget:self action:@selector(popToLastVC:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:btn_back];
    self.navigationItem.leftBarButtonItem = leftItem;
}
-(void)popToLastVC:(UIButton *)sender{
    NSArray *viewControllers = self.navigationController.viewControllers;
    if (viewControllers.count == 0) {
        return;
    }
    if (self.navBtnAction) {//如果vc中调用了block回调就走自己的回调
        self.navBtnAction(sender);
    }else{//如果vc中没有调用block回调，直接返回到到上级页面
        [self.navigationController popViewControllerAnimated:YES];
    }
}
#pragma mark ------- wipe out button highlight
-(void)preventFlicker:(UIButton *)sender{
    sender.highlighted = NO;
}

#pragma mark ------- set nav right item
-(void)createNavRightBtnWithImageName:(NSString *)imageName{
    UIButton *btn_right = [UIButton buttonWithType:UIButtonTypeCustom];
    btn_right.frame = CGRectMake(0, 0, 40, 30);
    btn_right.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 2);
    btn_right.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [btn_right setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    btn_right.tag = 10;
    //保证所有touch事件button的highlighted属性为NO,即可去除高亮效果
    [btn_right addTarget:self action:@selector(preventFlicker:) forControlEvents:UIControlEventAllTouchEvents];
    [btn_right addTarget:self action:@selector(rightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:btn_right];
    self.navigationItem.rightBarButtonItem = rightItem;
}
-(void)rightBtnClick:(UIButton *)sender{
    NSArray *viewControllers = self.navigationController.viewControllers;
    if (viewControllers.count == 0) {
        return;
    }
    if (self.navBtnAction) {//如果vc中调用了block回调就走自己的回调
        self.navBtnAction(sender);
    }else{//如果vc中没有调用block回调，直接返回到到上级页面
        [self.navigationController popViewControllerAnimated:YES];
    }
}
#pragma mark ------- create a image
-(UIImage *)createImageWithView:(UIView *)view{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, 0, [[UIScreen mainScreen] scale]);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return viewImage;
}
-(UIView *)getColorViewWithColor:(UIColor *)color{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, navgationBarH)];
    view.backgroundColor = color;
    if (CGColorEqualToColor(color.CGColor, [UIColor clearColor].CGColor) || CGColorEqualToColor(color.CGColor, APPColor.CGColor)) {
        
    }else{
        view.layer.borderColor = ColorWithRGB(239, 239, 239).CGColor;
        view.layer.borderWidth = 0.5;
        view.layer.shadowColor=[ColorWithRGB(200, 200, 200) colorWithAlphaComponent:0.8].CGColor;
        view.layer.shadowOffset=CGSizeMake(-4,-4);
        view.layer.shadowOpacity=0.5;
        view.layer.shadowRadius=4;
        view.clipsToBounds = false;
    }
    return view;
}
#pragma mark ------- get nav bottom black line
-(UIImageView *)slnFindHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0){
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self slnFindHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}

#pragma mark ------- set nav background color
-(void)setNavigationBarBackgroundImageWithColor:(UIColor *)color{
    [self.navigationController.navigationBar setBackgroundImage:[self createImageWithView:[self getColorViewWithColor:color]] forBarMetrics:UIBarMetricsDefault];
}

#pragma mark ------- show messgae on view of bottom
-(void)showMessageBottomWithText:(NSString *)text{
    [LLToast showBottomWithText:NSLocalizedString(text, nil)];
}

#pragma mark ------- tableView pull and push action
-(void)addTableHeaderRefresh:(BOOL)headerRefresh tableFooterRefresh:(BOOL)footerRefresh{
    if (headerRefresh) {
        MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(reloadData)];
        header.lastUpdatedTimeLabel.hidden = YES;
        [header setTitle:@"拼命加载中..." forState:MJRefreshStateRefreshing];
        [header setTitle:@"下拉刷新数据~" forState:MJRefreshStateIdle];
        self.tableView.mj_header = header;
    }
    
    if (footerRefresh) {
        MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
        [footer setTitle:@"我是有底线的~" forState:MJRefreshStateNoMoreData];
        [footer setTitle:@"拼命加载中..." forState:MJRefreshStateRefreshing];
        [footer setTitle:@"上拉更多精彩~" forState:MJRefreshStateIdle];
        footer.stateLabel.textColor = [UIColor lightGrayColor];
        self.tableView.mj_footer = footer;
    }
}

-(void)reloadData{
    _pageNum = 1;
    if (self.tableViewRefresh) {
        self.tableViewRefresh(_pageNum);
    }
}

-(void)loadMoreData{
    _pageNum ++;
    if (self.tableViewRefresh) {
        self.tableViewRefresh(_pageNum);
    }
}

-(void)tableViewEndRefresh{
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];
}

#pragma mark ------- custom hud
-(void)showCustomMessageViewWithText:(NSString *)text{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    //修改样式，否则等待框背景色将为半透明
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    //设置等待框背景色为黑色
    hud.bezelView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
    //设置菊花框为白色
    [UIActivityIndicatorView appearanceWhenContainedInInstancesOfClasses:@[[MBProgressHUD class]]].color = [UIColor whiteColor];
    hud.label.text = NSLocalizedString(text, nil);
    hud.label.textColor = [UIColor whiteColor];
    hud.userInteractionEnabled = YES;
    hud.mode = MBProgressHUDModeIndeterminate;
}
-(void)hiddenCustomMessageView{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

#pragma mark ------- custom activeIndicator
-(void)showCustomActiveIndicator{
    _activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [self.view addSubview:_activityIndicator];
    _activityIndicator.frame = CGRectMake((SCREEN_WIDTH - 99*WidthRatio)/2, (SCREEN_HEIGHT-99*WidthRatio)/2 - (navgationBarH + tabbarH)/2, 99*WidthRatio, 99*WidthRatio);
    _activityIndicator.hidesWhenStopped = NO;
    [_activityIndicator startAnimating];
}
-(void)hiddenCustomActiveIndicator{
    [_activityIndicator stopAnimating];
    [_activityIndicator removeFromSuperview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
//    [[SDImageCache sharedImageCache] clearMemory];//清内存
//    [[SDImageCache sharedImageCache] clearDiskOnCompletion:nil];//清内存
//    // 1.取消正在下载的操作
//    [[SDWebImageManager sharedManager] cancelAll];
//    // 2.清除内存缓存
//    [[SDWebImageManager sharedManager].imageCache clearMemory];
}

@end
