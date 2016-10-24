//
//  JCShowCheckmarkTableVC.m
//  GestureSummary
//
//  Created by JCTrustYourself on 2016/10/23.
//  Copyright © 2016年 JC. All rights reserved.
//
/**
  *单选的实现方法来自该博客:
  *http://blog.sina.com.cn/s/blog_881ed85001017x56.html
  *向原作者致敬，小白的我只是一个代码的搬用工😊
  *****/
 
 
#import "JCShowCheckMarkTableVC.h"
#import "JCCheckStateOneVC.h"
#import "JCCheckStateTwoVC.h"
#import "JCCheckStateThreeVC.h"
@interface JCShowCheckMarkTableVC ()<UITableViewDelegate,UITableViewDataSource>
/* 所有✔️  */
@property (nonatomic, strong) NSArray *
AllShowCheckmark;

/** <#属性#> */
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation JCShowCheckMarkTableVC
static  NSString *ShowCheckMarkIdentifier = @"CheckMark";


-(instancetype)init{
    
    self = [super init];
    if (!self) return nil;
    self.title = @"显示单选(✔️)的方法";
    
   
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
     self.AllShowCheckmark = @[[[JCCheckStateOneVC alloc]initWithTitle:@"第一种方法"],[[JCCheckStateTwoVC  alloc]initWithTitle:@"第二种方法"],[[JCCheckStateThreeVC  alloc]initWithTitle:@"第三种方法"]];
    [self createShowView];
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:ShowCheckMarkIdentifier];
    
}
-(void)createShowView{
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0,self.view.bounds.size.width, self.view.bounds.size.height - 40) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

#pragma mark - TableviewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.AllShowCheckmark.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *viewController = self.AllShowCheckmark[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ShowCheckMarkIdentifier forIndexPath:indexPath];
    cell.textLabel.text = viewController.title;
    /*  去掉多余的分割线 */
    [tableView setTableFooterView:[[UIView alloc]init]];
    return cell;
}
#pragma mark - UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.row == 0) {
    JCCheckStateOneVC *firstShowCheckMarkVC =[[JCCheckStateOneVC alloc]initWithTitle:@"显示对勾(方法一)"];
    [self.navigationController pushViewController:firstShowCheckMarkVC animated:YES];
        
    }else if (indexPath.row == 1){
         JCCheckStateTwoVC   *secondShowCheckMarkVC =[[JCCheckStateTwoVC alloc]initWithTitle:@"显示对勾(方法二)"];
        [self.navigationController pushViewController:secondShowCheckMarkVC animated:YES];
    }else{
        JCCheckStateThreeVC  *threeShowCheckMarkVC =[[JCCheckStateThreeVC alloc]initWithTitle:@"显示对勾(方法三)"];
        [self.navigationController pushViewController:threeShowCheckMarkVC animated:YES];
   
    }
    
}
@end









