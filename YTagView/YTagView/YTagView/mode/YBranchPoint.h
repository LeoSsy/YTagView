//
//  YBranchPoint.h
//  layerAnimationDemo
//
//  Created by shusy on 2017/12/14.
//  Copyright © 2017年 杭州爱卿科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YHeader.h"

@interface YBranchPoint : NSObject
/**分支的路径方向*/
@property(nonatomic,assign)YBranchLayerDirection direction;
/**开始的点*/
@property(nonatomic,assign)CGPoint startPoint;
/**移动的到的距离点位置*/
@property(nonatomic,assign)CGPoint midPoint;
/**结束的位置*/
@property(nonatomic,assign)CGPoint endPoint;
/**
 快速创建方法
 @param direction 方向
 @param startPoint 开始点
 @param midPoint 中间点
 @param endPoint 结束点
 */
+ (YBranchPoint*)branchWithDirection:(YBranchLayerDirection)direction start:(CGPoint)startPoint mid:(CGPoint)midPoint end:(CGPoint)endPoint;
@end
