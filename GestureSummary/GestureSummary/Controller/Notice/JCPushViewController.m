//
//  JCPushViewController.m
//  GestureSummary
//
//  Created by JCTrustYourself on 2016/10/24.
//  Copyright © 2016年 JC. All rights reserved.
//

#import "JCPushViewController.h"

@interface JCPushViewController (){
    /**  提示框  */
    UILabel * prompBtoxLabel;
    /**  跳转button  */
    UIButton *jumpBtn;    
}


@end

@implementation JCPushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"push过来的VC";
    [self layoutPromptBox];
    [self layoutjumpBtn];
    
}

/* 布局提示框 */
-(UILabel *)layoutPromptBox{
    if (!prompBtoxLabel) {
        prompBtoxLabel = [[UILabel alloc]init];
        prompBtoxLabel.backgroundColor = [UIColor brownColor];
        prompBtoxLabel.textAlignment = NSTextAlignmentCenter;
        prompBtoxLabel.text =@"最初的控制器";
        prompBtoxLabel.font =[UIFont systemFontOfSize:18];
        [self.view addSubview:prompBtoxLabel];
        [prompBtoxLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.and.left.equalTo(@100);
            make.size.mas_equalTo(CGSizeMake(120, 50));
        }];
    }
    return prompBtoxLabel;
}

/* 跳转按钮 */
-(UIButton *)layoutjumpBtn{
    if (!jumpBtn) {
        jumpBtn = [UIButton buttonWithType:UIButtonTypeCustom];        jumpBtn.backgroundColor = [UIColor blueColor];
        jumpBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        [jumpBtn setTitle:@"dismissVC" forState:UIControlStateNormal];
        
        [jumpBtn.layer setMasksToBounds:YES];
        [jumpBtn.layer setCornerRadius:10.0];
        jumpBtn.titleLabel.font =[UIFont systemFontOfSize:15];
        [jumpBtn addTarget:self action:@selector(jumpEvent) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:jumpBtn];
        [jumpBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(@-100);
            make.bottom.equalTo(@-200);
            make.size.mas_equalTo(CGSizeMake(120, 50));
        }];
    }
    return jumpBtn;
}
-(void)jumpEvent{
    /**
     *方法一：利用通知传值
     **/
   /*
    NSString *str = @"通知传值🙂";
    [[NSNotificationCenter defaultCenter]postNotificationName:@"finish" object:str];*/
    /**
     *方法二：利用block传值
     **/
    self.BrebackData(@"我是回传过来的text");
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end




