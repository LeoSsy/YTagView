//
//  YCenterView.m
//  layerAnimationDemo
//
//  Created by shusy on 2017/12/13.
//  Copyright © 2017年 杭州爱卿科技. All rights reserved.
//

#import "YCenterView.h"
#import "YFocusLayer.h"

@interface YCenterView()
@property(nonatomic,strong)UIButton *button;
@property(nonatomic,strong)YFocusLayer *focusLayer ;

@end

@implementation YCenterView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setup];
}

- (void)setup {
    [self.layer addSublayer:self.focusLayer];
    [self addSubview:self.button];
}

- (void)startAnimation {
    [self.focusLayer startAnimation];
}
- (void)stopAnimation {
    [self.focusLayer stopAnimation];
}

- (UIButton *)button {
    if (!_button) {
        _button = [[UIButton alloc] init];
        [_button setImage:[UIImage imageNamed:@"tag-center"] forState:UIControlStateNormal];
    }
    return _button;
}

- (YFocusLayer *)focusLayer {
    if (!_focusLayer) {
        _focusLayer = [[YFocusLayer alloc] init];
        _focusLayer.opacityFromValue = 0.35;
    }
    return _focusLayer;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.button.frame = self.bounds;
    self.focusLayer.position = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
}


@end
