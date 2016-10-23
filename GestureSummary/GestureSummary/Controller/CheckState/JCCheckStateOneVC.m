
//
//  JCCheckStateViewController.m
//  GestureSummary
//
//  Created by JCTrustYourself on 16/10/22.
//  Copyright © 2016年 JC. All rights reserved.
//

#import "JCCheckStateOneVC.h"
@interface JCCheckStateOneVC()<UITableViewDelegate,UITableViewDataSource>{
    NSInteger current;
}

/** tableView **/
@property(nonatomic,strong)UITableView *tableView;
/** 存储书本信息数组 **/
@property (nonatomic, strong)NSArray *freshBookInfoList;


@end

@implementation JCCheckStateOneVC



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
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0,self.view.bounds.size.width, self.view.bounds.size.height - 40) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:_tableView];
}


#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _freshBookInfoList.count;
}
/** 先定位到最后一行，若选中最后一行直接退出，否则用递归改变上次选中的状态，重新设置本次选中的状态。**/
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * Identifier = @"cell";
   UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:Identifier];
    }
    cell.textLabel.text = _freshBookInfoList[indexPath.row];
   /*  去掉多余的分割线 */
    [tableView setTableFooterView:[[UIView alloc]init]];
    /**
     *此处做修改
     */
    current = indexPath.row;
    NSLog(@"current->%ld",(long)current);
    return cell;
}

/**
 *以下方法做修改
 *
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"indexPath.row->%ld",indexPath.row);
       NSLog(@"indexPath.row.current->%ld",current);
    if(indexPath.row==current){
        
        return;
        
    }
    UITableViewCell*newCell = [tableView cellForRowAtIndexPath:indexPath];
    
    if(newCell.accessoryType==UITableViewCellAccessoryNone)
    {
        
        newCell.accessoryType=UITableViewCellAccessoryCheckmark;
        
        newCell.textLabel.textColor=[UIColor blueColor];
        
    }
    
    NSIndexPath*oldIndexPath =[NSIndexPath indexPathForRow:current inSection:0];
    UITableViewCell*oldCell = [tableView cellForRowAtIndexPath:oldIndexPath];
    
    if(oldCell.accessoryType==UITableViewCellAccessoryCheckmark)
    {
        
        oldCell.accessoryType=UITableViewCellAccessoryNone;
        
        oldCell.textLabel.textColor=[UIColor blackColor];
        
    }
    current=indexPath.row;
}

   
@end


