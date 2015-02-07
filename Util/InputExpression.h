//
//  InputExpression.h
//  RITTSearchPlatform
//
//  Created by wangjingtuan on 14-10-14.
//  Copyright (c) 2014年 RITT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InputExpression : NSObject

//判定输入汉字
+ (BOOL)isChinese:(NSString *)input;

//+ (BOOL)isInput:(NSString *)input;

//检测输入是否全是中文
+ (BOOL)checkNameChinese:(NSString *)input;

//检测输入是否包含中文
+ (BOOL)containsChinese:(NSString *)input;

//是否由“.”和数字组成，ipv4地址
+ (BOOL)inputIsIPv4:(NSString *)input;

//判断以域名后缀结尾
+ (BOOL)inputIsDomainEnds:(NSString *)input;

//是否由全英文字母组成
+ (BOOL)checkNameEnglish:(NSString *)input;

//是否包含英文，当不包括“.”
+ (BOOL)containsEnglish:(NSString *)input;

//域名且需要加后缀的情况
+ (BOOL)domainNeedEnd:(NSString *)input;

//输入是否正确
+ (BOOL)isPutRight:(NSString *)input;


@end
