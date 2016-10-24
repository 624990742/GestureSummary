//
//  JCOriginalViewController.m
//  GestureSummary
//
//  Created by JCTrustYourself on 2016/10/24.
//  Copyright © 2016年 JC. All rights reserved.
//

#import "JCOriginalViewController.h"
#import "JCPresentViewController.h"
@interface JCOriginalViewController (){
   /**  提示框  */
    UILabel * prompBtoxLabel;
    /**  展示数据  */
    UILabel * showLabel;
    /**  跳转button  */
    UIButton *jumpBtn;
    
}


@end

@implementation JCOriginalViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
/*  注册通知  */
[[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(show:) name:@"finish" object:nil];
}

-(void)show:(NSNotification *)sender{
    NSString *str = (NSString *)sender.object;
    showLabel.text = str;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self layoutPromptBox];
    [self layoutShowLabel];
    [self layoutjumpBtn];
}
  /* 展示数据 */
-(UILabel *)layoutShowLabel{
    if (!showLabel) {
    showLabel = [[UILabel alloc]init];
    showLabel.backgroundColor = [UIColor redColor];
    showLabel.textAlignment = NSTextAlignmentCenter;
    showLabel.text =@"展示数据";
    showLabel.font =[UIFont systemFontOfSize:18];
     [self.view addSubview:showLabel];
        [showLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(120, 50));
        }];
    }
    return prompBtoxLabel;
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
        
        [jumpBtn setTitle:@"goTOPresentVC" forState:UIControlStateNormal];
      
        [jumpBtn.layer setMasksToBounds:YES];
        [jumpBtn.layer setCornerRadius:10.0];
        jumpBtn.titleLabel.font =[UIFont systemFontOfSize:15];
        [jumpBtn addTarget:self action:@selector(jumpEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:jumpBtn];
    [jumpBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.and.right.equalTo(@-100);
        make.size.mas_equalTo(CGSizeMake(120, 50));
        }];
    }
    return jumpBtn;
}
-(void)jumpEvent{
    /**
     *方法一：利用通知传值
     **/
    /*JCBaseNavigationController *baseNav =[[JCBaseNavigationController alloc]initWithRootViewController:[[JCPresentViewController alloc]init]];
    [self presentViewController:baseNav animated:YES completion:nil];*/
    /**
     *方法二：利用block传值
     **/
    JCPresentViewController *av =[[JCPresentViewController alloc]init];
    av.ArebackData = ^(NSString *str){
        showLabel.text = str;
    };
    JCBaseNavigationController *nav =[[JCBaseNavigationController alloc]initWithRootViewController:av];
    
    [self presentViewController: nav animated:YES completion:nil];
    
    
}

@end







