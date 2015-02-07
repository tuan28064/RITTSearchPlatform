//
//  AlertView.h
//  RITTSearchPlatform
//
//  Created by wangjingtuan on 14/10/18.
//  Copyright (c) 2014年 RITT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"

@interface AlertView : NSObject

//显示提示语
+ (void)showMBProgressHUDWithMessage:(NSString *)message OffsetX:(float)x OffsetY:(float)y;

//更新提示语
+ (void)updateMBProgressHUDWithMessage:(NSString *)message;

//隐藏提示语
+ (void)hideMBProgressHUD;

@end
