//
//  JCPinchGestureViewController.m
//  GestureSummary
//
//  Created by xuxingjun on 16/10/15.
//  Copyright © 2016年 JC. All rights reserved.
//

#import "JCPinchGestureViewController.h"

@implementation JCPinchGestureViewController


-(instancetype)init{
    self = [super init];
    if (self) {
        self.title = @"捏合手势";
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor brownColor];
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinch:)];
    [self.view addGestureRecognizer:pinch];
}
-(void)pinch:(UIPinchGestureRecognizer*)sender {
    //捏合速率
    CGFloat velocity = sender.velocity;
    NSLog(@"velocity %.2f", velocity);
    //捏合的动作距离比例
    CGFloat scale = sender.scale;
    
    //输出 和 上次的比例
    NSLog(@"scale %.2f", scale);
    sender.scale = 1;
}


@end
