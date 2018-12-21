//
//  UIButton+LLButton.h
//  iOS控件工具集合
//
//  Created by 华腾软科 on 2018/12/19.
//  Copyright © 2018 华腾软科. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^LLCountDownEndBlock)(NSInteger time);
NS_ASSUME_NONNULL_BEGIN

typedef NS_OPTIONS(NSUInteger, LLButtonImageDerection) {
    LLButtonImageDerectionLeft,     // -->居于文字左边
    LLButtonImageDerectionRight,    // -->居于文字右边
    LLButtonImageDerectionUp,       // -->居于文字上部
    LLButtonImageDerectionDown      // -->居于文字下部
};//图片处于按钮内的方向

@interface UIButton (LLButton)

/**
 圆角

 @param radius 圆角大小
 */
- (void)setButtonCornerRadiusWithRadius:(CGFloat)radius;//123123

/**
 圆角 - 方向 ------->向上的、向下、左边的、右边的

 @param radius 圆角大小
 @param direction 方向
 */
- (void)setButtonCornerRadiusWithRadius:(CGFloat)radius TopLeft:(UIRectCorner)TopLeft TopRight:(UIRectCorner)TopRight BottomLeft:(UIRectCorner)BottomLeft BottomRight:(UIRectCorner)BottomRight;



/**
 图文混排

 @param image 图片
 @param size 大小
 @param direction 方向
 */
- (void)setButtonImage:(NSString *)image imageSize:(CGSize)size direction:(LLButtonImageDerection)direction;


#pragma maek - 倒计时
/**
 *  倒计时block回调
 */
@property (nonatomic, copy)LLCountDownEndBlock countDownBlock;
/**
 *  倒计时时间
 */
@property (nonatomic, assign)NSInteger second;
/**
 *  开启倒计时
 */
- (void)startCountDown;
/**
 *  暂停倒计时
 */
- (void)pauseCountDown;
/**
 *  销毁倒计时
 */
- (void)deleteCountDown;





@end

NS_ASSUME_NONNULL_END
