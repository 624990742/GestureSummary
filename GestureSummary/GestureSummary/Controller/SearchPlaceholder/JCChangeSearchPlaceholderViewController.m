//
//  JCChangeSearchPlaceholderViewController.m
//  GestureSummary
//
//  Created by xuxingjun on 16/10/20.
//  Copyright © 2016年 JC. All rights reserved.
//

#import "JCChangeSearchPlaceholderViewController.h"
#import "UISearchBar+JCSearchBarPlaceholder.h"
#import "Masonry.h"
#define kCorlorValue [UIColor colorWithRed:246/255.0 green:249/255.0 blue:252/255.0 alpha:1]

@interface JCChangeSearchPlaceholderViewController()

/** 默认搜索框Placeholder是居中的 */
@property(nonatomic,strong)UISearchBar *defaultSearchBar;
/** 改变后搜索框Placeholder是居左的 */
@property(nonatomic,strong)UISearchBar *changeSearchBar;
/** 提示框 */
@property(nonatomic,strong)UILabel *promptLabel;

@end
@implementation JCChangeSearchPlaceholderViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    [self.view setBackgroundColor:kCorlorValue];
    [self defaultSearchBarControl];
    [self swipeGestureEvent];
    [self changeSearchBarControl];
    [self labelLayout];
}
-(void)labelLayout{
    
    _promptLabel = [[UILabel alloc]init];
    _promptLabel.text = @"手指上下滑动键盘关闭";
    _promptLabel.textAlignment = NSTextAlignmentCenter;
    _promptLabel.textColor =[UIColor greenColor];
    _promptLabel.backgroundColor = [UIColor blueColor];
    [self.view addSubview:_promptLabel];
    [_promptLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_changeSearchBar.mas_bottom).offset(60);
        make.centerX.equalTo(self.view.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(200, 40));
        
    }];
}
- (void)defaultSearchBarControl
{
    _defaultSearchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width,60)];
    _defaultSearchBar.exclusiveTouch = YES;
    [_defaultSearchBar setBackgroundColor:kCorlorValue];
    _defaultSearchBar.searchBarStyle =UISearchBarStyleMinimal;
    [_defaultSearchBar setSearchFieldBackgroundImage:[UIImage imageNamed:@"search.png"] forState:UIControlStateNormal];
    [_defaultSearchBar setPlaceholder:@"默认占位符居中的搜索框"];
    [self.view addSubview:_defaultSearchBar];
}
-(void)changeSearchBarControl{
    _changeSearchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 50, self.view.bounds.size.width,60)];
    _changeSearchBar.exclusiveTouch = YES;
    [_changeSearchBar setBackgroundColor:kCorlorValue];
    _changeSearchBar.searchBarStyle =UISearchBarStyleMinimal;
    [_changeSearchBar setSearchFieldBackgroundImage:[UIImage imageNamed:@"search.png"] forState:UIControlStateNormal];
    [_changeSearchBar changeLeftPlaceholder:@"更改后的占位符居左的搜索框"];

    [self.view addSubview:_changeSearchBar];
}


-(void)swipeGestureEvent{
    //轻扫
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipe:)];
    //左右能上下进行或操作，但是上下不响应，只响应左右，所以这样做是没有意义的
    swipe.direction = UISwipeGestureRecognizerDirectionUp | UISwipeGestureRecognizerDirectionDown;
    [self.view addGestureRecognizer:swipe];
    
}

-(void)swipe:(UISwipeGestureRecognizer*)sender {
    
    [self.view endEditing:YES];
}




@end
