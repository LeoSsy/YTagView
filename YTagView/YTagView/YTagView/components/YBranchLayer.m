//
//  YBranchLayer.m
//  layerAnimationDemo
//
//  Created by shusy on 2017/12/13.
//  Copyright © 2017年 杭州爱卿科技. All rights reserved.
//

#import "YBranchLayer.h"

@interface YBranchLayer()<CAAnimationDelegate>
/**动画执行完毕的回调*/
@property(nonatomic,strong)animationDidFinished animationDidFinished;
/**圆点的半径*/
@property(nonatomic,assign)CGFloat radius;
@end

@implementation YBranchLayer

- (instancetype)initWithDirection:(YBranchLayerDirection)direction radius:(CGFloat)radius  duration:(CGFloat)duration  {
    if (self = [super init]) {
        [self setup];
        self.direction = direction;
        self.radius = radius;
        self.animduration = duration;
    }
    return self;
}

- (instancetype)init {
    if (self = [super init]) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setup];
}

- (void)setup {
    self.strokeStart = 0;
    self.strokeEnd = 1.0;
    self.lineWidth = 0.8f;
    self.radius = 4;
    self.animduration = 0.5f;
    self.strokeColor = [UIColor blackColor].CGColor;
    self.fillColor = [UIColor clearColor].CGColor;
    self.contentsScale = [UIScreen mainScreen].scale;
    self.direction = YBranchLayerDirectionRight;
}

/**
 开始绘制分支动画
 */
- (void)startAnimationDelay:(CGFloat)delay animationDidFinished:(animationDidFinished)animationDidFinished {
    
    //恢复初始状态
    self.strokeStart = 0.0;
    self.strokeEnd = 0.0;
    
    // 清空之前绘制的路径 并禁止layer的动画
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    //以下代码切记一定要放在begin 和 commit 之间 否则清空路径的时候会有动画
    [self removeAllAnimations];
    self.path = nil;
    self.fillColor =  [UIColor clearColor].CGColor;
    [CATransaction commit];

    
    //取消上一次的操作
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    
    //绘制分支路径
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:self.startPoint];
    [bezierPath addLineToPoint:self.midPoint];
    [bezierPath addLineToPoint:self.endPoint];

    //根据方向绘制圆
    if (self.direction == YBranchLayerDirectionRight) {
        [bezierPath addArcWithCenter:CGPointMake(self.endPoint.x+self.radius, self.endPoint.y) radius:self.radius startAngle:-M_PI endAngle:M_PI clockwise:YES];
    }else{
        [bezierPath addArcWithCenter:CGPointMake(self.endPoint.x-self.radius, self.endPoint.y) radius:self.radius startAngle:0 endAngle:M_PI*2 clockwise:YES];
    }
    //为了让达到最后的小圆填充效果 需要关闭路径
    [bezierPath addLineToPoint:self.midPoint];
    [bezierPath closePath];
    self.path = bezierPath.CGPath;
    
    //创建动画
    CABasicAnimation *strokeAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    strokeAnimation.fromValue = @0;
    strokeAnimation.toValue = @1;
    strokeAnimation.removedOnCompletion= NO;
    strokeAnimation.fillMode = kCAFillModeForwards;
    strokeAnimation.duration = self.animduration;
    strokeAnimation.delegate = self;
    strokeAnimation.beginTime = CACurrentMediaTime()+delay;
    [self addAnimation:strokeAnimation forKey:@"cashaplayer"];
    
    //延迟一点时间设置填充的颜色
    [self performSelector:@selector(setFillColor:) withObject:(id)[UIColor colorWithWhite:1.0 alpha:0.5].CGColor afterDelay:self.animduration*0.5];
    //保存回调
    self.animationDidFinished = animationDidFinished;
}

#pragma mark CAAnimationDelegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if (flag) {
        if (self.animationDidFinished) {
            self.animationDidFinished(self);
        }
    }
}


@end
