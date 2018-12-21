//
//  UILabel+LLLabel.h
//  iOS控件工具集合
//
//  Created by 华腾软科 on 2018/12/19.
//  Copyright © 2018 华腾软科. All rights reserved.
//

typedef void(^ClickRangeLabelBlock)();
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (LLLabel)
/**
 设置对应range的文字大小

 @param font 文字大小
 @param range 文字长度
 */
- (void)setTextFont:(UIFont *)font atRange:(NSRange)range;

/**
 设置对应range的文字颜色

 @param color 文字颜色
 @param range 文字长度
 */
- (void)setTextColor:(UIColor *)color atRange:(NSRange)range;;

/**
 设置对应range的文字大小及颜色

 @param font 文字大小
 @param color 文字颜色
 @param range 文字长度
 */
- (void)setTextFont:(UIFont *)font color:(UIColor *)color atRange:(NSRange)range;

/**
 设置对应range的文字行间距

 @param space 间距大小
 @param range 文字长度
 */
- (void)setTextLineSpace:(float)space atRange:(NSRange)range;

/**
 设置对应range的文字字间距

 @param space 间距大小
 @param range 文字长度
 */
- (void)setTextWordSpace:(float)space atRange:(NSRange)range;

/**
设置对应range的文字行间距及字间距

 @param lineSpace 行间距
 @param wordSpace 字间距
 @param range 长度
 */
- (void)setTextLineSpace:(float)lineSpace wordSpace:(float)wordSpace atRange:(NSRange)range;

/**
 添加中划线

 @param range 长度
 */
- (void)setTextStrikethroughWithRange:(NSRange)range lineColor:(UIColor *)color;

/**
 添加下划线

 @param range 长度
 */
- (void)setTextUnderlineWithRange:(NSRange)range lineColor:(UIColor *)color;

/**
 设置偏移量

 @param offset 偏移大小  offset > 0 向上
                       offset < 0 向下
 @param range 长度
 */
- (void)setTextSkewingWithoffset:(CGFloat)offset Range:(NSRange)range;


/**
 图文混排

 @param image 图片
 @param size 图片大小
 @param atIndex 图片所处位置
 */
- (void)setTextImageWithImage:(NSString *)image imageSize:(CGRect)size place:(NSInteger)atIndex;

#pragma mark - 如果想点击Label中部分文字并做出动作  ------->使用textview
//- (void)clickLabelWithRange:(NSRange)range withAction:(ClickRangeLabelBlock)block;

@end

NS_ASSUME_NONNULL_END
