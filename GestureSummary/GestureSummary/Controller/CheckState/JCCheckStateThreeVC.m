//
//  JCCheckStateThreeVC.m
//  GestureSummary
//
//  Created by JCTrustYourself on 2016/10/23.
//  Copyright © 2016年 JC. All rights reserved.
//

#import "JCCheckStateThreeVC.h"

@interface JCCheckStateThreeVC ()<UITableViewDelegate,UITableViewDataSource>{
    NSInteger current;
}
/** tableView **/
@property(nonatomic,strong)UITableView *tableView;
/** 存储书本信息数组 **/
@property (nonatomic, strong)NSArray *freshBookInfoList;

@end

@implementation JCCheckStateThreeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _freshBookInfoList = @[@"你好",@"我不好",@"开心就好",@"不开心也没办法"];
    [self createShowView];
       
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
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * Identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:Identifier];
    }
    cell.textLabel.text = _freshBookInfoList[indexPath.row];
    /*  去掉多余的分割线 */
    [tableView setTableFooterView:[[UIView alloc]init]];
//    NSStringFromCGRect(cell.frame);
//    cell.selectedBackgroundView.backgroundColor = [UIColor blueColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
    current=indexPath.row;
    
    [self.tableView reloadData];
    
    
}


- (UITableViewCellAccessoryType)tableView:(UITableView*)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath*)indexPath
{
    if(current==indexPath.row)
    {
        return UITableViewCellAccessoryCheckmark;
    }
    else
    {
        return UITableViewCellAccessoryNone;
    }
}

@end
