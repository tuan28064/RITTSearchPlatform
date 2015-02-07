//
//  AlertView.m
//  RITTSearchPlatform
//
//  Created by wangjingtuan on 14/10/18.
//  Copyright (c) 2014年 RITT. All rights reserved.
//

#import "AlertView.h"

@implementation AlertView

#pragma mark - MBProgressHUD信息显示
+ (void)showMBProgressHUDWithMessage:(NSString *)message OffsetX:(float)x OffsetY:(float)y
{
    UIWindow  *window = [[UIApplication sharedApplication].windows objectAtIndex:0];
    MBProgressHUD  *HUD = [[MBProgressHUD alloc]initWithWindow:window];
    if (x!=0.0||y!=0.0) {
        CGRect frame = HUD.frame;
        if (x!=0.0) frame.origin.x = x;
        if (y!=0.0) frame.origin.y = y;
        HUD.frame = frame;
    }
    HUD.tag = kMBProgressHUDTag;
    HUD.labelText = message;
    HUD.labelFont=[UIFont systemFontOfSize:12];
    HUD.mode = MBProgressHUDModeCustomView;
    [window addSubview:HUD];
    [HUD show:YES];
    [HUD release];
}

#pragma mark - 更新MBProgressHUD信息显示
+ (void)updateMBProgressHUDWithMessage:(NSString *)message
{
    UIWindow  *window = [[UIApplication sharedApplication].windows objectAtIndex:0];
    MBProgressHUD  *HUD = (MBProgressHUD *)[window viewWithTag:kMBProgressHUDTag];
    HUD.labelText = message;
}

#pragma mark - MBProgressHUD隐藏
+ (void)hideMBProgressHUD
{
    UIWindow  *window = [[UIApplication sharedApplication].windows objectAtIndex:0];
    MBProgressHUD  *HUD = (MBProgressHUD *)[window viewWithTag:kMBProgressHUDTag];
    if (HUD) {
        [HUD hide:YES];
        [HUD removeFromSuperview];
    }
}

@end
