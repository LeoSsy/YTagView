//
//  YTagView.h
//  layerAnimationDemo
//
//  Created by shusy on 2017/12/13.
//  Copyright © 2017年 杭州爱卿科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YHeader.h"

@interface YTagView : UIView

/**
 初始化方法
 @param frame frame
 @param showStyle 显示样式 详见 YTagViewShowStyle
 @return YTagView
 */
- (instancetype)initWithFrame:(CGRect)frame showStyle:(YTagViewShowStyle)showStyle;

/**显示的标题*/
@property(nonatomic,strong)NSArray *titles;

/**动画时间*/
@property(nonatomic,assign)CGFloat duration;

/**
 显示到指定位置
 @param point 显示的位置
 */
- (void)showPoint:(CGPoint)point;

@end
