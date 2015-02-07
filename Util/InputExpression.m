//
//  InputExpression.m
//  RITTSearchPlatform
//
//  Created by wangjingtuan on 14-10-14.
//  Copyright (c) 2014年 RITT. All rights reserved.
//

#import "InputExpression.h"
#import "RegExCategories.h"

@implementation InputExpression

#pragma mark - 判定输入汉字
+ (BOOL)isChinese:(NSString *)input
{
    if ([input isMatch:RX(@"[/u4e00-/u9fff]")]) {
        return true;
    }
    return false;
}

#pragma mark - isInput
- (BOOL)isInput:(NSString *)input
{
    for (int i = 0; i < input.length; i++) {
        NSString *c = [input substringWithRange:NSMakeRange(i, 1)];
        if ([@"1234567890" rangeOfString:c].location != NSNotFound || [@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" rangeOfString:c].location != NSNotFound) {
            return true;
        }
    }
    return false;
    
}

#pragma mark - 检测输入是否全是中文
+ (BOOL)checkNameChinese:(NSString *)input
{
    return [self isChinese:input];
}

#pragma mark - 包括中文
+ (BOOL)containsChinese:(NSString *)input
{
    BOOL res = false;
    for (int i = 0; i < input.length; i++) {
        if ([self isChinese:[input substringWithRange:NSMakeRange(i, 1)]]) {
            res = true;
            break;
        }
    }
    return res;
}

#pragma mark - 是否由“.”和数字组成，ipv4地址
+ (BOOL)inputIsIPv4:(NSString *)input
{
    BOOL res = true;
    
    for (int i = 0; i < input.length; i++) {
        NSString *c = [input substringWithRange:NSMakeRange(i, 1)];
        if ([@"1234567890." rangeOfString:c].location == NSNotFound) {
            res = false;
            break;
        }
    }
    if ([input rangeOfString:@"."].location == NSNotFound) {
        res = false;
    }
    return res;
}

#pragma mark - 判断以域名后缀结尾
+ (BOOL)inputIsDomainEnds:(NSString *)input
{
    BOOL res = false;
    if ([input hasSuffix:@".com"] || [input hasSuffix:@".net"] || [input hasSuffix:@".org"] || [input hasSuffix:@".edu"] || [input hasSuffix:@".gov"] || [input hasSuffix:@".int"] || [input hasSuffix:@".mil"] || [input hasSuffix:@".cn"]) {
        res = true;
    }
    return res;
}

#pragma mark - 是否由全英文字母组成
+ (BOOL)checkNameEnglish:(NSString *)input
{
    BOOL res = true;
    for (int i = 0; i < input.length; i++) {
        NSString *c = [input substringWithRange:NSMakeRange(i, 1)];
        if ([@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLNMOPQRSTUVWXYZ" rangeOfString:c].location == NSNotFound) {
            res = false;
            break;
        }
    }
    return res;
}

#pragma mark - 是否包含英文，但不包括“.”
+ (BOOL)containsEnglish:(NSString *)input
{
    BOOL res = false;
    for (int i = 0; i < input.length; i++) {
        NSString *c = [input substringWithRange:NSMakeRange(i, 1)];
        if ([@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLNMOPQRSTUVWXYZ" rangeOfString:c].location != NSNotFound) {
            res = true;
            break;
        }
    }
    if ([input rangeOfString:@"."].location != NSNotFound) {
        res = false;
    }
    return res;
}

#pragma mark - 域名且需要加后缀的情况
+ (BOOL)domainNeedEnd:(NSString *)input
{
    BOOL res = false;
    NSString *aString  = [input stringByReplacingOccurrencesOfString:@"." withString:@""];
    if ([self containsEnglish:aString] || [self containsChinese:aString]) {
        res = true;
    }
    if ([input rangeOfString:@"."].location == NSNotFound) {
        res = false;
    }
    return res;
}

#pragma mark - 输入是否正确
+ (BOOL)isPutRight:(NSString *)input
{
    BOOL res = false;
    if ([self isChinese:input]) {
        res = true;
    } else {
        for (int i = 0; i < input.length; i++) {
            NSString *c = [input substringWithRange:NSMakeRange(i, 1)];
            if ([@"1234567890" rangeOfString:c].location != NSNotFound || [@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ.:" rangeOfString:c].location != NSNotFound) {
                    res = true;
                    break;
            }
            
        }

    }
    return res;
}


@end
