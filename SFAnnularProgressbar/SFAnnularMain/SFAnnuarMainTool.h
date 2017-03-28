//
//  SFAnnuarMainTool.h
//  SFAnnularProgressbar
//
//  Created by cnlive-lsf on 2017/3/27.
//  Copyright © 2017年 lsf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface SFAnnuarMainTool : NSObject
+ (instancetype)defaultShared;

/**
 返回imageView的圆形

 @param frameImg IV的frame
 @param radius 半径
 @param begin 开始角度
 @param end 结束角度
 @param clockwrise 是否顺时针
 @param lineW 宽度
 @param color 颜色
 @return IV
 */
- (UIImageView *)sf_drawIVCircularFrame:(CGRect)frameImg radius:(CGFloat)radius beginDegrees:(double)begin endDegrees:(double)end isClockwrise:(BOOL)clockwrise borderWidth:(CGFloat)lineW borderColor:(UIColor *)color;

/**
 将UIView切割成圆形 CPU负担

 @param view UIView
 */
- (void)sf_cutImageView:(UIView *)view;

/**
 z轴转动

 @return <#return value description#>
 */
- (CABasicAnimation *)sf_returnZAnimantion;
@end
