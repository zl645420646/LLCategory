//
//  UIButton+LLButton.m
//  iOS控件工具集合
//
//  Created by 华腾软科 on 2018/12/19.
//  Copyright © 2018 华腾软科. All rights reserved.
//

#import "UIButton+LLButton.h"
#import <objc/runtime.h>

static NSTimer *_timer;
static NSInteger _seconds;
static NSInteger _times;

static const void *UtilityKey = &UtilityKey;

@implementation UIButton (LLButton)

@dynamic countDownBlock;
@dynamic second;
/**
 *  圆角
 */
-(void)setButtonCornerRadiusWithRadius:(CGFloat)radius
{
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
}

/**
 *  圆角 - 方向 ------->向上的、向下、左边的、右边的
 */
-(void)setButtonCornerRadiusWithRadius:(CGFloat)radius TopLeft:(UIRectCorner)TopLeft TopRight:(UIRectCorner)TopRight BottomLeft:(UIRectCorner)BottomLeft BottomRight:(UIRectCorner)BottomRight
{
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:TopLeft|TopRight|BottomLeft|BottomRight cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;

    self.layer.mask = maskLayer;
}

/**
 *  图文混排 ---------> 图片居于文字哪个方向
 */
-(void)setButtonImage:(NSString *)image imageSize:(CGSize)size direction:(LLButtonImageDerection)direction
{
    [self setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    
    //图片位置
    CGRect imageRect = self.imageView.frame;
    imageRect.size = CGSizeMake(0, 0);

    //文字位置
    CGRect titleRect = self.titleLabel.frame;
    
    if (direction == LLButtonImageDerectionLeft) {
        imageRect.origin.x = (self.frame.size.width - 30) ;
        imageRect.origin.y = (self.frame.size.height  - 30)/2.0f;

        titleRect.origin.x = (self.frame.size.width - imageRect.size.width- titleRect.size.width);
        titleRect.origin.y = (self.frame.size.height - titleRect.size.height)/2.0f;
        
    }else if (direction == LLButtonImageDerectionRight){
        imageRect.origin.x = (self.frame.size.width - 30) * 0.5;
        imageRect.origin.y = self.frame.size.height * 0.5 - 40;    
        
        titleRect.origin.x = (self.frame.size.width - titleRect.size.width) * 0.5;
        titleRect.origin.y = self.frame.size.height * 0.5 ;
    }else if (direction == LLButtonImageDerectionUp){
        
    }else{
        
    }


    self.imageView.frame = imageRect;
    self.titleLabel.frame = titleRect;

}


-(LLCountDownEndBlock)countDownBlock
{
    return objc_getAssociatedObject(self, UtilityKey);
}

-(void)setCountDownBlock:(LLCountDownEndBlock)countDownBlock
{
    objc_setAssociatedObject(self, UtilityKey, countDownBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(void)setSecond:(NSInteger)second
{
    _times = second;//记录时间
    _seconds = second;//倒计时
}


-(void)countDown
{
    _seconds--;
    
    if (self.countDownBlock) {
        self.countDownBlock(_seconds);
    }
    
    if (_seconds == 0) {
        [_timer invalidate];
        _timer = nil;

        //倒计时完毕后 打开按钮
        self.userInteractionEnabled = YES;

        _seconds = _times;
    }
}
//开启
-(void)startCountDown{
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
    //点击一次后禁用
    self.userInteractionEnabled = NO;
}
//暂停
-(void)pauseCountDown{
    [_timer invalidate];
}
//销毁
-(void)deleteCountDown{
    [_timer invalidate];
    _timer = nil;
}

//退出销毁
-(void)dealloc
{
    [_timer invalidate];
    _timer = nil;
}



@end
