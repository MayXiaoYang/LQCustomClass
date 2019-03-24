//
//  LQGraphCodeView.m
//  LQCustomClass
//
//  Created by liang lee on 2019/3/24.
//  Copyright © 2019年 li xiao yang. All rights reserved.
//

#import "LQGraphCodeView.h"

@interface LQGraphCodeView ()

@property (nonatomic, strong)NSMutableArray *array_items;
@property (nonatomic, strong)UILabel *lbl_item;

@end

@implementation LQGraphCodeView


-(NSMutableArray *)array_items{
    if (!_array_items) {
        _array_items = [[NSMutableArray alloc]initWithCapacity:0];
    }
    return _array_items;
}

-(instancetype)initWithFrame:(CGRect)frame withItemNum:(NSInteger)itemNum withGraphCodeType:(GraphCodeNumType)graphCodeType{
    
    if (self = [super initWithFrame:frame]) {
        _itemTextFont = 15*WidthRatio;
        _itemTextColor = [UIColor blackColor];
        _graphCodeType = graphCodeType;
        if (itemNum < 4) {
            itemNum = 4;
        }
        _itemCount = itemNum;
        [self configurationUI];
    }
    return self;
    
}

-(void)configurationUI{
    
    if (self.array_items) {
        [self.array_items removeAllObjects];
    }
    NSArray *randomArray = [self getGraphCodeDataSource];
    if (self.graphCodeType == GraphCodeNumWithSpace) {
        CGFloat width = self.frame.size.width/randomArray.count;
        for (int i = 0; i<randomArray.count; i++) {
            UILabel *labItem = [[UILabel alloc]initWithFrame:CGRectMake(width*(i%randomArray.count), 0, width, self.frame.size.height)];
            labItem.text = randomArray[i];
            labItem.textAlignment = NSTextAlignmentCenter;
            labItem.textColor = _itemTextColor;
            labItem.font = FontThin(_itemTextFont);
            labItem.tag = i+9;
            [self addSubview:labItem];
            [self.array_items addObject:labItem];
        }
    }else{
        UILabel *item = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        item.textAlignment = NSTextAlignmentCenter;
        item.textColor = _itemTextColor;
        item.font = FontThin(_itemTextFont);
        item.text = [randomArray componentsJoinedByString:@""];
        [self addSubview:item];
        self.lbl_item = item;
    }
    
    self.graphCodeString = [randomArray componentsJoinedByString:@""];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGesture:)];
    [self addGestureRecognizer:tap];
}
-(void)tapGesture:(UITapGestureRecognizer *)tap{
    NSArray *array = [self getGraphCodeDataSource];
    if (_graphCodeType == GraphCodeNumWithSpace) {
        for (UILabel *item in self.array_items) {
            item.text = array[item.tag - 9];
        }
    }else{
        self.lbl_item.text = [array componentsJoinedByString:@""];
    }
    self.graphCodeString = [array componentsJoinedByString:@""];
    if (self.graphCode) {
        self.graphCode();
    }
    self.backgroundColor = [self getRandomBgColorWithAlpha:0.5];
}
-(void)setItemTextFont:(NSInteger)itemTextFont{
    _itemTextFont = itemTextFont;
    if (_graphCodeType == GraphCodeNumWithSpace) {
        for (UILabel *item in self.array_items) {
            item.font = FontThin(itemTextFont);
        }
    }else{
        self.lbl_item.font = FontThin(itemTextFont);
    }
    
}
-(void)setItemTextColor:(UIColor *)itemTextColor{
    _itemTextColor = itemTextColor;
    if (_graphCodeType == GraphCodeNumWithSpace) {
        for (UILabel *item in self.array_items) {
            item.textColor = itemTextColor;
        }
    }else{
        self.lbl_item.textColor = itemTextColor;
    }
    
}

-(UIColor *)getRandomBgColorWithAlpha:(CGFloat)alpha{
    float red = arc4random() % 100 / 100.0;
    float green = arc4random() % 100 / 100.0;
    float blue = arc4random() % 100 / 100.0;
    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    return color;
}

-(NSArray *)getGraphCodeDataSource{
    NSArray *array = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z"];
    NSMutableSet *randomSet = [[NSMutableSet alloc] init];
    while ([randomSet count] < _itemCount) {
        int r = arc4random() % [array count];
        [randomSet addObject:[array objectAtIndex:r]];
    }
    NSArray *randomArray = [randomSet allObjects];
    return randomArray;
}
@end
