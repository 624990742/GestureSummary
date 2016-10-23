//
//  JCBaseNavigationController.m
//  GestureSummary
//
//  Created by JCTrustYourself on 16/10/22.
//  Copyright © 2016年 JC. All rights reserved.
//

#import "JCBaseNavigationController.h"
#define kBarTintColor [UIColor colorWithRed:105/255.0 green:100/255.0 blue:120/255.0 alpha:1]
@implementation JCBaseNavigationController

-(void)viewDidLoad
{
    [self.navigationBar setBarStyle:UIBarStyleDefault];

    self.navigationBar.barTintColor = kBarTintColor;
    self.navigationBar.translucent = NO;
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor],NSFontAttributeName:[UIFont fontWithName:@"Helvetica" size:20]} ];
}





#pragma mark - 后加的
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    //如果push进来的不是第一个控制器
    if (self.childViewControllers.count > 0) {
        [self setupBackButton];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_backButton];
        viewController.hidesBottomBarWhenPushed = YES;
    }
    //这句super的push要放在后面，让viewController可以覆盖上面设置leftBarButtonItem
    [super pushViewController:viewController animated:YES];
}
//配置返回键
-(void)setupBackButton{
    _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_backButton setTitle:@"返回" forState:UIControlStateNormal];
    [_backButton setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
    [_backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [_backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    //        [backButton sizeToFit];
    _backButton.frame = CGRectMake(0, 0, 70, 30);
    // 让按钮的内容往左边偏移10
    _backButton.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    // 让按钮内部的所有内容左对齐
    _backButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
}


/**
 *  返回按钮
 */
-(void)back{
    
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"确定要放弃吗？" preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self popViewControllerAnimated:YES];
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [defaultAction setValue:[UIColor redColor] forKey:@"_titleTextColor"];
    /*修改title */
    NSMutableAttributedString *alertTitleStr = [[NSMutableAttributedString alloc] initWithString:@"提示"];
    [alertTitleStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:23] range:NSMakeRange(0, 2)];
    [alertTitleStr addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, 2)];
    [alertController setValue:alertTitleStr forKey:@"attributedTitle"];
    /*message*/
    NSMutableAttributedString *alertMessageStr = [[NSMutableAttributedString alloc] initWithString:@"确定要放弃编辑吗？"];
    [alertMessageStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:18] range:NSMakeRange(0, 9)];
    [alertMessageStr addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, 9)];
    [alertController setValue:alertMessageStr forKey:@"attributedMessage"];
    
    
    
    
    [alertController addAction:defaultAction];
    [alertController addAction:cancelAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
    
}


@end
