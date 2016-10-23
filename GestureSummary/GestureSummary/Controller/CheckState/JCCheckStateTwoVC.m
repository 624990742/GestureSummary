//
//  JCCheckStateTwoVC.m
//  GestureSummary
//
//  Created by JCTrustYourself on 2016/10/23.
//  Copyright © 2016年 JC. All rights reserved.
//

#import "JCCheckStateTwoVC.h"

@interface JCCheckStateTwoVC ()<UITableViewDelegate,UITableViewDataSource>{
    NSInteger current;
}

/** tableView **/

@property(nonatomic,strong)UITableView *tableView;
/** 存储书本信息数组 **/
@property (nonatomic, strong)NSArray *freshBookInfoList;
@end

@implementation JCCheckStateTwoVC



- (void)viewDidLoad {
    [super viewDidLoad];
  _freshBookInfoList = @[@"你好",@"我不好",@"开心就好",@"不开心也没办法"];
    [self createShowView];
    [self  tableViewCellState];
    
}

-(void)tableViewCellState{
    
}
#pragma mark - 创建表视图

-(void)createShowView{
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0,self.view.bounds.size.width, self.view.bounds.size.height - 40) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}


#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _freshBookInfoList.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * Identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:Identifier];
    }
    cell.textLabel.text = _freshBookInfoList[indexPath.row];
    /*  去掉多余的分割线 */
    [tableView setTableFooterView:[[UIView alloc]init]];
    return cell;
}
/**
  *在选中时先遍历整个可见单元格，
  *设置所有行的默认样式，
  *再设置选中的这行样式，
  *此方法不能取消单元格的选中
   **/
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *array = [tableView visibleCells];
    for (UITableViewCell *cell in array) {
        [cell setAccessoryType:UITableViewCellAccessoryNone];
        cell.textLabel.textColor=[UIColor blackColor];
        
    }
    UITableViewCell *cell=[self.tableView cellForRowAtIndexPath:indexPath];
    cell.textLabel.textColor=[UIColor blueColor];
    [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSIndexPath *index=[tableView indexPathForSelectedRow];
    
    if (index.row==indexPath.row&& index!=nil)
    {
        cell.backgroundColor=[UIColor colorWithRed:232.0/255.0 green:232.0/255.0 blue:232.0/255.0 alpha:1.0];
        cell.textLabel.textColor=[UIColor colorWithRed:0.0 green:206.0/255.0 blue:192.0/255.0 alpha:1.0];
    }
    else
    {
        cell.backgroundColor=[UIColor clearColor];
        cell.textLabel.textColor=[UIColor blackColor];
    }
    /*单元格是否相同需要用到比较方法*/
    NSIndexPath *indexxx=[tableView indexPathForSelectedRow];
    NSComparisonResult result=[indexPath compare:indexxx];
    NSLog(@"result->%ld",result);
}

@end
