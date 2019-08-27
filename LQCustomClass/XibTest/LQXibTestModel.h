//
//  LQXibTestModel.h
//  LQCustomClass
//
//  Created by liang lee on 2019/8/20.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LQXibTestModel : NSObject

@property (nonatomic, copy)NSString *userName;
@property (nonatomic, copy)NSString *insertTime;
@property (nonatomic, copy)NSString *title;

@property (nonatomic, assign)NSInteger totalHeight;

-(void)calCellHeight;

@end

NS_ASSUME_NONNULL_END
