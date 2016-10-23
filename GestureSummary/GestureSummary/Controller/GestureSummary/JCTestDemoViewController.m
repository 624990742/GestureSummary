//
//  JCTestDemoViewController.m
//  GestureSummary
//
//  Created by xuxingjun on 16/10/19.
//  Copyright © 2016年 JC. All rights reserved.
//

#import "JCTestDemoViewController.h"
#import "Masonry.h"
@interface JCTestDemoViewController() <UIGestureRecognizerDelegate>
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)UIPinchGestureRecognizer *pinchGR;
@property(nonatomic,strong)UIRotationGestureRecognizer *RotationGR;
@end
@implementation JCTestDemoViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    //打开用户交互
    self.imageView.userInteractionEnabled = YES;
    //给手势添加代理  是为了多个手势 可以同时相应， 希望哪个手势同时相应，就给这个手势添加个代理
    self.pinchGR.delegate = self;
    self.RotationGR.delegate = self;
    [self layoutImageView];
    [self allGestures];

}
-(void)layoutImageView{
    _imageView = [[UIImageView alloc]init];
    [_imageView setImage:[UIImage imageNamed:@"50d5a90eaef97_600x"]];
    [self.view  addSubview:_imageView];
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.equalTo(self.view).dividedBy(4);
    }];

}
-(void)allGestures{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapEvent:)];
    UIPanGestureRecognizer *pan =[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pannEvent:)];
     UIPinchGestureRecognizer *pinch =[[ UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinEvent:)];
     UIRotationGestureRecognizer *rotation =[[ UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(rotationEvent:)];
    [self.view addGestureRecognizer:tap];
    [self.view addGestureRecognizer:pinch];
    [self.view addGestureRecognizer:rotation];
    [self.view addGestureRecognizer:pan];
}
//旋转  旋转变形
-(void)rotationEvent:(UIRotationGestureRecognizer *)sender{
    self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, sender.rotation);
    sender.rotation = 0;
}
//拖拽  平移变形
-(void)pannEvent:(UIPanGestureRecognizer *)sender{
    //获取 绝对位置 相对于 view 的左上角
    //    sender locationInView:<#(nullable UIView *)#>
    //是相对于 手势 起的 位置
    CGPoint translation = [sender translationInView:self.imageView];
    
    //变化是在自己的坐标系下计算的距离，那么手势获取时的坐标系和我变化的坐标系应该是统一
    //变化  在一个基础上进行平移
    self.imageView.transform = CGAffineTransformTranslate(self.imageView.transform, translation.x, translation.y);
    
    //translation 清零 把之前的拖住的距离全部清除掉
    [sender setTranslation:CGPointZero inView:self.imageView];

}

//点击
-(void)tapEvent:(UITapGestureRecognizer *)sender{
    //取消所有的变化
    self.imageView.transform = CGAffineTransformIdentity;
}
//捏合  缩放变形
-(void)pinEvent:(UIPinchGestureRecognizer *)sender{
    self.imageView.transform = CGAffineTransformScale(self.imageView.transform, sender.scale, sender.scale);
    sender.scale = 1;

}
//默认不能响应多个手势同时触发，如果需要同时触发，可以使用代理
//希望哪些手势共存就需要给这个手势添加代理
//所有手势共有父类，使用父类的代理就可以
#pragma mark 手势的代理方法
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

@end

























