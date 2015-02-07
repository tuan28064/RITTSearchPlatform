//
//  UIDevice+Category.m
//  RITTSearchPlatform
//
//  Created by wangjingtuan on 14-9-28.
//  Copyright (c) 2014年 RITT. All rights reserved.
//

#import "UIDevice+Category.h"

@implementation UIDevice (Category)

- (float)floatOfSystemVersion
{
    return [[UIDevice currentDevice].systemVersion floatValue];
}

- (int)heightForStatusBar
{
    if ([[UIDevice currentDevice].systemVersion compare:@"7.0"] == NSOrderedDescending) {
        return 20;
    } else {
        return 0;
    }
}

- (BOOL)isGreaterThanIOS7
{
    if ([[UIDevice currentDevice].systemVersion compare:@"7.0"] == NSOrderedDescending) {
        return YES;
    } else {
        return NO;
    }
}

- (int)heightForScreen
{
    if ([UIScreen mainScreen].bounds.size.height == 568.0) {
        return 568;
    } else if ([UIScreen mainScreen].bounds.size.height == 480.0) {
        return 480;
    }
    return 480;
}

- (int)widthForScreen
{
    if ([UIScreen mainScreen].bounds.size.width == 320.0) {
        return 320;
    }
//    } else if ([UIScreen mainScreen].bounds.size.height == 480.0) {
//        return 480;
//    }
    return 320;
}

- (BOOL)isFourInchScreen
{
    if ([UIScreen mainScreen].bounds.size.height == 568.0) {
        return YES;
    } else if ([UIScreen mainScreen].bounds.size.height == 480.0) {
        return NO;
    }
    return NO;
}

@end
