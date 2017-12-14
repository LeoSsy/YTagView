//
//  YBranchTextView.h
//  layerAnimationDemo
//
//  Created by shusy on 2017/12/14.
//  Copyright © 2017年 杭州爱卿科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YHeader.h"

@interface YBranchTextView : UIView
/**
 显示到指定的位置
 @param point 显示位置
 @param direction 显示方向
 */
- (void)showPoint:(CGPoint)point direction:(YBranchLayerDirection)direction ;

/**
 设置显示的标题
 @param title 标题
 */
- (void)setTitle:(NSString*)title;

/**动画时间*/
@property(nonatomic,assign)CGFloat duration;

/**
 隐藏当前视图
 */
- (void)hide;
@end
