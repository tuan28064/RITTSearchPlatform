//
//  RITT_C_DB_INFO_Model.m
//  RITTSearchPlatform
//
//  Created by wangjingtuan on 14-9-11.
//  Copyright (c) 2014年 RITT. All rights reserved.
//

#import "RITT_C_DB_INFO_Model.h"
#import "FMResultSet.h"

@implementation RITT_C_DB_INFO_Model

@synthesize ID;
@synthesize CODE_COUNT;
@synthesize IP_COUNT;
@synthesize DOMAIN_COUNT;

- (void)dealloc
{
    [ID release], ID = nil;
    [CODE_COUNT release], CODE_COUNT = nil;
    [IP_COUNT release], IP_COUNT = nil;
    [DOMAIN_COUNT release], DOMAIN_COUNT = nil;
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
        if ([resultSet stringForColumn:kID]) {
            ID = [[resultSet stringForColumn:kID] retain];
        }
        
        if ([resultSet stringForColumn:kCODE_COUNT]) {
            CODE_COUNT = [[resultSet stringForColumn:kCODE_COUNT] retain];
        }
        
        if ([resultSet stringForColumn:kIP_COUNT]) {
            IP_COUNT = [[resultSet stringForColumn:kIP_COUNT] retain];
        }
        
        if ([resultSet stringForColumn:kDOMAIN_COUNT]) {
            DOMAIN_COUNT = [[resultSet stringForColumn:kDOMAIN_COUNT] retain];
        }
    }
    
    return self;
}

@end
