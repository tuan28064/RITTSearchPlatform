//
//  RITT_C_IPINFO_Model.m
//  RITTSearchPlatform
//
//  Created by wangjingtuan on 14-9-11.
//  Copyright (c) 2014年 RITT. All rights reserved.
//

#import "RITT_C_IPINFO_Model.h"
#import "FMResultSet.h"

@implementation RITT_C_IPINFO_Model

@synthesize _ID;
@synthesize P_ID;
@synthesize FROM_IP;
@synthesize TO_IP;
@synthesize IP_SECT;
@synthesize MANAGE_CUS;
@synthesize ADDRESS_STATUS;
@synthesize CUSTOMER;
@synthesize USE_LOC;
@synthesize USE_TYPE;
@synthesize DATA_FROM;
@synthesize CONTACTPERSON;
@synthesize CONTACTPHONE;
@synthesize ALLOC_DATE;
@synthesize NET_NAME;
@synthesize CHANGE_DATE;
@synthesize AS_CODE;

- (void)dealloc
{
    [_ID release], _ID = nil;
    [P_ID release], P_ID = nil;
    [FROM_IP release], FROM_IP = nil;
    [TO_IP release], TO_IP = nil;
    [IP_SECT release], IP_SECT = nil;
    [MANAGE_CUS release], MANAGE_CUS = nil;
    [ADDRESS_STATUS release], ADDRESS_STATUS = nil;
    [CUSTOMER release], CUSTOMER = nil;
    [USE_TYPE release], USE_TYPE = nil;
    [USE_LOC release], USE_LOC = nil;
    [DATA_FROM release], DATA_FROM = nil;
    [CONTACTPHONE release], CONTACTPHONE = nil;
    [CONTACTPERSON release], CONTACTPERSON = nil;
    [ALLOC_DATE release], ALLOC_DATE = nil;
    [NET_NAME release], NET_NAME = nil;
    [CHANGE_DATE release], CHANGE_DATE = nil;
    [AS_CODE release], AS_CODE = nil;
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
        
        if ([resultSet stringForColumn:kP_ID]) {
            P_ID = [[resultSet stringForColumn:kP_ID] retain];
        }
        
        if ([resultSet stringForColumn:kFROM_IP]) {
            FROM_IP = [[resultSet stringForColumn:kFROM_IP] retain];
        }
        
        if ([resultSet stringForColumn:kTO_IP]) {
            TO_IP = [[resultSet stringForColumn:kTO_IP] retain];
        }
        
        if ([resultSet stringForColumn:kIP_SECT]) {
            IP_SECT = [[resultSet stringForColumn:kIP_SECT] retain];
        }
        
        if ([resultSet stringForColumn:kMANAGE_CUS]) {
            MANAGE_CUS = [[resultSet stringForColumn:kMANAGE_CUS] retain];
        }
        
        if ([resultSet stringForColumn:kADDRESS_STATUS]) {
            ADDRESS_STATUS = [[resultSet stringForColumn:kADDRESS_STATUS] retain];
        }
        
        if ([resultSet stringForColumn:kCUSTOMER]) {
            CUSTOMER = [[resultSet stringForColumn:kCUSTOMER] retain];
        }
        
        if ([resultSet stringForColumn:kUSE_LOC]) {
            USE_LOC = [[resultSet stringForColumn:kUSE_LOC] retain];
        }
        
        if ([resultSet stringForColumn:kUSE_TYPE]) {
            USE_TYPE = [[resultSet stringForColumn:kUSE_TYPE] retain];
        }
        
        if ([resultSet stringForColumn:kDATA_FROM]) {
            DATA_FROM = [[resultSet stringForColumn:kDATA_FROM] retain];
        }
        
        if ([resultSet stringForColumn:kCONTACTPERSON]) {
            CONTACTPERSON = [[resultSet stringForColumn:kCONTACTPERSON] retain];
        }
        
        if ([resultSet stringForColumn:kCONTACTPHONE]) {
            CONTACTPHONE = [[resultSet stringForColumn:kCONTACTPHONE] retain];
        }
        
        if ([resultSet stringForColumn:kALLOC_DATE]) {
            ALLOC_DATE = [[resultSet stringForColumn:kALLOC_DATE] retain];
        }
        
        if ([resultSet stringForColumn:kNET_NAME]) {
            NET_NAME = [[resultSet stringForColumn:kNET_NAME] retain];
        }
        
        if ([resultSet stringForColumn:kCHANGE_DATE]) {
            CHANGE_DATE = [[resultSet stringForColumn:kCHANGE_DATE] retain];
        }
        
        if ([resultSet stringForColumn:kAS_CODE]) {
            AS_CODE = [[resultSet stringForColumn:kAS_CODE] retain];
        }
    }
    return self;
}

@end
