//
//  LQBaseViewController.h
//  LQCustomClass
//
//  Created by liang lee on 2019/3/22.
//  Copyright © 2019年 li xiao yang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^navigationBtnBlock)(UIButton *navBtn);
typedef void(^tableViewRefreshBlock)(NSInteger pageNum);
@interface LQBaseViewController : UIViewController
/** navigationBar item click */
@property (nonatomic, copy)navigationBtnBlock navBtnAction;
/** tableView pull or push action */
@property (nonatomic, copy)tableViewRefreshBlock tableViewRefresh;
/** tableView */
@property (nonatomic, strong)UITableView *tableView;
/** tableView current page */
@property (nonatomic, assign)NSInteger pageNum;

/** set custom navigation leftItem */
-(void)createBackBtnWithImageName:(NSString *)imageName;

/** set navigationbar backgroundColor */
-(void)setNavigationBarBackgroundImageWithColor:(UIColor *)color;

/** set custom navigation rightItem */
-(void)createNavRightBtnWithImageName:(NSString *)imageName;

/** show custom aleartView */
-(void)showMessageBottomWithText:(NSString *)text;

/** add tableview pull and push action */
-(void)addTableHeaderRefresh:(BOOL)headerRefresh tableFooterRefresh:(BOOL)footerRefresh;

/** show custom hud */
-(void)showCustomMessageViewWithText:(NSString *)text;
/** hide custom hud */
-(void)hiddenCustomMessageView;

/** show custom activeIndicator*/
-(void)showCustomActiveIndicator;
/**hide custom activeIndicator*/
-(void)hiddenCustomActiveIndicator;
@end

NS_ASSUME_NONNULL_END
