//
//  YBranchLayer.h
//  layerAnimationDemo
//
//  Created by shusy on 2017/12/13.
//  Copyright © 2017年 杭州爱卿科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YHeader.h"

@class YBranchLayer;

/**动画执行完毕的回调*/
typedef void(^animationDidFinished)(YBranchLayer *layer);

@interface YBranchLayer : CAShapeLayer
/**动画时间*/
@property(nonatomic,assign)CGFloat animduration;
/**分支的路径方向*/
@property(nonatomic,assign)YBranchLayerDirection direction;
/**开始的点*/
@property(nonatomic,assign)CGPoint startPoint;
/**移动的到的距离点位置*/
@property(nonatomic,assign)CGPoint midPoint;
/**结束的位置*/
@property(nonatomic,assign)CGPoint endPoint;
/**
 初始化方法
 @param direction 路径绘制方向
 @param radius 最后的小圆点的半径
 @param duration 动画执行的时间
 @return YBranchLayer
 */
- (instancetype)initWithDirection:(YBranchLayerDirection)direction radius:(CGFloat)radius  duration:(CGFloat)duration;
/**
 开始绘制路径并执行动画
 @param delay 动画延迟执行时间
 @param animationDidFinished 动画执行完毕的回调
 */
- (void)startAnimationDelay:(CGFloat)delay animationDidFinished: (animationDidFinished) animationDidFinished;
@end
