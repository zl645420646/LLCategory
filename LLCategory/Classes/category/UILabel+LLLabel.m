//
//  UILabel+LLLabel.m
//  iOS控件工具集合
//
//  Created by 华腾软科 on 2018/12/19.
//  Copyright © 2018 华腾软科. All rights reserved.
//

#import "UILabel+LLLabel.h"

@implementation UILabel (LLLabel)

/**
 *  设置部分文字大小
 */
-(void)setTextFont:(UIFont *)font atRange:(NSRange)range
{
    NSMutableAttributedString *aString = [[NSMutableAttributedString alloc]initWithAttributedString:self.attributedText];

    //设置文字大小
    [aString addAttribute:NSFontAttributeName value:font range:range];
    
    self.attributedText = aString;
}

/**
 *  设置部分文字颜色
 */
-(void)setTextColor:(UIColor *)color atRange:(NSRange)range
{
    NSMutableAttributedString *aString = [[NSMutableAttributedString alloc]initWithAttributedString:self.attributedText];
    
    //设置文字颜色
    [aString addAttribute:NSForegroundColorAttributeName value:color range:range];
    
    self.attributedText = aString;
}

/**
 *  设置对应文字大小及颜色
 */
-(void)setTextFont:(UIFont *)font color:(UIColor *)color atRange:(NSRange)range
{
    NSMutableAttributedString *aString = [[NSMutableAttributedString alloc]initWithAttributedString:self.attributedText];

    //设置文字颜色
    [aString addAttribute:NSForegroundColorAttributeName value:color range:range];
    
    //设置文字大小
    [aString addAttribute:NSFontAttributeName value:font range:range];

    self.attributedText = aString;
}

/**
 *  设置对应文字行间距
 */
-(void)setTextLineSpace:(float)space atRange:(NSRange)range
{
    NSMutableAttributedString *aString = [[NSMutableAttributedString alloc]initWithAttributedString:self.attributedText];

    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:space];//调整行间距
    
    [aString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:range];

    self.attributedText = aString;
}

/**
 *  设置对应文字字间距
 */
-(void)setTextWordSpace:(float)space atRange:(NSRange)range
{
    NSMutableAttributedString *aString = [[NSMutableAttributedString alloc]initWithAttributedString:self.attributedText];

    [aString addAttribute:NSKernAttributeName value:@(space) range:range];//调整字间距
    
    self.attributedText = aString;
}

/**
 *  设置对应文字字间距及行间距
 */
-(void)setTextLineSpace:(float)lineSpace wordSpace:(float)wordSpace atRange:(NSRange)range
{
    NSMutableAttributedString *aString = [[NSMutableAttributedString alloc]initWithAttributedString:self.attributedText];

    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];//调整行间距
    
    [aString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:range];
    [aString addAttribute:NSKernAttributeName value:@(wordSpace) range:range];//调整字间距

    self.attributedText = aString;
}

/**
 *  中划线
 */
-(void)setTextStrikethroughWithRange:(NSRange)range lineColor:(nonnull UIColor *)color
{
    NSMutableAttributedString *aString = [[NSMutableAttributedString alloc]initWithAttributedString:self.attributedText];

    [aString addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:range];//设置中划线
    [aString addAttribute:NSStrikethroughColorAttributeName value:color range:range];//设置颜色

    self.attributedText = aString;
}

/**
 *  下划线
 */
-(void)setTextUnderlineWithRange:(NSRange)range lineColor:(nonnull UIColor *)color
{
    NSMutableAttributedString *aString = [[NSMutableAttributedString alloc]initWithAttributedString:self.attributedText];
    
    [aString addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:range];//设置下划线
    [aString addAttribute:NSUnderlineColorAttributeName value:color range:range];//设置颜色

    self.attributedText = aString;
}

/**
 *  偏移
 */
-(void)setTextSkewingWithoffset:(CGFloat)offset Range:(NSRange)range
{
    NSMutableAttributedString *aString = [[NSMutableAttributedString alloc]initWithAttributedString:self.attributedText];
    
    [aString addAttribute:NSBaselineOffsetAttributeName value:@(offset) range:range];//设置偏移量
    
    self.attributedText = aString;
}

/**
 *  图文混排
 */
-(void)setTextImageWithImage:(NSString *)image imageSize:(CGRect)size place:(NSInteger)atIndex
{
    NSMutableAttributedString *aString = [[NSMutableAttributedString alloc]initWithAttributedString:self.attributedText];
    // 创建一个文字附件对象
    NSTextAttachment *textAttachment = [[NSTextAttachment alloc] init];
    textAttachment.image = [UIImage imageNamed:image];  //设置图片源
    textAttachment.bounds = size;  //设置图片位置和大小
    // 将文字附件转换成属性字符串
    NSAttributedString *attachmentAttrStr = [NSAttributedString attributedStringWithAttachment:textAttachment];
    
    [aString insertAttributedString:attachmentAttrStr atIndex:atIndex];
    
    self.attributedText = aString;
    
}


/**
 *  点击部分文字
 */
//-(void)clickLabelWithRange:(NSRange)range withAction:(ClickRangeLabelBlock)block
//{
//    self.userInteractionEnabled = YES;
//
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickLabel:)];
//
//    [self addGestureRecognizer:tap];
//}
//
//-(void)clickLabel:(UITapGestureRecognizer *)tap
//{
//    UILabel *label =(UILabel *)tap.view;
//    CGPoint point = [tap locationInView:self];
//
//
//    NSLog(@"********* %f",point.x);
//
//    NSLog(@"********* %@",label.text);
//}


@end
