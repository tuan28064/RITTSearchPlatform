//
//  RITT_C_CODE_Model.m
//  RITTSearchPlatform
//
//  Created by wangjingtuan on 14-9-11.
//  Copyright (c) 2014年 RITT. All rights reserved.
//

#import "RITT_C_CODE_Model.h"
#import "FMResultSet.h"

@implementation RITT_C_CODE_Model

@synthesize _ID;
@synthesize MME_EID;
@synthesize CODE;
@synthesize CUS_NAME;
@synthesize EXPIRETIME;
@synthesize MANAGEDEPT_EID;
@synthesize STATUS;
@synthesize LOC_NAME;

- (void)dealloc
{
    [_ID release], _ID = nil;
    [MME_EID release], MME_EID = nil;
    [CODE release], CODE = nil;
    [CUS_NAME release], CUS_NAME = nil;
    [EXPIRETIME release], EXPIRETIME = nil;
    [MANAGEDEPT_EID release], MANAGEDEPT_EID = nil;
    [STATUS release], STATUS = nil;
    [LOC_NAME release], LOC_NAME = nil;
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
        
        if ([resultSet stringForColumn:kCODE]) {
            CODE = [[resultSet stringForColumn:kCODE] retain];
        }
        
        if ([resultSet stringForColumn:kCUS_NAME]) {
            CUS_NAME = [[resultSet stringForColumn:kCUS_NAME] retain];
        }
        
        if ([resultSet stringForColumn:kEXPIRETIME]) {
            EXPIRETIME = [[resultSet stringForColumn:kEXPIRETIME] retain];
        }
        
        if ([resultSet stringForColumn:kMANAGEDEPT_EID]) {
            MANAGEDEPT_EID = [[resultSet stringForColumn:kMANAGEDEPT_EID] retain];
        }
        
        if ([resultSet stringForColumn:kSTATUS]) {
            STATUS = [[resultSet stringForColumn:kSTATUS] retain];
        }
        
        if ([resultSet stringForColumn:kLOC_NAME]) {
            LOC_NAME = [[resultSet stringForColumn:kLOC_NAME] retain];
        }
    }
    
    return self;
}


@end
