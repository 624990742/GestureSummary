//
//  JCPanGestureViewController.m
//  GestureSummary
//
//  Created by xuxingjun on 16/10/15.
//  Copyright © 2016年 JC. All rights reserved.
//

#import "JCPanGestureViewController.h"
#import "Masonry.h"
@interface JCPanGestureViewController()

/** 图片 */
@property(nonatomic,strong)UIImageView *imageView;
@end

@implementation JCPanGestureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self imageViewLayout];
    //创建拖拽手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    [self.view addGestureRecognizer:pan];
}

-(void)pan:(UIPanGestureRecognizer*)sender {
    //相对于 参数的坐标系来说
    //    CGPoint location = [sender locationInView:self.view];
    //相对于 起点的 位置
    CGPoint translation = [sender translationInView:self.view];
    
    CGPoint center = self.imageView.center;
    center.x += translation.x;
    center.y += translation.y;
    
    self.imageView.center = center;
    
    //每次用tarnslastion后归零
    //将本次移动距离清除掉，那么下次属性中保存的距离就是相对于本次位置的距离
    [sender setTranslation:CGPointZero inView:self.view];
    
}
-(UIImageView *)imageViewLayout{
    if (!_imageView) {
        _imageView =[[UIImageView alloc]init];
        _imageView.image =[UIImage imageNamed:@"50d5a90eaef97_600x"];
        [self.view addSubview:_imageView];
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(self.view).dividedBy(3);
        }];
    }
    
    return _imageView;
}
@end
