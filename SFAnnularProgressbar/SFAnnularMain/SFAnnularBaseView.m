//
//  SFAnnularBaseView.m
//  SFAnnularProgressbar
//
//  Created by cnlive-lsf on 2017/3/27.
//  Copyright © 2017年 lsf. All rights reserved.
//

#import "SFAnnularBaseView.h"
#import "SFAnnuarMainTool.h"

#define HalfV(value) ((value) / 2.0)
#define height(view) view.bounds.size.height
#define weight(view) view.bounds.size.width

@interface SFAnnularBaseView(){
    UIImageView *_circularIV;
    UIView *_circularView;
}

@end

static const CGFloat wh = 120;
static const CGFloat radius = 50;

@implementation SFAnnularBaseView
#pragma mark - system method
- (instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        _circularIV = [[SFAnnuarMainTool defaultShared] sf_drawIVCircularFrame:CGRectMake(0, 0, wh, wh) radius:radius beginDegrees:0 endDegrees:2 * M_PI isClockwrise:YES borderWidth:5 borderColor:[UIColor lightGrayColor]];
        [self addSubview: _circularIV];
        
        _circularView = [[UIView alloc] init];
        _circularView.backgroundColor = [UIColor orangeColor];
        [_circularIV addSubview:_circularView];
    }
    return self;
}

- (void)drawRect:(CGRect)rect{
    _circularIV.frame = CGRectMake(HalfV(self.bounds.size.width - wh), HalfV(self.bounds.size.height - wh), wh, wh);
    _circularView.frame = CGRectMake( (_circularIV.bounds.size.width) / 2.0 - 5, (_circularIV.bounds.size.width - 2 *radius) / 2.0 - 5, 10, 10);
    [[SFAnnuarMainTool defaultShared] sf_cutImageView:_circularView];
    [super drawRect:rect];
}

@end
