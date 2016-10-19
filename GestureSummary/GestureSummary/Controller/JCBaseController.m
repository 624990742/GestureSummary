//
//  JCBaseController.m
//  GestureSummary
//
//  Created by xuxingjun on 16/10/18.
//  Copyright © 2016年 JC. All rights reserved.
//

#import "JCBaseController.h"

@implementation JCBaseController
- (instancetype)initWithTitle:(NSString *)title {
    if (self = [super init]) {
        self.title = title;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (kIOSVersion >= 7.0) {
        self.automaticallyAdjustsScrollViewInsets = NO;
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    self.view.backgroundColor = [UIColor whiteColor];
}

@end
