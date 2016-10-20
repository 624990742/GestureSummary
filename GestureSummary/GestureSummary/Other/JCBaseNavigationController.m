//
//  JCBaseNavigationController.m
//  GestureSummary
//
//  Created by xuxingjun on 16/10/20.
//  Copyright © 2016年 JC. All rights reserved.
//

#import "JCBaseNavigationController.h"
#define TitleFont [UIFont fontWithName:@"Helvetica" size:20]
@implementation JCBaseNavigationController
-(void)viewDidLoad
{
    [self.navigationBar setBarStyle:UIBarStyleDefault];
    self.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationBar.barTintColor = [UIColor colorWithRed:112/255.0 green:195/255.0 blue:151/255.0 alpha:1];
    self.navigationBar.translucent = NO;
    self.title = @"小总结";
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor],NSFontAttributeName:TitleFont} ];
}

@end
