//
//  JCLongPressGestureViewController.m
//  GestureSummary
//
//  Created by xuxingjun on 16/10/15.
//  Copyright © 2016年 JC. All rights reserved.
//

#import "JCLongPressGestureViewController.h"

@implementation JCLongPressGestureViewController
-(instancetype)init{
    self = [super init];
    if (self) {
        self.title = @"手势";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPress:)];
    //设置长按手势的最小间隔时间
    longPress.minimumPressDuration = 2;
    [self.view addGestureRecognizer:longPress];
}

-(void)longPress:(UILongPressGestureRecognizer*)sender {
    if (sender.state == UIGestureRecognizerStateBegan) {
        NSLog(@"Began");
    }else if (sender.state == UIGestureRecognizerStateChanged) {
        NSLog(@"Changed");
    }else if (sender.state == UIGestureRecognizerStateEnded){
        NSLog(@"Ended");
    }
}


@end
