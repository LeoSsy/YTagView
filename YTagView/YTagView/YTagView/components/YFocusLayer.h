//
//  YFocusLayer.h
//  layerAnimationDemo
//
//  Created by shusy on 2017/12/13.
//  Copyright © 2017年 杭州爱卿科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YFocusLayer : CAReplicatorLayer
/**初始的透明度*/
@property(nonatomic,assign)CGFloat opacityFromValue;
/**半径*/
@property(nonatomic,assign)CGFloat radius;
/**动画时间*/
@property(nonatomic,assign)CGFloat animDuration;
- (void)startAnimation;
- (void)stopAnimation;
@end
