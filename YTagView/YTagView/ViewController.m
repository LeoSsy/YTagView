//
//  ViewController.m
//  YTagView
//
//  Created by shusy on 2017/12/14.
//  Copyright © 2017年 杭州爱卿科技. All rights reserved.
//

#import "ViewController.h"
#import "YCenterView.h"
#import "YBranchLayer.h"
#import "YTagView.h"

@interface ViewController ()
@property(nonatomic,strong)YTagView *tagView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    UIImageView *imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"123"]];
    [self.view addSubview:imageV];
    imageV.contentMode = UIViewContentModeScaleAspectFill;
    imageV.frame = self.view.bounds;

    _tagView = [[YTagView alloc] initWithFrame:CGRectMake(50, 100, 200, 200) showStyle:YTagViewShowStyleAllRight];
    [self.view addSubview:_tagView];
    _tagView.titles = @[@"sdfsf",@"回短发是非得失",@"abc"];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    [self.tagView showPoint:point];
    
}

@end
