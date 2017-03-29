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
    UIImageView *_arcImg;
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
        _p = 0.;
        _arcImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1"]];
        _arcImg.layer.masksToBounds = YES;
        [self addSubview:_arcImg];
//        [self.layer addAnimation:[[SFAnnuarMainTool defaultShared] sf_returnZAnimantion]forKey:@"z-animation"];
    }
    return self;
}

- (void)layoutSubviews{
    _circularView.frame = CGRectMake(self.centerX - HalfV(circularW), HalfV(self.height - DoubV(radius)) - HalfV(circularW), circularW, circularW);
    [[SFAnnuarMainTool defaultShared] sf_cutImageView:_circularView];
    _arcImg.frame = self.bounds;
    [self drawArc];
}

- (void)drawRect:(CGRect)rect{
    [self drawArc];
    [super drawRect:rect];
}

- (void)drawArc{
    CAShapeLayer *l = [[SFAnnuarMainTool defaultShared] sf_shapeLayerWithLineWidth:5];
    l.path = [[SFAnnuarMainTool defaultShared] sf_bezierPathWithCenter:_arcImg.centerPoint radius:radius startDegrees:-M_PI_2 - 0.1 endDegress:(-2.5 * M_PI + 0.1)*_p].CGPath;
    _arcImg.layer.mask = l;
}

#pragma mark - set 
- (void)setPercent:(CGFloat)percent{
    _p = percent;
//    [self drawArc];
}
@end
