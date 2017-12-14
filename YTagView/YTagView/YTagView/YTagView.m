//
//  YTagView.m
//  layerAnimationDemo
//
//  Created by shusy on 2017/12/13.
//  Copyright © 2017年 杭州爱卿科技. All rights reserved.
//

#import "YTagView.h"
#import "YCenterView.h"
#import "YBranchLayer.h"
#import "YBranchTextView.h"
#import "YHeader.h"

@interface YTagView()
/**显示的样式*/
@property(nonatomic,assign)YTagViewShowStyle showStyle;
@property(nonatomic,strong)YCenterView *centerView;
@property(nonatomic,strong)YBranchLayer *bottombranchLayer;
@property(nonatomic,strong)YBranchLayer *topbranchLayer;
@property(nonatomic,strong)YBranchLayer *midbranchLayer;
@property(nonatomic,strong)YBranchTextView *topTextView;
@property(nonatomic,strong)YBranchTextView *bottomTextView;
@property(nonatomic,strong)YBranchTextView *midTextView;
@property(nonatomic,strong)NSMutableArray *points;
@end

@implementation YTagView

- (YBranchLayer *)bottombranchLayer {
    if (!_bottombranchLayer) {
        _bottombranchLayer = [[YBranchLayer alloc] initWithDirection:YBranchLayerDirectionRight radius:4 duration:2];
    }
    return _bottombranchLayer;
}

- (YBranchLayer *)topbranchLayer {
    if (!_topbranchLayer) {
        _topbranchLayer = [[YBranchLayer alloc] initWithDirection:YBranchLayerDirectionRight radius:4 duration:2];
    }
    return _topbranchLayer;
}

- (YBranchLayer *)midbranchLayer {
    if (!_midbranchLayer) {
        _midbranchLayer = [[YBranchLayer alloc] initWithDirection:YBranchLayerDirectionLeft radius:4 duration:2];
    }
    return _midbranchLayer;
}

- (YBranchTextView *)topTextView {
    if (!_topTextView) {
        _topTextView = [[YBranchTextView alloc] init];
    }
    return _topTextView;
}

- (YBranchTextView *)bottomTextView {
    if (!_bottomTextView) {
        _bottomTextView = [[YBranchTextView alloc] init];
    }
    return _bottomTextView;
}

- (YBranchTextView *)midTextView {
    if (!_midTextView) {
        _midTextView = [[YBranchTextView alloc] init];
    }
    return _midTextView;
}

- (YCenterView *)centerView {
    if (!_centerView) {
        _centerView = [[YCenterView alloc] init];
        _centerView.frame = CGRectMake(0, 0, 12, 12);
        _centerView.alpha = 0.f;
    }
    return _centerView;
}

- (instancetype)initWithFrame:(CGRect)frame showStyle:(YTagViewShowStyle)showStyle {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
        self.showStyle = showStyle;
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setup];
}

- (void)setup {
    self.backgroundColor = [UIColor clearColor];
    [self.layer addSublayer:self.bottombranchLayer];
    [self.layer addSublayer:self.topbranchLayer];
    [self.layer addSublayer:self.midbranchLayer];
    [self addSubview:self.centerView];
    [self addSubview:self.topTextView];
    [self addSubview:self.bottomTextView];
    [self addSubview:self.midTextView];
}

- (void)setTitles:(NSArray *)titles {
    _titles = titles;
    if (titles == nil || titles.count == 0) { return;}
    [self.topTextView setTitle:titles.firstObject];
    [self.bottomTextView setTitle:titles.lastObject];
    if (titles.count-1 > 1) {
        [self.midTextView setTitle:titles[1]];
    }else{
        [self.midTextView setTitle:@"测试标题"];
    }
}

- (void)setDuration:(CGFloat)duration {
    _duration = duration;
    self.topbranchLayer.animduration = duration;
    self.midbranchLayer.animduration = duration;
    self.bottombranchLayer.animduration = duration;
}

- (void)showPoint:(CGPoint)point {
    
    //设置当前的视图的center为用户点击的位置
    self.center = point;
    //重置状态
    self.centerView.alpha = 1.0f;
    [self.centerView stopAnimation];
    [self.topTextView hide];
    [self.bottomTextView hide];
    [self.midTextView hide];
    
    //设置动画视图的位置居中
    self.centerView.center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    
    //设置分支显示的点
    [self setBranchPoints];
    
    //绘制路径动画的
    [self showTextViewWithView:self.topTextView layer:self.topbranchLayer];
    [self showTextViewWithView:self.midTextView layer:self.midbranchLayer];
    [self showTextViewWithView:self.bottomTextView layer:self.bottombranchLayer];
}

- (void)setBranchPoints{
    switch (self.showStyle) {
        case YTagViewShowStyleAllLeft: {
            [self setBranchLayer:self.topbranchLayer branchPoint:self.points[3]];
            [self setBranchLayer:self.midbranchLayer branchPoint:self.points[2]];
            [self setBranchLayer:self.bottombranchLayer branchPoint:self.points[4]];
            }
            break;
        case YTagViewShowStyleAllRight:{
            [self setBranchLayer:self.topbranchLayer branchPoint:self.points[1]];
            [self setBranchLayer:self.midbranchLayer branchPoint:self.points[5]];
            [self setBranchLayer:self.bottombranchLayer branchPoint:self.points[0]];
           }
            break;
        case YTagViewShowStyleLeft:{
            [self setBranchLayer:self.topbranchLayer branchPoint:self.points[0]];
            [self setBranchLayer:self.midbranchLayer branchPoint:self.points[2]];
            [self setBranchLayer:self.bottombranchLayer branchPoint:self.points[1]];
            }
            break;
        case YTagViewShowStyleRight:{
            [self setBranchLayer:self.topbranchLayer branchPoint:self.points[3]];
            [self setBranchLayer:self.midbranchLayer branchPoint:self.points[5]];
            [self setBranchLayer:self.bottombranchLayer branchPoint:self.points[4]];
            }
            break;
    }
}

- (void)setBranchLayer:(YBranchLayer*)branchLayer branchPoint:(YBranchPoint*)branchPoint{
    [self setBranchLayer:branchLayer startPoint:branchPoint.startPoint midPoint:branchPoint.midPoint endPoint:branchPoint.endPoint direction:branchPoint.direction];
}

- (void)setBranchLayer:(YBranchLayer*)branchLayer  startPoint:(CGPoint)startPoint midPoint:(CGPoint)midPoint endPoint:(CGPoint)endPoint direction:(YBranchLayerDirection)direction{
    branchLayer.startPoint = startPoint;
    branchLayer.midPoint = midPoint;
    branchLayer.endPoint = endPoint;
    branchLayer.direction = direction;
}

- (void)showTextViewWithView:(YBranchTextView*)branchTextView layer:(YBranchLayer*)layer {
    __weak typeof(self) weakSelf = self;
    if (layer == self.topbranchLayer) {
        [layer startAnimationDelay:0.0 animationDidFinished:^(YBranchLayer *layer) {
            [branchTextView showPoint:layer.endPoint direction:layer.direction];
            [weakSelf.centerView startAnimation];
        }];
    }else{
        [layer startAnimationDelay:0.0 animationDidFinished:^(YBranchLayer *layer) {
            [branchTextView showPoint:layer.endPoint direction:layer.direction];
        }];
    }
}

- (NSMutableArray *)points {
    if (!_points) {
        _points = [NSMutableArray array];
        CGPoint branchLayerCenter = self.centerView.center;
         //========中间分支显示在右===================
        //底部的分支位置  0
        [_points addObject:[YBranchPoint branchWithDirection:YBranchLayerDirectionRight start:branchLayerCenter mid:CGPointMake(branchLayerCenter.x+30, branchLayerCenter.y+35) end:CGPointMake(branchLayerCenter.x+50, branchLayerCenter.y+35)]];
        // 顶部的分支位置 1
        [_points addObject:[YBranchPoint branchWithDirection:YBranchLayerDirectionRight start:branchLayerCenter mid:CGPointMake(branchLayerCenter.x+30, branchLayerCenter.y-35) end:CGPointMake(branchLayerCenter.x+50, branchLayerCenter.y-35)]];
        //中间的分支位置 2
        [_points addObject:[YBranchPoint branchWithDirection:YBranchLayerDirectionLeft start:branchLayerCenter mid:CGPointMake(branchLayerCenter.x-50, branchLayerCenter.y) end:CGPointMake(branchLayerCenter.x-50, branchLayerCenter.y)]];
        
        //========中间分支显示在左===================
        //中间分支显示在右边 底部的分支位置  3
        [_points addObject:[YBranchPoint branchWithDirection:YBranchLayerDirectionLeft start:branchLayerCenter mid:CGPointMake(branchLayerCenter.x-30, branchLayerCenter.y-35) end:CGPointMake(branchLayerCenter.x-50, branchLayerCenter.y-35)]];
        //中间分支显示在右边 顶部的分支位置 4
        [_points addObject:[YBranchPoint branchWithDirection:YBranchLayerDirectionLeft start:branchLayerCenter mid:CGPointMake(branchLayerCenter.x-30, branchLayerCenter.y+35) end:CGPointMake(branchLayerCenter.x-50, branchLayerCenter.y+35)]];
        //中间分支显示在左边 中间的分支位置 5
        [_points addObject:[YBranchPoint branchWithDirection:YBranchLayerDirectionRight start:branchLayerCenter mid:CGPointMake(branchLayerCenter.x+50, branchLayerCenter.y) end:CGPointMake(branchLayerCenter.x+50, branchLayerCenter.y)]];
    }
    return _points;
}

@end
