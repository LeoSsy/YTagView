//
//  YBranchPoint.m
//  layerAnimationDemo
//
//  Created by shusy on 2017/12/14.
//  Copyright © 2017年 杭州爱卿科技. All rights reserved.
//

#import "YBranchPoint.h"

@implementation YBranchPoint

+ (YBranchPoint*)branchWithDirection:(YBranchLayerDirection)direction start:(CGPoint)startPoint mid:(CGPoint)midPoint end:(CGPoint)endPoint {
    YBranchPoint *branchPoint = [[YBranchPoint alloc] initWithDirection:direction start:startPoint mid:midPoint end:endPoint];
    return branchPoint;
}

- (instancetype)initWithDirection:(YBranchLayerDirection)direction start:(CGPoint)startPoint mid:(CGPoint)midPoint end:(CGPoint)endPoint {
    if (self = [super init]) {
        self.direction =direction;
        self.startPoint = startPoint;
        self.midPoint = midPoint;
        self.endPoint = endPoint;
    }
    return self;
}
@end
