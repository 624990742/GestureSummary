//
//  JCUISwipeGestureRecognizerViewController.m
//  GestureSummary
//
//  Created by xuxingjun on 16/10/19.
//  Copyright © 2016年 JC. All rights reserved.
//

#import "JCUISwipeGestureRecognizerViewController.h"
#import "Masonry.h"

@implementation JCUISwipeGestureRecognizerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self promptLabelLayout];
    [self inputTextFieldLayout];
    [self swipeGestureEvent];
  }
#pragma mark - 布局子控件
-(void)promptLabelLayout{
    UILabel *titleLabel =[[UILabel alloc]init];
    titleLabel.text = @"手指上下轻扫收起键盘";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self layoutSubControlWithSuperView:self.view subControl:titleLabel topValue:100 sizeValue:CGSizeMake(200, 40)];
}
-(void)inputTextFieldLayout{
    UITextField *testField =[[UITextField alloc]init];
    testField.layer.borderColor = [[UIColor blueColor]CGColor];
    testField.layer.borderWidth = 2;
    testField.placeholder = @"请点击这里";
    testField.textAlignment =NSTextAlignmentCenter;
    [self layoutSubControlWithSuperView:self.view subControl:testField topValue:150 sizeValue:CGSizeMake(200, 40)];
}


/**
 *布局方法
 **/
-(void)layoutSubControlWithSuperView:(UIView *)superView subControl:(id)subControl topValue:(CGFloat)topValue sizeValue:(CGSize)size{
    [superView addSubview:subControl];
    [subControl mas_makeConstraints:^(MASConstraintMaker *make) {
    make.centerX.equalTo(superView);
    make.top.mas_equalTo(topValue);
    make.size.mas_equalTo(size);
    }];
    }
/**
 *轻扫手势
 **/
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
