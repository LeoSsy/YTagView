# YTagView

 一个作用在图片上面的标签视图 很多应用中有此效果。

示例程序：

###### 默认 YTagView 类显示效果如下

![MacDown Screenshot](./tagView.gif)


使用方式：

#### 1.直接调用显示方法

```objc
    _tagView = [[YTagView alloc] initWithFrame:CGRectMake(50, 100, 200, 200) showStyle:YTagViewShowStyleAllRight];
    _tagView.titles = @[@"sdfsf",@"回短发是非得失",@"abc"];
    [self.view addSubview:_tagView];
```

#### 在指定视图中添加tap手势 或者件套 touchbegin方法

```objc
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
        UITouch *touch = [touches anyObject];
        CGPoint point = [touch locationInView:self.view];
        [self.tagView showPoint:point];
    }
```

如果你在使用中遇到了什么问题，或者希望扩展其他功能，可以直接跟我联系。

更多功能敬请期待！ 
