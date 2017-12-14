//
//  YBranchTextView.m
//  layerAnimationDemo
//
//  Created by shusy on 2017/12/14.
//  Copyright © 2017年 杭州爱卿科技. All rights reserved.
//

#import "YBranchTextView.h"

@interface YBranchTextView()
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UIImageView *arrowImageV;
@end

@implementation YBranchTextView

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
    [self addSubview:self.arrowImageV];
    [self addSubview:self.titleLabel];
    self.duration = 0.2;
}

- (void)showPoint:(CGPoint)point direction:(YBranchLayerDirection)direction {
    [self.titleLabel sizeToFit];
    CGFloat width = CGRectGetWidth(self.titleLabel.bounds) + 10;
    CGFloat height = 25;
    //计算自身的frame
    CGRect frame = CGRectZero;
    CGFloat margin = 10;
    if (direction == YBranchLayerDirectionRight) { //向右边
        frame = CGRectMake(point.x + margin, point.y-(height*0.5), width, height);
    }else{
        frame = CGRectMake(point.x - width- margin, point.y-(height*0.5), width, height);
    }
    //设置底部图片视图
    NSString *imageName = (direction == YBranchLayerDirectionRight ? @"tag-background-right" : @"tag-background-left");
    self.arrowImageV.image = [[UIImage imageNamed:imageName] stretchableImageWithLeftCapWidth:10 topCapHeight:10];
    self.frame = frame;
    self.arrowImageV.frame = self.bounds;
    //设置标题居中
    self.titleLabel.center = CGPointMake(self.frame.size.width*0.5, self.frame.size.height*0.5);
    //渐变显示出来
    self.alpha = 0.0f;
    [UIView animateWithDuration:self.duration delay:0.f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.alpha = 1.0f;
    } completion:nil];
}

- (void)setTitle:(NSString *)title {
    self.titleLabel.text = title;
}

- (void)hide {
    self.alpha = 0.f;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"测试文本";
        _titleLabel.font = [UIFont systemFontOfSize:11];
        _titleLabel.textColor = [UIColor whiteColor];
    }
    return _titleLabel;
}

- (UIImageView *)arrowImageV {
    if (!_arrowImageV) {
        _arrowImageV = [[UIImageView alloc] init];
    }
    return _arrowImageV;
}


@end
