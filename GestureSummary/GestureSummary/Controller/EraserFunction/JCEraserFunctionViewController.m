//
//  JCEraserFunctionViewController.m
//  GestureSummary
//
//  Created by xuxingjun on 16/10/20.
//  Copyright © 2016年 JC. All rights reserved.
//

#import "JCEraserFunctionViewController.h"
#import "CustomView.h"
@implementation JCEraserFunctionViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    CustomView *cusVC = [[CustomView alloc]initWithFrame:self.view.bounds];
    cusVC.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:cusVC];
}

@end
