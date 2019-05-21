//
//  LQSkuView.h
//  LQCustomClass
//
//  Created by liang lee on 2019/5/20.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^btnClickBlock)(void);
typedef void(^proStandardblock)(NSString *proStandardStr,NSString *proStandardIdStr,BOOL isReady);
@interface LQSkuView : UIView

@property (nonatomic, copy)btnClickBlock btnClick;

@property (nonatomic, copy)proStandardblock proStandard;

-(instancetype)initWithFrame:(CGRect)frame withDataSource:(NSMutableArray *)array_dataSource;

-(void)getProStndardMsg;

@property (nonatomic, strong)UIImageView *proImg;
@property (nonatomic, strong)UILabel *lab_stock;
@property (nonatomic, strong)UILabel *lab_standard;
@property (nonatomic, strong)UILabel *lab_price;
@property (nonatomic, strong)UITextField *tf_proNum;

@end

