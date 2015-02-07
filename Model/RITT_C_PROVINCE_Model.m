//
//  RITT_C_PROVINCE_Model.m
//  RITTSearchPlatform
//
//  Created by wangjingtuan on 14-9-11.
//  Copyright (c) 2014年 RITT. All rights reserved.
//

#import "RITT_C_PROVINCE_Model.h"
#import "FMResultSet.h"

@implementation RITT_C_PROVINCE_Model

@synthesize _ID;
@synthesize MME_EID;
@synthesize CUS_NAME;

- (void)dealloc
{
    [_ID release], _ID = nil;
    [MME_EID release], MME_EID = nil;
    [CUS_NAME release], CUS_NAME = nil;
    [super dealloc];
}

- (id)init
{
    if (self = [super init]) {
        
    }
    
    return self;
}

- (id)initWithResultSet:(FMResultSet *)resultSet
{
    if (self = [super init]) {
        if ([resultSet stringForColumn:k_ID]) {
            _ID = [[resultSet stringForColumn:k_ID] retain];
        }
        
        if ([resultSet stringForColumn:kMME_EID]) {
            MME_EID = [[resultSet stringForColumn:kMME_EID] retain];
        }
        
        if ([resultSet stringForColumn:kCUS_NAME]) {
            CUS_NAME = [[resultSet stringForColumn:kCUS_NAME] retain];
        }
    }
    
    return self;
}

@end
