//
//  JCTapGestureViewController.m
//  GestureSummary
//
//  Created by xuxingjun on 16/10/15.
//  Copyright © 2016年 JiaChen. All rights reserved.
//

#import "JCTapGestureViewController.h"

@implementation JCTapGestureViewController


-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.view.backgroundColor =[UIColor blueColor];
    [self tap];
}
-(void)tap{
    UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapEvent:)];
    //点几下响应手势 (快速)
    tap.numberOfTapsRequired = 1;
    //有几个触点
    tap.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:tap];
    
}
-(void)tapEvent:(UITapGestureRecognizer*)sender {
    NSLog(@"点中的位置 %@", NSStringFromCGPoint([sender locationInView:self.view]));
    NSLog(@"点击 手势响应");
}
@end






