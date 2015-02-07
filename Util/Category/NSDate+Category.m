//
//  NSDate+Category.m
//  RITTSearchPlatform
//
//  Created by wangjingtuan on 14-10-15.
//  Copyright (c) 2014年 RITT. All rights reserved.
//

#import "NSDate+Category.h"

@implementation NSDate (Category)

+ (BOOL)isDateExpire:(NSString *)date
{
    NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc]init]autorelease];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *currentDate = [NSDate date];
    NSDate *compDate = [dateFormatter dateFromString:date];

    NSComparisonResult result = [currentDate compare:compDate];
    if (result == NSOrderedAscending) {
        return NO;
    } else if (result == NSOrderedDescending) {
        return YES;
    } else if (result == NSOrderedSame) {
        return NO;
    }
    return NO;
}

@end
