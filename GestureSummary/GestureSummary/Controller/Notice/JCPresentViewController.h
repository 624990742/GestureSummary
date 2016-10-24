//
//  JCPresentViewController.h
//  GestureSummary
//
//  Created by JCTrustYourself on 2016/10/24.
//  Copyright © 2016年 JC. All rights reserved.
//

#import "JCBaseController.h"

@interface JCPresentViewController : JCBaseController
@property (strong, nonatomic) void(^ArebackData)(NSString *);

@end
