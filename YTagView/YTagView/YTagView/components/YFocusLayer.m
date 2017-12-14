//
//  YFocusLayer.m
//  layerAnimationDemo
//
//  Created by shusy on 2017/12/13.
//  Copyright © 2017年 杭州爱卿科技. All rights reserved.
//

#import "YFocusLayer.h"

@interface YFocusLayer()
@property(nonatomic,strong)CALayer *focusLayer;
@property (nonatomic, strong) CAAnimationGroup *animationGroup;
@end

@implementation YFocusLayer

- (instancetype)init {
    if (self = [super init]) {
        self.radius = 20;
        self.animDuration = 1.0f;
        _focusLayer = [CALayer new];
        _focusLayer.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5].CGColor;
        _focusLayer.frame = CGRectMake(0, 0, 40, 40);
        _focusLayer.cornerRadius = 20;
        _focusLayer.opacity = 0;
        [self addSublayer:_focusLayer];
        self.instanceCount = 1;
        self.instanceDelay = 1;
    }
    return self;
}

- (void)setRadius:(CGFloat)radius {
    _radius = radius;
    _focusLayer.frame = CGRectMake(0, 0, radius*2, radius*2);
    _focusLayer.cornerRadius = radius;
    [self layoutIfNeeded];
}

- (void)layoutSublayers {
    [super layoutSublayers];
    self.focusLayer.position = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
}

- (void)startAnimation{
        if (!self.animationGroup) {
            CAAnimationGroup *animationnGroup = [CAAnimationGroup animation];
            animationnGroup.removedOnCompletion = NO;
            animationnGroup.repeatCount = NSIntegerMax;
            animationnGroup.duration = self.animDuration;
            self.animationGroup = animationnGroup;
            //创建缩放动画
            CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale.xy"];
            scaleAnimation.fromValue = @0;
            scaleAnimation.toValue = @1;
            scaleAnimation.duration = self.animDuration;
            
            //创建透明动画
            CAKeyframeAnimation *opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
            opacityAnimation.values = @[@(self.opacityFromValue),@0.45,@0];
            opacityAnimation.keyTimes = @[@0,@0.5,@1];
            animationnGroup.animations = @[scaleAnimation,opacityAnimation];
        }
        self.opacity = 1.0;
        [self.focusLayer addAnimation:self.animationGroup forKey:@"key"];
}

- (void)stopAnimation {
    self.focusLayer.opacity = 0.0f;
    [self.focusLayer removeAllAnimations];
}
@end
