//
//  LQYYTextTestViewController.m
//  LQCustomClass
//
//  Created by liang lee on 2019/6/27.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import "LQYYTextTestViewController.h"
#import <YYText.h>
#import <YYTextLayout.h>
@interface LQYYTextTestViewController ()
@property (nonatomic, strong)YYLabel *label;
@property (nonatomic, strong)YYLabel *tokenLabel;
@property (nonatomic, strong)YYTextLayout *yyLayout;
@end

@implementation LQYYTextTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
//    [self configurationUI];
//    [self aaaa];
    [self.view addSubview:self.tokenLabel];
}

-(void)configurationUI{
    YYLabel *yy_label = [YYLabel new];
    //自动换行
    yy_label.numberOfLines = 0;
    yy_label.textAlignment = NSTextAlignmentLeft;
    yy_label.backgroundColor = [UIColor orangeColor];
    //自动换行，改变label高度，即自适应高度，注音⚠️：多行显示的label，必须设置该属性，否则需自行添加高度
    yy_label.preferredMaxLayoutWidth = CGRectGetWidth(self.view.frame) - 30;
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc]initWithString:@"自动换行，改变label高度，即自适应高度，注意：多行显示的label，必须设置该属性，否则需自行添加高度"];
    yy_label.attributedText = attr;
    YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:CGSizeMake(SCREEN_WIDTH - 30, LONG_LONG_MAX) text:attr];
    yy_label.x = 15;
    yy_label.y = navgationBarH + 100;
    yy_label.width = SCREEN_WIDTH - 30;
    yy_label.height = layout.textBoundingSize.height;
    //自动换行，改变label高度，即自适应高度，注音⚠️：多行显示的label，必须设置该属性，否则需自行添加高度
    [self.view addSubview:yy_label];
    
}
-(void)aaaa{
    NSMutableAttributedString *text = [NSMutableAttributedString new];
    
    UIFont *font = [UIFont systemFontOfSize:16];
    
    //添加文本
    
    NSString *title = @"豫章故郡，洪都新府。星分翼轸，地接衡庐。襟三江而带五湖，控蛮荆而引瓯越。物华天宝，龙光射牛斗之墟；人杰地灵，徐孺下陈蕃之榻。雄州雾列，俊采星驰。台隍枕夷夏之交，宾主尽东南之美。都督阎公之雅望，棨戟遥临；宇文新州之懿范，襜帷暂驻。十旬休假，胜友如云；千里逢迎，高朋满座。腾蛟起凤，孟学士之词宗；紫电青霜，王将军之武库。家君作宰，路出名区；童子何知，躬逢胜饯。时维九月，序属三秋。潦水尽而寒潭清，烟光凝而暮山紫。俨骖騑于上路，访风景于崇阿。临帝子之长洲，得仙人之旧馆。层台耸翠，上出重霄；飞阁流丹，下临无地。鹤汀凫渚，穷岛屿之萦回；桂殿兰宫，列冈峦之体势。";
    
    [text appendAttributedString:[[NSAttributedString alloc] initWithString:title attributes:nil]];
    
    text.yy_font = font ;
    
    _label = [YYLabel new];
    
    _label.userInteractionEnabled =YES;
    
    _label.numberOfLines =0;
    
    _label.textVerticalAlignment = YYTextVerticalAlignmentTop;
    
    _label.frame = CGRectMake(60,60+navgationBarH, 260,260);
    
    _label.attributedText = text;
    
    [self.view addSubview:_label];
    
    _label.layer.borderWidth =0.5;
    
    _label.layer.borderColor = [UIColor colorWithRed:0.000 green:0.463 blue:1.000 alpha:1.000].CGColor;
    
    [self addSeeMoreButton];
}
- (void)addSeeMoreButton {
    
    __weak typeof(self) weakSelf =self;
    
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"...more"];
    
    YYTextHighlight *hi = [YYTextHighlight new];
    
    [hi setColor:[UIColor colorWithRed:0.578 green:0.790 blue:1.000 alpha:1.000]];
    
    hi.tapAction = ^(UIView *containerView,NSAttributedString *text,NSRange range, CGRect rect) {
        
        YYLabel *label = weakSelf.label;
        
        [label sizeToFit];
        
    };
    
    [text yy_setColor:[UIColor colorWithRed:0.000 green:0.449 blue:1.000 alpha:1.000] range:[text.string rangeOfString:@"more"]];
    
    [text yy_setTextHighlight:hi range:[text.string rangeOfString:@"more"]];
    
    text.yy_font =_label.font;
    
    YYLabel *seeMore = [YYLabel new];
    
    seeMore.attributedText = text;
    
    [seeMore sizeToFit];
    
    NSAttributedString *truncationToken = [NSAttributedString yy_attachmentStringWithContent:seeMore contentMode:UIViewContentModeCenter attachmentSize:seeMore.frame.size alignToFont:text.yy_font alignment:YYTextVerticalAlignmentCenter];
    
    _label.truncationToken =  truncationToken;
    
}

- (YYLabel *)tokenLabel {
    if (!_tokenLabel) {
        _tokenLabel = [YYLabel new];
        _tokenLabel.frame = CGRectMake(20, 100, [UIScreen mainScreen].bounds.size.width - 40, 36);
        _tokenLabel.numberOfLines = 0;
        _tokenLabel.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.75];
        [self addSeeMoreButtonInLabel:_tokenLabel];
        
    }
    
    return _tokenLabel;
}

- (void)addSeeMoreButtonInLabel:(YYLabel *)label {
    UIFont *font16 = [UIFont systemFontOfSize:16];
    label.attributedText = [[NSAttributedString alloc] initWithString:@"豫章故郡，洪都新府。星分翼轸，地接衡庐。襟三江而带五湖，控蛮荆而引瓯越。物华天宝，龙光射牛斗之墟；人杰地灵，徐孺下陈蕃之榻。雄州雾列，俊采星驰。台隍枕夷夏之交，宾主尽东南之美。都督阎公之雅望，棨戟遥临；宇文新州之懿范，襜帷暂驻。十旬休假，胜友如云；千里逢迎，高朋满座。腾蛟起凤，孟学士之词宗；紫电青霜，王将军之武库。家君作宰，路出名区；童子何知，躬逢胜饯。时维九月，序属三秋。潦水尽而寒潭清，烟光凝而暮山紫。俨骖騑于上路，访风景于崇阿。临帝子之长洲，得仙人之旧馆。层台耸翠，上出重霄；飞阁流丹，下临无地。鹤汀凫渚，穷岛屿之萦回；桂殿兰宫，列冈峦之体势。" attributes:@{NSFontAttributeName : font16}];
    _yyLayout = [YYTextLayout layoutWithContainerSize:CGSizeMake(SCREEN_WIDTH - 30, LONG_LONG_MAX) text:label.attributedText];
//    _tokenLabel.height = _yyLayout.textBoundingSize.height;
    NSString *moreString = @" 展开";
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"... %@", moreString]];
    NSRange expandRange = [text.string rangeOfString:moreString];
    
    [text addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:expandRange];
    [text addAttribute:NSForegroundColorAttributeName value:[UIColor darkTextColor] range:NSMakeRange(0, expandRange.location)];
    
    //添加点击事件
    YYTextHighlight *hi = [YYTextHighlight new];
    [text yy_setTextHighlight:hi range:[text.string rangeOfString:moreString]];
    
    __weak typeof(self) weakSelf = self;
    hi.tapAction = ^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
        //点击展开
        [weakSelf setFrame:YES];
    };
    
    text.yy_font = font16;
    
    YYLabel *seeMore = [YYLabel new];
    seeMore.attributedText = text;
    [seeMore sizeToFit];
    
    NSAttributedString *truncationToken = [NSAttributedString yy_attachmentStringWithContent:seeMore contentMode:UIViewContentModeCenter attachmentSize:seeMore.frame.size alignToFont:text.yy_font alignment:YYTextVerticalAlignmentTop];
    
    label.truncationToken = truncationToken;
}

- (NSAttributedString *)appendAttriStringWithFont:(UIFont *)font {
    if (!font) {
        font = [UIFont systemFontOfSize:16];
    }
    
    NSString *appendText = @" 收起 ";
    NSMutableAttributedString *append = [[NSMutableAttributedString alloc] initWithString:appendText attributes:@{NSFontAttributeName : font, NSForegroundColorAttributeName : [UIColor blueColor]}];
    
    YYTextHighlight *hi = [YYTextHighlight new];
    [append yy_setTextHighlight:hi range:[append.string rangeOfString:appendText]];
    
    __weak typeof(self) weakSelf = self;
    hi.tapAction = ^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
        //点击收起
        [weakSelf setFrame:NO];
    };
    
    return append;
}

- (void)expandString {
    NSMutableAttributedString *attri = [_tokenLabel.attributedText mutableCopy];
    [attri appendAttributedString:[self appendAttriStringWithFont:attri.yy_font]];
    _tokenLabel.attributedText = attri;
}

- (void)packUpString {
    NSString *appendText = @" 收起 ";
    NSMutableAttributedString *attri = [_tokenLabel.attributedText mutableCopy];
    NSRange range = [attri.string rangeOfString:appendText options:NSBackwardsSearch];
    
    if (range.location != NSNotFound) {
        [attri deleteCharactersInRange:range];
    }
    
    _tokenLabel.attributedText = attri;
}


- (void)setFrame:(BOOL)isExpand {
    if (isExpand) {
        [self expandString];
        self.tokenLabel.frame = CGRectMake(20, 100, [UIScreen mainScreen].bounds.size.width - 40, _yyLayout.textBoundingSize.height);
    }
    else {
        [self packUpString];
        self.tokenLabel.frame = CGRectMake(20, 100, [UIScreen mainScreen].bounds.size.width - 40, 36);
    }
}
@end
