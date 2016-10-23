//
//  GestureListTableViewController.m
//  GestureSummary
//
//  Created by xuxingjun on 16/10/11.
//  Copyright © 2016年 JiaChen. All rights reserved.
//

#import "JCGestureListTableViewController.h"
#import "JCTapGestureViewController.h"
#import "JCRotationGestureViewController.h"
#import "JCPinchGestureViewController.h"
#import "JCPanGestureViewController.h"
#import "JCLongPressGestureViewController.h"
#import "JCUISwipeGestureRecognizerViewController.h"
#import "JCClickRotateDistortionViewController.h"
#import "JCTestDemoViewController.h"
#import "JCChangeSearchPlaceholderViewController.h"
#import "JCEraserFunctionViewController.h"
#import "JCCheckStateOneVC.h"
static NSString * const GestureIdentifier = @"GestureList";
@interface JCGestureListTableViewController ()

@property (nonatomic, strong) NSArray *
AllGestures;
@end

@implementation JCGestureListTableViewController

-(instancetype)init{
    
    self = [super init];
    if (!self) return nil;
    self.title = @"手势列表";
    self.AllGestures =@[[[JCTapGestureViewController alloc]initWithTitle:@"点击手势"],[[JCRotationGestureViewController alloc]initWithTitle:@"旋转手势"],[[JCPinchGestureViewController alloc]initWithTitle:@"捏合手势"],[[JCPanGestureViewController alloc]initWithTitle:@"托转手势"],[[JCLongPressGestureViewController alloc]initWithTitle:@"长按手势手势"],[[JCUISwipeGestureRecognizerViewController alloc]initWithTitle:@"轻扫手势"],[[JCClickRotateDistortionViewController alloc]initWithTitle:@"点击旋转变形"],[[JCTestDemoViewController alloc]initWithTitle:@"多个手势共存测试demo"]];
    
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
