//
//  JCBaseController.h
//  GestureSummary
//
//  Created by xuxingjun on 16/10/18.
//  Copyright © 2016年 JC. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kWeakObject(obj) __weak __typeof(obj) weakObject = obj;
#define kIOSVersion ((float)[[[UIDevice currentDevice] systemVersion] doubleValue])

@interface JCBaseController : UIViewController
- (instancetype)initWithTitle:(NSString *)title;
@end
