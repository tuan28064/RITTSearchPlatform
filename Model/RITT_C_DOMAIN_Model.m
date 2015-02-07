//
//  RITT_C_DOMAIN_Model.m
//  RITTSearchPlatform
//
//  Created by wangjingtuan on 14-9-11.
//  Copyright (c) 2014年 RITT. All rights reserved.
//

#import "RITT_C_DOMAIN_Model.h"
#import "FMResultSet.h"

@implementation RITT_C_DOMAIN_Model

@synthesize ID;
@synthesize DOMAIN_NAME;
@synthesize REGISTRANT;
@synthesize ORE_NAME;
@synthesize REG_TIME;
@synthesize UPDATE_TIME;
@synthesize DOMAIN_STATUS;
@synthesize NAME_SERVER;

- (void)dealloc
{
    [ID release], ID = nil;
    [DOMAIN_NAME release], DOMAIN_NAME = nil;
    [REGISTRANT release], REGISTRANT = nil;
    [ORE_NAME release], ORE_NAME = nil;
    [REG_TIME release], REG_TIME = nil;
    [UPDATE_TIME release], UPDATE_TIME = nil;
    [DOMAIN_STATUS release], DOMAIN_STATUS = nil;
    [NAME_SERVER release], NAME_SERVER = nil;
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
        
        if ([resultSet stringForColumn:kDOMAIN_NAME]) {
            DOMAIN_NAME = [[resultSet stringForColumn:kDOMAIN_NAME] retain];
        }
        
        if ([resultSet stringForColumn:kREGISTRANT]) {
            REGISTRANT = [[resultSet stringForColumn:kREGISTRANT] retain];
        }
        
        if ([resultSet stringForColumn:kORE_NAME]) {
            ORE_NAME = [[resultSet stringForColumn:kORE_NAME] retain];
        }
        
        if ([resultSet stringForColumn:kREG_TIME]) {
            REG_TIME = [[resultSet stringForColumn:kREG_TIME] retain];
        }
        
        if ([resultSet stringForColumn:kUPDATE_TIME]) {
            UPDATE_TIME = [[resultSet stringForColumn:kUPDATE_TIME] retain];
        }
        
        if ([resultSet stringForColumn:kDOMAIN_STATUS]) {
            DOMAIN_STATUS = [[resultSet stringForColumn:kDOMAIN_STATUS] retain];
        }
        
        if ([resultSet stringForColumn:kNAME_SERVER]) {
            NAME_SERVER = [[resultSet stringForColumn:kNAME_SERVER] retain];
        }
    }
    
    return self;
}

@end
