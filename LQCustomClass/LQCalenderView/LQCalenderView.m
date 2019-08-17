//
//  LQCalenderView.m
//  LQCustomClass
//
//  Created by liang lee on 2019/8/17.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import "LQCalenderView.h"
#import "LQCalenderHeadView.h"
#import "LQCalenderWeekView.h"
#import "LQCalenderDayModel.h"
#import "NSString+LQCalender.h"
#import "NSDate+LQCalender.h"
#import "LQCalenderMonthModel.h"
#import "LQCalenderCollectionViewCell.h"
@interface LQCalenderView ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)LQCalenderHeadView *calendarHeader; //头部
@property(nonatomic,strong)LQCalenderWeekView *calendarWeekView;//周
@property(nonatomic,strong)UICollectionView *collectionView;//日历
@property(nonatomic,strong)NSMutableArray *monthdataA;//当月的模型集合
@property(nonatomic,strong)NSDate *currentMonthDate;//当月的日期
@property(nonatomic,strong)UISwipeGestureRecognizer *leftSwipe;//左滑手势
@property(nonatomic,strong)UISwipeGestureRecognizer *rightSwipe;//右滑手势
@property(nonatomic,strong)LQCalenderDayModel *selectModel;

@end

@implementation LQCalenderView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.currentMonthDate = [NSDate date];
        [self setup];
    }
    return self;
}
-(void)dealData{
    [self responData];
}
-(void)setup{
    [self addSubview:self.calendarHeader];
    
    __weak typeof(self) weakSelf = self;
    self.calendarHeader.leftClickBlock = ^{
        [weakSelf rightSlide];
    };
    self.calendarHeader.backgroundColor = [UIColor cyanColor];
    self.calendarHeader.rightClickBlock = ^{
        [weakSelf leftSlide];

    };
    self.calendarWeekView.backgroundColor = [UIColor yellowColor];
    [self addSubview:self.calendarWeekView];
    
    
    [self addSubview:self.collectionView];
    
    
    
    //添加左滑右滑手势
    self.leftSwipe =[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(leftSwipe:)];
    self.leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    
    [self.collectionView addGestureRecognizer:self.leftSwipe];
    
    self.rightSwipe =[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(rightSwipe:)];
    self.rightSwipe.direction = UISwipeGestureRecognizerDirectionRight;
    
    [self.collectionView addGestureRecognizer:self.rightSwipe];
}
#pragma mark --左滑手势--
-(void)leftSwipe:(UISwipeGestureRecognizer *)swipe{
    
    [self leftSlide];
}
#pragma mark --左滑处理--
-(void)leftSlide{
    self.currentMonthDate = [self.currentMonthDate getNextMonthSomeDay];
    
    [self performAnimations:kCATransitionFromRight];
    [self responData];
}
#pragma mark --右滑处理--
-(void)rightSlide{
    
    self.currentMonthDate = [self.currentMonthDate getLastMonthSomeDay];
    [self performAnimations:kCATransitionFromLeft];
    
    [self responData];
}
#pragma mark --右滑手势--
-(void)rightSwipe:(UISwipeGestureRecognizer *)swipe{
    
    [self rightSlide];
}
#pragma mark--动画处理--
- (void)performAnimations:(NSString *)transition{
    CATransition *catransition = [CATransition animation];
    catransition.duration = 0.5;
    [catransition setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    catransition.type = kCATransitionPush; //choose your animation
    catransition.subtype = transition;
    [self.collectionView.layer addAnimation:catransition forKey:nil];
}
#pragma mark--数据以及更新处理--
-(void)responData{
    
    [self.monthdataA removeAllObjects];
    
    NSDate *previousMonthDate = [self.currentMonthDate getLastMonthSomeDay];
    
    LQCalenderMonthModel *monthModel = [[LQCalenderMonthModel alloc]initWithDate:self.currentMonthDate];
    
    LQCalenderMonthModel *lastMonthModel = [[LQCalenderMonthModel alloc]initWithDate:previousMonthDate];
    
    self.calendarHeader.dateStr = [NSString stringWithFormat:@"%ld年%ld月",monthModel.year,monthModel.month];
    
    NSInteger firstWeekday = monthModel.firstWeekday;
    NSLog(@"monthModel.firstWeekday----->>>%ld",monthModel.firstWeekday);
    NSInteger totalDays = monthModel.totalDays;
    
    for (int i = 0; i <42; i++) {
        
        LQCalenderDayModel *model =[[LQCalenderDayModel alloc]init];
        
        //配置外面属性
        [self configDayModel:model];
        
        model.firstWeekday = firstWeekday;
        model.totalDays = totalDays;
        
        model.month = monthModel.month;
        
        model.year = monthModel.year;
        
        
        //上个月的日期
        if (i < firstWeekday) {
            model.day = lastMonthModel.totalDays - (firstWeekday - i) + 1;
            model.isLastMonth = YES;
        }
        
        //当月的日期
        if (i >= firstWeekday && i < (firstWeekday + totalDays)) {
            
            model.day = i -firstWeekday +1;
            model.isCurrentMonth = YES;
            
            //标识是今天
            if ((monthModel.month == [[NSDate date] getCurrentMonth]) && (monthModel.year == [[NSDate date] getCurrentYear])) {
                if (i == [[NSDate date] getCurrentDay] + firstWeekday - 1) {
                    
                    model.isToday = YES;
                    
                }
            }
            
        }
        //下月的日期
        if (i >= (firstWeekday + monthModel.totalDays)) {
            
            model.day = i -firstWeekday - monthModel.totalDays +1;
            model.isNextMonth = YES;
            
        }
        
        [self.monthdataA addObject:model];
        
    }
    
    
    [self.monthdataA enumerateObjectsUsingBlock:^(LQCalenderDayModel * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if ((obj.year == self.selectModel.year) && (obj.month == self.selectModel.month) && (obj.day == self.selectModel.day)) {
            obj.isSelected = YES;
        }
    }];
    [self.collectionView reloadData];
    
}

-(void)configDayModel:(LQCalenderDayModel *)model{
    
    //配置外面属性
    model.isHaveAnimation = self.isHaveAnimation;
    
    model.currentMonthTitleColor = self.currentMonthTitleColor;
    
    model.lastMonthTitleColor = self.lastMonthTitleColor;
    
    model.nextMonthTitleColor = self.nextMonthTitleColor;
    
    model.selectBackColor = self.selectBackColor;
    
    model.isHaveAnimation = self.isHaveAnimation;
    
    model.todayTitleColor = self.todayTitleColor;
    
    model.isShowLastAndNextDate = self.isShowLastAndNextDate;
    
}
#pragma mark---懒加载
-(LQCalenderHeadView *)calendarHeader{
    if (!_calendarHeader) {
        _calendarHeader = [[LQCalenderHeadView alloc]initWithFrame:CGRectMake(0, 0, self.width, 50*WidthRatio)];
        [self addSubview:_calendarHeader];
    }
    return _calendarHeader;
}
-(LQCalenderWeekView *)calendarWeekView{
    if (!_calendarWeekView) {
        _calendarWeekView =[[LQCalenderWeekView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.calendarHeader.frame), self.width, 50*WidthRatio)];
        [self addSubview:_calendarWeekView];
    }
    return _calendarWeekView;
}
-(UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flow =[[UICollectionViewFlowLayout alloc]init];
        //325*403
        flow.minimumInteritemSpacing = 0;
        flow.minimumLineSpacing = 0;
        flow.sectionInset =UIEdgeInsetsMake(0 , 0, 0, 0);
        
        flow.itemSize = CGSizeMake(self.width/7, 50*WidthRatio);
        _collectionView =[[UICollectionView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.calendarWeekView.frame), self.width, 6 * 50*WidthRatio) collectionViewLayout:flow];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.scrollsToTop = YES;
        _collectionView.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:_collectionView];
        
        [_collectionView registerClass:[LQCalenderCollectionViewCell class] forCellWithReuseIdentifier:@"calendarCell"];
        
    }
    return _collectionView;
}
-(NSMutableArray *)monthdataA{
    if (!_monthdataA) {
        _monthdataA =[NSMutableArray array];
    }
    return _monthdataA;
}
/*
 * 当前月的title颜色
 */
-(void)setCurrentMonthTitleColor:(UIColor *)currentMonthTitleColor{
    _currentMonthTitleColor = currentMonthTitleColor;
}
/*
 * 上月的title颜色
 */
-(void)setLastMonthTitleColor:(UIColor *)lastMonthTitleColor{
    _lastMonthTitleColor = lastMonthTitleColor;
}
/*
 * 下月的title颜色
 */
-(void)setNextMonthTitleColor:(UIColor *)nextMonthTitleColor{
    _nextMonthTitleColor = nextMonthTitleColor;
}

/*
 * 选中的背景颜色
 */
-(void)setSelectBackColor:(UIColor *)selectBackColor{
    _selectBackColor = selectBackColor;
}

/*
 * 选中的是否动画效果
 */

-(void)setIsHaveAnimation:(BOOL)isHaveAnimation{
    
    _isHaveAnimation  = isHaveAnimation;
}

/*
 * 是否禁止手势滚动
 */
-(void)setIsCanScroll:(BOOL)isCanScroll{
    _isCanScroll = isCanScroll;
    
    self.leftSwipe.enabled = self.rightSwipe.enabled = isCanScroll;
}

/*
 * 是否显示上月，下月的按钮
 */

-(void)setIsShowLastAndNextBtn:(BOOL)isShowLastAndNextBtn{
    _isShowLastAndNextBtn  = isShowLastAndNextBtn;
//    self.calendarHeader.isShowLeftAndRightBtn = isShowLastAndNextBtn;
}


/*
 * 是否显示上月，下月的的数据
 */
-(void)setIsShowLastAndNextDate:(BOOL)isShowLastAndNextDate{
    _isShowLastAndNextDate =  isShowLastAndNextDate;
}
/*
 * 今日的title颜色
 */

-(void)setTodayTitleColor:(UIColor *)todayTitleColor{
    _todayTitleColor = todayTitleColor;
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.monthdataA.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    LQCalenderCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"calendarCell" forIndexPath:indexPath];
    cell.model = self.monthdataA[indexPath.row];
    cell.backgroundColor =[UIColor whiteColor];
    return cell;
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    LQCalenderDayModel *model = self.monthdataA[indexPath.row];
    if (!model.isCurrentMonth) {
        return;
    }
    model.isSelected = YES;
    
    //选中的day
    self.selectModel = model;
    [self.monthdataA enumerateObjectsUsingBlock:^(LQCalenderDayModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if (obj != model) {
            obj.isSelected = NO;
        }
    }];
    
    if (self.selectBlock) {
        self.selectBlock(model.year, model.month, model.day);
    }
    [collectionView reloadData];
    
}
@end
