//
//  JCRotationGestureViewController.m
//  GestureSummary
//
//  Created by xuxingjun on 16/10/15.
//  Copyright © 2016年 JC. All rights reserved.
//

#import "JCRotationGestureViewController.h"

@interface JCRotationGestureViewController ()

/** label */
@property(nonatomic,strong)UILabel *rotationLabel;
@property (nonatomic,unsafe_unretained)CGFloat rotationAngleInRadians;
@end

@implementation JCRotationGestureViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor redColor];
    [self creatLabel];
    [self rotationEvent];
}

-(void)creatLabel{
    self.rotationLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.rotationLabel.text = @"用两个手指点中旋转!";
    self.rotationLabel.font = [UIFont systemFontOfSize:16.0f];
    [self.rotationLabel sizeToFit];
    self.rotationLabel.center = self.view.center;
    [self.view addSubview:self.rotationLabel];
   }


-(void)rotationEvent{
    UIRotationGestureRecognizer *rotationGesture = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(rotation:)];
    
    [self.view addGestureRecognizer:rotationGesture];
}
-(void)rotation:(UIRotationGestureRecognizer*)sender {
    //获取旋转的弧度
    //NSLog(@"%.2f",sender.rotation);
    self.rotationLabel.transform = CGAffineTransformMakeRotation(self.rotationAngleInRadians + sender.rotation);
    //如果当前状态是结束状态
    if (sender.state == UIGestureRecognizerStateEnded) {
        self.rotationAngleInRadians += sender.rotation;
    }
}

@end
