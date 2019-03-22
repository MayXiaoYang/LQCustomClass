//
//  LoadErrorView.h
//  EarnEveryDay
//
//  Created by LYKJ on 16/12/19.
//  Copyright © 2016年 LYKJ. All rights reserved.
//

/**
 * 空白页
 */

// 白色
#define WHITECOLOR RGB(255, 255, 255)
// 灰色
#define GRAYCOLOR RGB(208, 208, 208)
// 红色
#define REDCOLOR RGB(255, 62, 94)

// 颜色
#define RGB(r, g, b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0]

// 字体
#define FONT_SYSTEM(fontSize) [UIFont systemFontOfSize:fontSize] // 常规
#define FONT_BOLD(fontSize) [UIFont boldSystemFontOfSize:fontSize] // 加粗

// 纵向比例
#define VRATIO SCREEN_HEIGHT/667.0f

// 横向比例
#define RATIO SCREEN_WIDTH/375.0f

// 屏幕宽
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width

// 屏幕高
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, ErrorStatus) {
    ErrorStatusEmptyData = 0,    // 没有数据
    ErrorStatusNoReachable = 1 ,    // 没网络
    ErrorStatusLoadError = 2,   // 加载超时
     ErrorStatusCommentDel,     // 评论已被删除
};

@interface LoadErrorView : UIView

@property (nonatomic, assign) ErrorStatus   errorStatus;// 状态
@property (nonatomic, strong) UIImageView   *img;       // 图片
@property (nonatomic, strong) UILabel       *text;      // 文字
@property (nonatomic, strong) UILabel       *detailText;// 文字
@property (nonatomic, strong) UIButton      *goBtn;     // 跳转按钮

- (void)reloadUI;



@end
