//
//  SFAnnularAnimView.m
//  SFAnnularProgressbar
//
//  Created by cnlive-lsf on 2017/3/28.
//  Copyright © 2017年 lsf. All rights reserved.
//

#import "SFAnnularAnimView.h"
#import "UIView+SFExtension.h"
#import "SFAnnuarMainTool.h"
@interface SFAnnularAnimView(){
    UIView *_circularView;
    CGFloat _p;
}

@end

@implementation SFAnnularAnimView
#pragma mark - system method
- (instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = [UIColor clearColor];
        _circularView = [[UIView alloc] init];
        _circularView.backgroundColor = [UIColor orangeColor];
        [self addSubview:_circularView];
        _p = .3;
        [self.layer addAnimation:[[SFAnnuarMainTool defaultShared] sf_returnZAnimantion]forKey:@"z-animation"];
    }
    return self;
}

- (void)layoutSubviews{
    _circularView.frame = CGRectMake(self.centerX - HalfV(circularW), HalfV(self.height - DoubV(radius)) - HalfV(circularW), circularW, circularW);
    [[SFAnnuarMainTool defaultShared] sf_cutImageView:_circularView];
}

- (void)drawRect:(CGRect)rect{
    [self drawArc];
    [super drawRect:rect];
}

- (void)drawArc{
    // 1. 还是添加一个圆弧路径
    // 获取当前context
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 设置线的宽度
    CGContextSetLineWidth(ctx, 5);
    
    // 设置线条端点为圆角
    CGContextSetLineCap(ctx, kCGLineCapRound);
    // 设置画笔颜色
    CGContextSetFillColorWithColor(ctx, [UIColor blackColor].CGColor);
    // 计算半径
    // 逆时针画一个圆弧
    CGContextAddArc(ctx, self.centerX, self.centerY, radius, -M_PI_2, -M_PI*2.5*_p, YES);
    
    // 2. 创建一个渐变色
    // 创建RGB色彩空间，创建这个以后，context里面用的颜色都是用RGB表示
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    // 渐变色的颜色
    NSArray *colorArr = @[
                          (id)[UIColor orangeColor].CGColor,
                          (id)[UIColor blueColor].CGColor
                          ];
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)colorArr, NULL);
    // 释放色彩空间
    CGColorSpaceRelease(colorSpace);
    colorSpace = NULL;
    
    // ----------以下为重点----------
    // 3. "反选路径"
    // CGContextReplacePathWithStrokedPath
    // 将context中的路径替换成路径的描边版本，使用参数context去计算路径（即创建新的路径是原来路径的描边）。用恰当的颜色填充得到的路径将产生类似绘制原来路径的效果。你可以像使用一般的路径一样使用它。例如，你可以通过调用CGContextClip去剪裁这个路径的描边
    CGContextReplacePathWithStrokedPath(ctx);
    // 剪裁路径
    CGContextClip(ctx);
    
    // 4. 用渐变色填充
    CGContextDrawLinearGradient(ctx, gradient, CGPointMake(0, self.bounds.size.height / 2), CGPointMake(self.bounds.size.width, self.bounds.size.height / 2), 0);
    // 释放渐变色
    CGGradientRelease(gradient);
}

#pragma mark - set 
- (void)setPercent:(CGFloat)percent{
    _p = percent;
    [self drawRect:self.frame];
}
@end
