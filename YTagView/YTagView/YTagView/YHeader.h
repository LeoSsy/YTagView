//
//  YHeader.h
//  layerAnimationDemo
//
//  Created by shusy on 2017/12/14.
//  Copyright © 2017年 杭州爱卿科技. All rights reserved.
//

#ifndef YHeader_h
#define YHeader_h


typedef enum : NSUInteger {
    YBranchLayerDirectionRight = 0 , //路径方向为右边
    YBranchLayerDirectionLeft //路径方向为作边边
} YBranchLayerDirection;

typedef NS_ENUM(NSInteger, YTagViewShowStyle) {
    YTagViewShowStyleAllLeft = 0,   //效果为 全部都往左边显示
    YTagViewShowStyleAllRight,  //效果为 全部都往右边显示
    YTagViewShowStyleLeft,    //效果为 中间的路径显示在左边
    YTagViewShowStyleRight,  //效果为 中间的路径显示在右边
};

#import "YBranchPoint.h"

#endif /* YHeader_h */
