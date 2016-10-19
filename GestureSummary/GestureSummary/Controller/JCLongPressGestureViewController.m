//
//  JCLongPressGestureViewController.m
//  GestureSummary
//
//  Created by xuxingjun on 16/10/15.
//  Copyright © 2016年 JC. All rights reserved.
//

#import "JCLongPressGestureViewController.h"
#import "Masonry.h"
@implementation JCLongPressGestureViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *promptLabel =[[UILabel alloc]init];
    promptLabel.text = @"手指按住屏幕不放看控制台输出";
    [self.view addSubview:promptLabel];
    [promptLabel mas_makeConstraints:^(MASConstraintMaker *make) {
    make.center.equalTo(self.view);
    make.size.mas_equalTo(CGSizeMake(150, 30));
    }];
    
    
    
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
