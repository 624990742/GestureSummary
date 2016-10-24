
//
//  JCSummaryTableVC.m
//  GestureSummary
//
//  Created by JCTrustYourself on 16/10/22.
//  Copyright © 2016年 JC. All rights reserved.
//

#import "JCSummaryTableVC.h"
#import "JCGestureListTableViewController.h"
#import "JCChangeSearchPlaceholderViewController.h"
#import "JCCheckStateOneVC.h"
#import "JCEraserFunctionViewController.h"
#import "JCShowCheckmarkTableVC.h"
#import "JCOriginalViewController.h"

static NSString * const GestureIdentifier = @"GestureList";
@interface JCSummaryTableVC ()

@property (nonatomic, strong) NSArray *
AllGestures;
@end

@implementation JCSummaryTableVC

-(instancetype)init{
    
    self = [super init];
    if (!self) return nil;
    
    self.AllGestures =@[[[JCGestureListTableViewController alloc]init],[[JCChangeSearchPlaceholderViewController alloc]initWithTitle:@"更改搜索框占位符居左"],[[JCEraserFunctionViewController alloc]initWithTitle:@"橡皮擦功能"],[[JCCheckStateOneVC alloc]initWithTitle:@"选中cell的状态"],[[JCShowCheckMarkTableVC alloc]initWithTitle:@"单选显示对勾的方法"],[[JCOriginalViewController alloc]initWithTitle:@"通知与block传值的区别"]];
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:GestureIdentifier];
}

#pragma mark - TableviewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.AllGestures.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *viewController = self.AllGestures[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:GestureIdentifier forIndexPath:indexPath];
    cell.textLabel.text = viewController.title;
    
    return cell;
}
#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *viewController = self.AllGestures[indexPath.row];
    [self.navigationController pushViewController:viewController animated:YES];
}
@end
