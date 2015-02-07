//
//  RITT_C_PLAN_Model.m
//  RITTSearchPlatform
//
//  Created by wangjingtuan on 14-9-11.
//  Copyright (c) 2014年 RITT. All rights reserved.
//

#import "RITT_C_PLAN_Model.h"
#import "FMResultSet.h"

@implementation RITT_C_PLAN_Model

@synthesize MME_EID;
@synthesize CODESETDESCRIPTION;
@synthesize BITLENMANAGE;
@synthesize MANAGEDEPT_EID;

- (void)dealloc
{
    [MME_EID release], MME_EID = nil;
    [CODESETDESCRIPTION release], CODESETDESCRIPTION = nil;
    [BITLENMANAGE release], BITLENMANAGE = nil;
    [MANAGEDEPT_EID release], MANAGEDEPT_EID = nil;
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
        if ([resultSet stringForColumn:kMME_EID]) {
            MME_EID = [[resultSet stringForColumn:kMME_EID] retain];
        }
        
        if ([resultSet stringForColumn:kCODESETDESCRIPTION]) {
            CODESETDESCRIPTION = [[resultSet stringForColumn:kCODESETDESCRIPTION] retain];
        }
        
        if ([resultSet stringForColumn:kBITLENMANAGE]) {
            BITLENMANAGE = [[resultSet stringForColumn:kBITLENMANAGE] retain];
        }
        
        if ([resultSet stringForColumn:kMANAGEDEPT_EID]) {
            MANAGEDEPT_EID = [[resultSet stringForColumn:kMANAGEDEPT_EID] retain];
        }
    }
    
    return self;
}

@end
