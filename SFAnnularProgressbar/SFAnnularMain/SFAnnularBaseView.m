//
//  SFAnnularBaseView.m
//  SFAnnularProgressbar
//
//  Created by cnlive-lsf on 2017/3/27.
//  Copyright © 2017年 lsf. All rights reserved.
//

#import "SFAnnularBaseView.h"
#import "SFAnnuarMainTool.h"
#import "UIView+SFExtension.h"
#import "SFAnnularAnimView.h"

#define height(view) view.bounds.size.height
#define weight(view) view.bounds.size.width

@interface SFAnnularBaseView(){
    UIImageView *_circularIV;
    CGFloat _p;
    SFAnnularAnimView *_animView;
}

@end

@implementation SFAnnularBaseView
#pragma mark - system method
- (instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        _circularIV = [[SFAnnuarMainTool defaultShared] sf_drawIVCircularFrame:CGRectMake(0, 0, wh, wh) radius:radius beginDegrees:0 endDegrees:2 * M_PI isClockwrise:YES borderWidth:5 borderColor:[UIColor lightGrayColor]];
        [self addSubview: _circularIV];
        _p = 0.3;
        _animView = [[SFAnnularAnimView alloc] init];
        [_circularIV addSubview:_animView];
    }
    return self;
}

- (void)drawRect:(CGRect)rect{
    _circularIV.frame = CGRectMake(HalfV(self.bounds.size.width - wh), HalfV(self.bounds.size.height - wh), wh, wh);
    _animView.frame = _circularIV.bounds;
    self.perLabel.frame = CGRectMake( 0, HalfV(_circularIV.height) - 13, _circularIV.width, 25);
//    self.perLabel.center = _circularIV.centerPoint;
    [super drawRect:rect];
}

#pragma mark - set 
- (void)setPercent:(CGFloat)percent{
    _p = percent;
}

#pragma mark - get 
- (UILabel *)perLabel{
    if (!_perLabel) {
        _perLabel = [[UILabel alloc] init];
        _perLabel.textColor = [UIColor lightGrayColor];
        _perLabel.font = [UIFont systemFontOfSize:15];
        _perLabel.textAlignment = NSTextAlignmentCenter;
        _perLabel.text = @"100%";
        [_circularIV addSubview:_perLabel];
    }
    return _perLabel;
}
@end
