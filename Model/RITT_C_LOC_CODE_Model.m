//
//  RITT_C_LOC_CODE_Model.m
//  RITTSearchPlatform
//
//  Created by wangjingtuan on 14-9-11.
//  Copyright (c) 2014年 RITT. All rights reserved.
//

#import "RITT_C_LOC_CODE_Model.h"
#import "FMResultSet.h"

@implementation RITT_C_LOC_CODE_Model

@synthesize _ID;
@synthesize PROVINCE;
@synthesize NAME;
@synthesize CODE;

- (void)dealloc
{
    [_ID release], _ID = nil;
    [PROVINCE release], PROVINCE = nil;
    [NAME release], NAME = nil;
//    [CODE release], CODE = nil;
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
        
        if ([resultSet stringForColumn:kPROVINCE]) {
            PROVINCE = [[resultSet stringForColumn:kPROVINCE] retain];
        }
        
        if ([resultSet stringForColumn:kNAME]) {
            NAME = [[resultSet stringForColumn:kNAME] retain];
        }
        
        if ([resultSet stringForColumn:kCODE]) {
            CODE = [[NSString stringWithFormat:@"0%@", [resultSet stringForColumn:kCODE]] retain];
        }
    }
    
    return self;
}

@end
