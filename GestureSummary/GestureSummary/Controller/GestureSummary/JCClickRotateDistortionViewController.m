//
//  JCClickRotateDistortionViewController.m
//  GestureSummary
//
//  Created by xuxingjun on 16/10/19.
//  Copyright © 2016年 JC. All rights reserved.
//

#import "JCClickRotateDistortionViewController.h"
#import "Masonry.h"
@interface JCClickRotateDistortionViewController()
@property(nonatomic,strong)UIImageView *imageView;
@end

@implementation JCClickRotateDistortionViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    _imageView = [[UIImageView alloc]init];
    [_imageView setImage:[UIImage imageNamed:@"50d5a90eaef97_600x"]];
    [self.view  addSubview:_imageView];
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.center.equalTo(self.view);
    make.size.equalTo(self.view).dividedBy(4);
    }];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
  /*使用带make的函数运算数值时，
   都是基于没有变形前的那个基础状态*/
  //self.imageView.transform = CGAffineTransformMakeTranslation(50, 50);
    /*在每次变化的 transform 属性基础上，在继续移动*/
   //self.imageView.transform = CGAffineTransformTranslate(self.imageView.transform, 50, 50);
/**
 *旋转和缩放同时存在点击屏幕既旋转又缩放
 *如果是单个的话就只有旋转或者只有缩放
 **/
    /*旋转*/
    //self.imageView.transform = CGAffineTransformMakeRotation(M_PI_4);
    self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, M_PI_4);
    
    /*缩放*/
    //self.imageView.transform = CGAffineTransformMakeScale(1.3, 1.5);
    self.imageView.transform = CGAffineTransformScale(self.imageView.transform, 1.03, 1.05);
}


@end












