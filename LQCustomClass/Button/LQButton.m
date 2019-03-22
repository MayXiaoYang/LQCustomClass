//
//  LQButton.m
//  LQButton
//
//  Created by LYKJ on 17/5/26.
//  Copyright © 2017年 LYKJ. All rights reserved.
//

#import "LQButton.h"

@implementation LQButton

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    if (self = [super initWithCoder:aDecoder]) {
        
        [self commonInit];
        
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        [self commonInit];
    }
    return self;
}

-(void)commonInit{
    
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    self.titleLabel.font = [UIFont systemFontOfSize:15.0f];
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    
    CGFloat title_X = 0;
    
    CGFloat title_Y = contentRect.size.height * 0.75;
    
    CGFloat title_W = contentRect.size.width;
    
    CGFloat title_H = contentRect.size.height - title_Y;
    
    return CGRectMake(title_X, title_Y, title_W, title_H);
    
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    
    CGFloat image_W = CGRectGetWidth(contentRect);
    
    CGFloat image_H = contentRect.size.height * 0.7;
    
    return CGRectMake(0, 0, image_W, image_H);
    
}

@end
