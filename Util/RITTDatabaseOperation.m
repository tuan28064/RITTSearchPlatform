//
//  RITTDatabaseOperation.m
//  RITTSearchPlatform
//
//  Created by wangjingtuan on 14-9-10.
//  Copyright (c) 2014年 RITT. All rights reserved.
//

#import "RITTDatabaseOperation.h"
#import "FMDatabase.h"
#import "RITT_C_CODE_Model.h"
#import "RITT_C_PROVINCE_Model.h"
#import "RITT_C_LOC_CODE_Model.h"
#import "RITT_C_DB_INFO_Model.h"
#import "RITT_C_DOMAIN_Model.h"
#import "RITT_C_IPINFO_Model.h"

@interface RITTDatabaseOperation ()

@property (nonatomic, retain) FMDatabase *database;

@end

@implementation RITTDatabaseOperation

@synthesize database;

//初始化DB
- (id)init
{
    if (self = [super init]) {
        
    }
    
    return self;
}

//单例
+ (instancetype)sharedInstance
{
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc]init];
    });
    return sharedInstance;
}

#pragma mark - 返回所有黑名单号码信息C_CODE
- (NSMutableArray *)findAll
{
    NSString *dbPath = [[NSBundle mainBundle]pathForResource:kDBName ofType:@"db"];
    database = [FMDatabase databaseWithPath:dbPath];

    NSMutableArray *c_code_modelArray = [[[NSMutableArray alloc]init]autorelease];
    [database open];
    FMResultSet *rs = [database executeQuery:kSearchFindAll];
    while ([rs next]) {
        RITT_C_CODE_Model *c_code_model = [[RITT_C_CODE_Model alloc]init];
        c_code_model.CODE = [rs stringForColumn:kCODE];
        c_code_model.CUS_NAME = [rs stringForColumn:kCUS_NAME];
        [c_code_modelArray addObject:c_code_model];
        [c_code_model release];
    }
    [database close];
    return c_code_modelArray;
}

#pragma mark - 返回所有黑名单号码信息C_PROVINCE
- (NSMutableArray *)findProvinceAll
{
    NSString *dbPath = [[NSBundle mainBundle]pathForResource:kDBName ofType:@"db"];
    database = [FMDatabase databaseWithPath:dbPath];
    NSMutableArray *c_province_modelArray = [[[NSMutableArray alloc]init]autorelease];
    [database open];
    FMResultSet *rs = [database executeQuery:kSearchFindProvinceAll];
    while ([rs next]) {
        RITT_C_PROVINCE_Model *c_province_model = [[RITT_C_PROVINCE_Model alloc]initWithResultSet:rs];
//        c_province_model.MME_EID = [rs stringForColumn:kMME_EID];
//        c_province_model.CUS_NAME = [rs stringForColumn:kCUS_NAME];
        [c_province_modelArray addObject:c_province_model];
        [c_province_model release];
    }
    [database close];
    return c_province_modelArray;
}
#pragma mark - 分批获取数据库里面黑名单的信息
- (NSMutableArray *)findByPageWithMaxNumber:(int)maxNumber startIndex:(int)startIndex
{
    NSString *dbPath = [[NSBundle mainBundle]pathForResource:kDBName ofType:@"db"];
    database = [FMDatabase databaseWithPath:dbPath];
    NSMutableArray *c_code_modelArray = [[[NSMutableArray alloc]init]autorelease];
    [database open];
    FMResultSet *rs = [database executeQuery:[NSString stringWithFormat:kSearchFindByPage, maxNumber, startIndex]];
    while ([rs next]) {
        RITT_C_CODE_Model *c_code_model = [[RITT_C_CODE_Model alloc]init];
        c_code_model.CODE = [rs stringForColumn:kCODE];
        c_code_model.CUS_NAME = [rs stringForColumn:kCUS_NAME];
        c_code_model.EXPIRETIME = [rs stringForColumn:kEXPIRETIME];
        [c_code_modelArray addObject:c_code_model];
        [c_code_model release];
    }
    [database close];
    return c_code_modelArray;
}

#pragma mark - 分批获取数据库里面黑名单的信息
- (RITT_C_CODE_Model *)findByConWithCode:(NSString *)code
{
    NSString *dbPath = [[NSBundle mainBundle]pathForResource:kDBName ofType:@"db"];
    database = [FMDatabase databaseWithPath:dbPath];
    RITT_C_CODE_Model *c_code_model = nil;
    [database open];
    FMResultSet *rs = [database executeQuery:[NSString stringWithFormat:kSearchFindByCon, code]];
    while ([rs next]) {
        c_code_model = [[[RITT_C_CODE_Model alloc]initWithResultSet:rs]autorelease];
//        c_code_model.CODE = [rs stringForColumn:kCODE];
//        c_code_model.CUS_NAME = [rs stringForColumn:kCUS_NAME];
//        c_code_model.EXPIRETIME = [rs stringForColumn:kEXPIRETIME];
    }
    [database close];
    return c_code_model;
}

#pragma mark - 分批获取数据库里面黑名单的信息
- (NSMutableArray *)findByConditionWithCode:(NSString *)code
{
    NSString *dbPath = [[NSBundle mainBundle]pathForResource:kDBName ofType:@"db"];
    database = [FMDatabase databaseWithPath:dbPath];
    NSMutableArray *c_code_modelArray = [[[NSMutableArray alloc]init]autorelease];
    [database open];
    FMResultSet *rs = [database executeQuery:[NSString stringWithFormat:kSearchFindByCondition, code]];
    while ([rs next]) {
        RITT_C_CODE_Model *c_code_model = [[RITT_C_CODE_Model alloc]initWithResultSet:rs];
//        c_code_model.CODE = [rs stringForColumn:kCODE];
//        c_code_model.CUS_NAME = [rs stringForColumn:kCUS_NAME];
//        c_code_model.EXPIRETIME = [rs stringForColumn:kEXPIRETIME];
        [c_code_modelArray addObject:c_code_model];
        [c_code_model release];
    }
    [database close];
    return c_code_modelArray;
}

#pragma mark - 分批获取数据库里面黑名单的信息
- (NSMutableArray *)findByProConditionWithCode:(NSString *)code provinceMid:(NSString *)provinceMid
{
    NSString *dbPath = [[NSBundle mainBundle]pathForResource:kDBName ofType:@"db"];
    database = [FMDatabase databaseWithPath:dbPath];
    NSMutableArray *c_code_modelArray = [[[NSMutableArray alloc]init]autorelease];
    [database open];
    FMResultSet *rs = [database executeQuery:[NSString stringWithFormat:kSearchFindByProCondition, code, provinceMid]];
    while ([rs next]) {
        RITT_C_CODE_Model *c_code_model = [[RITT_C_CODE_Model alloc]init];
        c_code_model.CODE = [rs stringForColumn:kCODE];
        c_code_model.CUS_NAME = [rs stringForColumn:kCUS_NAME];
        c_code_model.EXPIRETIME = [rs stringForColumn:kEXPIRETIME];
        [c_code_modelArray addObject:c_code_model];
        [c_code_model release];
    }
    [database close];
    return c_code_modelArray;
}

#pragma mark - findByCODELOC
- (NSString *)findByCODELOCWithCode:(NSString *)code
{
    NSString *dbPath = [[NSBundle mainBundle]pathForResource:kDBName ofType:@"db"];
    database = [FMDatabase databaseWithPath:dbPath];
    [database open];
    FMResultSet *rs = [database executeQuery:[NSString stringWithFormat:kSearchFindByCODELOC, code]];
    NSString *name = [rs stringForColumn:kNAME];
    [database close];
    return name;
}

#pragma mark - findByCODE_A
- (NSMutableArray *)findByCODE_AWithCode:(NSString *)code
{
    
    NSString *dbPath = [[NSBundle mainBundle]pathForResource:kDBName ofType:@"db"];
    database = [FMDatabase databaseWithPath:dbPath];
    NSMutableArray *c_code_modelArray = [[[NSMutableArray alloc]init]autorelease];
    [database open];
    FMResultSet *rs = [database executeQuery:[NSString stringWithFormat:kSearchFindByCODE_A, code]];
    while ([rs next]) {
        RITT_C_CODE_Model *c_code_model = [[RITT_C_CODE_Model alloc]initWithResultSet:rs];
//        c_code_model._ID = [rs stringForColumn:k_ID];
//        c_code_model.CODE = [rs stringForColumn:kCODE];
//        c_code_model.MME_EID = [rs stringForColumn:kMME_EID];
//        c_code_model.EXPIRETIME = [rs stringForColumn:kEXPIRETIME];
//        c_code_model.STATUS = [rs stringForColumn:kSTATUS];
        if ([[rs stringForColumn:kSTATUS] isEqualToString:@"1"]) {
            c_code_model.CUS_NAME = [rs stringForColumn:kCUS_NAME];
            
        } else if ([[rs stringForColumn:kSTATUS] isEqualToString:@"2"]) {
            c_code_model.CUS_NAME = @" ";
        } else {
            c_code_model.CUS_NAME = @"";
        }
        [c_code_modelArray addObject:c_code_model];
        [c_code_model release];

    }
    [database close];
    return c_code_modelArray;
}
#pragma mark - findByCODE_B
- (NSMutableArray *)findByCODE_BWithCode:(NSString *)code
{
    NSString *dbPath = [[NSBundle mainBundle]pathForResource:kDBName ofType:@"db"];
    database = [FMDatabase databaseWithPath:dbPath];
    NSMutableArray *c_code_modelArray = [[[NSMutableArray alloc]init]autorelease];
    [database open];
    FMResultSet *rs = [database executeQuery:[NSString stringWithFormat:kSearchFindByCODE_B, code]];
    while ([rs next]) {
        RITT_C_CODE_Model *c_code_model = [[RITT_C_CODE_Model alloc]initWithResultSet:rs];
//        c_code_model._ID = [rs stringForColumn:k_ID];
//        c_code_model.CODE = [rs stringForColumn:kCODE];
//        c_code_model.MME_EID = [rs stringForColumn:kMME_EID];
//        c_code_model.EXPIRETIME = [rs stringForColumn:kEXPIRETIME];
//        c_code_model.STATUS = [rs stringForColumn:kSTATUS];
        if ([[rs stringForColumn:kSTATUS] isEqualToString:@"1"]) {
            c_code_model.CUS_NAME = [rs stringForColumn:kCUS_NAME];
        }
        [c_code_modelArray addObject:c_code_model];
        [c_code_model release];
    }
    [database close];
    return c_code_modelArray;
}

#pragma mark - findByCODE_C
- (NSMutableArray *)findByCODE_CWithCode:(NSString *)code
{
    NSString *dbPath = [[NSBundle mainBundle]pathForResource:kDBName ofType:@"db"];
    database = [FMDatabase databaseWithPath:dbPath];
    NSMutableArray *c_loc_code_modelArray = [[[NSMutableArray alloc]init]autorelease];
    if ([database open]) {
        FMResultSet *rs = [database executeQuery:[NSString stringWithFormat:kSearchFindByCODE_C, code]];
        while ([rs next]) {
            RITT_C_LOC_CODE_Model *c_loc_code_model = [[RITT_C_LOC_CODE_Model alloc]initWithResultSet:rs];
//            c_loc_code_model._ID = [rs stringForColumn:k_ID];
//            c_loc_code_model.PROVINCE = [rs stringForColumn:kPROVINCE];
//            c_loc_code_model.NAME = [rs stringForColumn:kNAME];
//            c_loc_code_model.CODE = [NSString stringWithFormat:@"0%@", [rs stringForColumn:kCODE]];
            [c_loc_code_modelArray addObject:c_loc_code_model];
            [c_loc_code_model release];
        }
        [database close];
    };
    return c_loc_code_modelArray;
}
#pragma mark - findByCODE_C2
- (NSMutableArray *)findByCODE_C2WithCode:(NSString *)code
{
    NSString *dbPath = [[NSBundle mainBundle]pathForResource:kDBName ofType:@"db"];
    database = [FMDatabase databaseWithPath:dbPath];
    NSMutableArray *c_loc_code_modelArray = [[[NSMutableArray alloc]init]autorelease];
    [database open];
    FMResultSet *rs = [database executeQuery:[NSString stringWithFormat:kSearchFindByCODE_C2, code, code]];
    while ([rs next]) {
        RITT_C_LOC_CODE_Model *c_loc_code_model = [[RITT_C_LOC_CODE_Model alloc]initWithResultSet:rs];
//        c_loc_code_model._ID = [rs stringForColumn:k_ID];
//        c_loc_code_model.PROVINCE = [rs stringForColumn:kPROVINCE];
//        c_loc_code_model.NAME = [rs stringForColumn:kNAME];
//        c_loc_code_model.CODE = [NSString stringWithFormat:@"0%@", [rs stringForColumn:kCODE]];
        [c_loc_code_modelArray addObject:c_loc_code_model];
        [c_loc_code_model release];
    }
    [database close];
    return c_loc_code_modelArray;
}
#pragma mark - findByCode_D
- (NSMutableArray *)findByCODE_DWithCode:(NSString *)code mid:(NSString *)mid
{
    NSString *dbPath = [[NSBundle mainBundle]pathForResource:kDBName ofType:@"db"];
    database = [FMDatabase databaseWithPath:dbPath];
    NSMutableArray *c_code_modelArray = [[[NSMutableArray alloc]init]autorelease];
    [database open];
    FMResultSet *rs = [database executeQuery:[NSString stringWithFormat:kSearchFindByCODE_D, code, mid]];
    while ([rs next]) {
        RITT_C_CODE_Model *c_code_model = [[RITT_C_CODE_Model alloc]initWithResultSet:rs];
//        c_code_model._ID = [rs stringForColumn:k_ID];
//        c_code_model.CODE = [rs stringForColumn:kCODE];
//        c_code_model.EXPIRETIME = [rs stringForColumn:kEXPIRETIME];
//        c_code_model.STATUS = [rs stringForColumn:kSTATUS];
//        c_code_model.MME_EID = [rs stringForColumn:kMME_EID];
        if ([[rs stringForColumn:kSTATUS] isEqualToString:@"1"]) {
            c_code_model.CUS_NAME = [rs stringForColumn:kCUS_NAME];
        }
        [c_code_modelArray addObject:c_code_model];
        [c_code_model release];
    }
    [database close];
    return c_code_modelArray;
}

#pragma mark - findByCode_E
- (NSMutableArray *)findByCODE_EWithCode:(NSString *)code mid:(NSString *)mid
{
    NSString *dbPath = [[NSBundle mainBundle]pathForResource:kDBName ofType:@"db"];
    database = [FMDatabase databaseWithPath:dbPath];
    NSMutableArray *c_code_modelArray = [[[NSMutableArray alloc]init]autorelease];
    [database open];
    FMResultSet *rs = [database executeQuery:[NSString stringWithFormat:kSearchFindByCODE_E, code, mid]];
    while ([rs next]) {
        RITT_C_CODE_Model *c_code_model = [[RITT_C_CODE_Model alloc]initWithResultSet:rs];
//        c_code_model._ID = [rs stringForColumn:k_ID];
//        c_code_model.CODE = [rs stringForColumn:kCODE];
//        c_code_model.EXPIRETIME = [rs stringForColumn:kEXPIRETIME];
//        c_code_model.STATUS = [rs stringForColumn:kSTATUS];
//        c_code_model.MME_EID = [rs stringForColumn:kMME_EID];
        if ([[rs stringForColumn:kSTATUS] isEqualToString:@"1"]) {
            c_code_model.CUS_NAME = [rs stringForColumn:kCUS_NAME];
        }
        [c_code_modelArray addObject:c_code_model];
        [c_code_model release];
    }
    [database close];
    return c_code_modelArray;
}
#pragma mark - findByCode_F
- (NSMutableArray *)findByCODE_FWithCode:(NSString *)code mid:(NSString *)mid
{
    NSString *dbPath = [[NSBundle mainBundle]pathForResource:kDBName ofType:@"db"];
    database = [FMDatabase databaseWithPath:dbPath];
    NSMutableArray *c_code_modelArray = [[[NSMutableArray alloc]init]autorelease];
    [database open];
    FMResultSet *rs = [database executeQuery:[NSString stringWithFormat:kSearchFindByCODE_F, code, mid]];
    while ([rs next]) {
        RITT_C_CODE_Model *c_code_model = [[RITT_C_CODE_Model alloc]initWithResultSet:rs];
//        c_code_model._ID = [rs stringForColumn:k_ID];
//        c_code_model.CODE = [rs stringForColumn:kCODE];
//        c_code_model.CUS_NAME = [rs stringForColumn:kCUS_NAME];
//        c_code_model.LOC_NAME = [rs stringForColumn:kLOC_NAME];
        [c_code_modelArray addObject:c_code_model];
        [c_code_model release];
    }
    [database close];
    return c_code_modelArray;
}

#pragma mark - findByCode_G
- (NSMutableArray *)findByCODE_GWithCode:(NSString *)code
{
    NSString *dbPath = [[NSBundle mainBundle]pathForResource:kDBName ofType:@"db"];
    database = [FMDatabase databaseWithPath:dbPath];
    NSMutableArray *c_code_modelArray = [[[NSMutableArray alloc]init]autorelease];
    [database open];
    FMResultSet *rs = [database executeQuery:[NSString stringWithFormat:kSearchFindByCODE_G, code]];
    while ([rs next]) {
        RITT_C_CODE_Model *c_code_model = [[RITT_C_CODE_Model alloc]initWithResultSet:rs];
//        c_code_model._ID = [rs stringForColumn:k_ID];
//        c_code_model.CODE = [rs stringForColumn:kCODE];
//        c_code_model.CUS_NAME = [rs stringForColumn:kCUS_NAME];
//        c_code_model.LOC_NAME = [rs stringForColumn:kLOC_NAME];
//        c_code_model.STATUS = [rs stringForColumn:kSTATUS];
        FMResultSet *rs2 = [database executeQuery:[NSString stringWithFormat:kSearchFindByCODE_G2, [rs stringForColumn:kMANAGEDEPT_EID]]];
        while ([rs2 next]) {
            c_code_model.MANAGEDEPT_EID = [rs2 stringForColumn:kCUS_NAME];
        }
        
        [c_code_modelArray addObject:c_code_model];
        [c_code_model release];
    }
    [database close];
    return c_code_modelArray;
}
#pragma mark - findByCode_all
- (NSMutableArray *)findByCODE_ALLWithCode:(NSString *)code
{
    NSString *dbPath = [[NSBundle mainBundle]pathForResource:kDBName ofType:@"db"];
    database = [FMDatabase databaseWithPath:dbPath];
    NSMutableArray *c_code_modelArray = [[[NSMutableArray alloc]init]autorelease];
    [database open];
    FMResultSet *rs = [database executeQuery:[NSString stringWithFormat:kSearchFindByCODE_ALL, code]];
    while ([rs next]) {
        RITT_C_CODE_Model *c_code_model = [[RITT_C_CODE_Model alloc]initWithResultSet:rs];
//        c_code_model._ID = [rs stringForColumn:k_ID];
//        c_code_model.CODE = [rs stringForColumn:kCODE];
//        c_code_model.MME_EID = [rs stringForColumn:kMME_EID];
//        c_code_model.EXPIRETIME = [rs stringForColumn:kEXPIRETIME];
//        c_code_model.STATUS = [rs stringForColumn:kSTATUS];
        if ([[rs stringForColumn:kSTATUS] isEqualToString:@"1"]) {
            c_code_model.CUS_NAME = [rs stringForColumn:kCUS_NAME];
        }
        [c_code_modelArray addObject:c_code_model];
        [c_code_model release];
    }
    [database close];
    return c_code_modelArray;
}

#pragma mark - findProvinceNameAll
- (NSMutableArray *)findProvinceNameAll
{
    NSString *dbPath = [[NSBundle mainBundle]pathForResource:kDBName ofType:@"db"];
    database = [FMDatabase databaseWithPath:dbPath];
    NSMutableArray *c_province_modelArray = [[[NSMutableArray alloc]init]autorelease];
    [database open];
    FMResultSet *rs = [database executeQuery:kSearchFindProvinceNameAll];
    while ([rs next]) {
        RITT_C_PROVINCE_Model *c_province_model = [[RITT_C_PROVINCE_Model alloc]init];
        c_province_model._ID = [rs stringForColumn:k_ID];
        c_province_model.MME_EID = [rs stringForColumn:kMME_EID];
        c_province_model.CUS_NAME = [rs stringForColumn:kCUS_NAME];
        [c_province_modelArray addObject:c_province_model];
        [c_province_model release];
    }
    [database close];
    return c_province_modelArray;
}
#pragma mark - getTotalCount
- (int)getTotalCount
{
    NSString *dbPath = [[NSBundle mainBundle]pathForResource:kDBName ofType:@"db"];
    database = [FMDatabase databaseWithPath:dbPath];
    [database open];
    FMResultSet *rs = [database executeQuery:kSearchTotalCount];
    int count = 0;
    while ([rs next]) {
        count++;
    }
    [database close];
    return count;
}
#pragma mark - findByLOC
- (NSString *)findByLOCWithCode:(NSString *)code
{
    NSString *dbPath = [[NSBundle mainBundle]pathForResource:kDBName ofType:@"db"];
    database = [FMDatabase databaseWithPath:dbPath];
    FMResultSet *rs = [database executeQuery:[NSString stringWithFormat:kSearchFindByLOC, code]];
    NSString *codeStr = [rs stringForColumn:kCODE];
    return codeStr;
}

#pragma mark - totalCountDB_Info
- (RITT_C_DB_INFO_Model *)totalCountDB_Info
{
    NSString *dbPath = [[NSBundle mainBundle]pathForResource:kDBName ofType:@"db"];
    database = [FMDatabase databaseWithPath:dbPath];
    RITT_C_DB_INFO_Model *c_db_info_model = [[[RITT_C_DB_INFO_Model alloc]init]autorelease];
    if ([database open]) {
        FMResultSet *rs = [database executeQuery:kSearchTotalCountDB_Info];
        while ([rs next]) {
            c_db_info_model.ID = [rs stringForColumn:kID];
            c_db_info_model.CODE_COUNT = [rs stringForColumn:kCODE_COUNT];
            c_db_info_model.DOMAIN_COUNT = [rs stringForColumn:kDOMAIN_COUNT];
            c_db_info_model.IP_COUNT = [rs stringForColumn:kIP_COUNT];
        }
        [database close];
    };
    
    return c_db_info_model;
}
#pragma mark - findDomainInfo
- (NSMutableArray *)findWithDomainInfo:(NSString *)domainInfo
{
    NSString *dbPath = [[NSBundle mainBundle]pathForResource:kDBName ofType:@"db"];
    database = [FMDatabase databaseWithPath:dbPath];
    NSMutableArray *c_domain_modelArray = [[[NSMutableArray alloc]init]autorelease];
    [database open];
    FMResultSet *rs = [database executeQuery:[NSString stringWithFormat:kSearchFindDomain_Info, domainInfo]];
    while ([rs next]) {
        RITT_C_DOMAIN_Model *c_domain_model = [[RITT_C_DOMAIN_Model alloc]initWithResultSet:rs];
//        c_domain_model.ID = [rs stringForColumn:kID];
//        c_domain_model.DOMAIN_NAME = [rs stringForColumn:kDOMAIN_NAME];
//        c_domain_model.REGISTRANT = [rs stringForColumn:kREGISTRANT];
//        c_domain_model.ORE_NAME = [rs stringForColumn:kORE_NAME];
//        c_domain_model.REG_TIME = [rs stringForColumn:kREG_TIME];
//        c_domain_model.UPDATE_TIME = [rs stringForColumn:kUPDATE_TIME];
//        c_domain_model.DOMAIN_STATUS = [rs stringForColumn:kDOMAIN_STATUS];
//        c_domain_model.NAME_SERVER = [rs stringForColumn:kNAME_SERVER];
        [c_domain_modelArray addObject:c_domain_model];
        [c_domain_model release];
    }
    
    [database close];
    return c_domain_modelArray;
}
- (int)totalCountDomain_Info
{
    NSString *dbPath = [[NSBundle mainBundle]pathForResource:kDBName ofType:@"db"];
    database = [FMDatabase databaseWithPath:dbPath];
    [database open];
    FMResultSet *rs = [database executeQuery:kSearchTotalCountDomain_Info];
    int count = 0;
    while ([rs next]) {
        count++;
    }
    [database close];
    return count;
}

#pragma mark - findIpInfo
- (NSMutableArray *)findWithIpInfo:(NSString *)ipInfo
{
    NSString *dbPath = [[NSBundle mainBundle]pathForResource:kDBName ofType:@"db"];
    database = [FMDatabase databaseWithPath:dbPath];
    NSMutableArray *c_ipinfo_modelArray = [[[NSMutableArray alloc]init]autorelease];
    [database open];
    FMResultSet *rs = [database executeQuery:[NSString stringWithFormat:kSearchFindIp_Info, ipInfo]];
    while ([rs next]) {
        RITT_C_IPINFO_Model *c_ipinfo_model = [[RITT_C_IPINFO_Model alloc]initWithResultSet:rs];
//        c_ipinfo_model._ID = [rs stringForColumn:k_ID];
//        c_ipinfo_model.FROM_IP = [rs stringForColumn:kFROM_IP];
//        c_ipinfo_model.TO_IP = [rs stringForColumn:kTO_IP];
//        c_ipinfo_model.IP_SECT = [rs stringForColumn:kIP_SECT];
//        c_ipinfo_model.MANAGE_CUS = [rs stringForColumn:kMANAGE_CUS];
//        c_ipinfo_model.ADDRESS_STATUS = [rs stringForColumn:kADDRESS_STATUS];
//        c_ipinfo_model.CUSTOMER = [rs stringForColumn:kCUSTOMER];
//        c_ipinfo_model.USE_TYPE = [rs stringForColumn:kUSE_TYPE];
//        c_ipinfo_model.USE_LOC = [rs stringForColumn:kUSE_LOC];
//        c_ipinfo_model.DATA_FROM = [rs stringForColumn:kDATA_FROM];
//        c_ipinfo_model.CONTACTPERSON = [rs stringForColumn:kCONTACTPERSON];
//        c_ipinfo_model.CONTACTPHONE = [rs stringForColumn:kCONTACTPHONE];
//        c_ipinfo_model.P_ID = [rs stringForColumn:kP_ID];
//        c_ipinfo_model.ALLOC_DATE = [rs stringForColumn:kALLOC_DATE];
//        c_ipinfo_model.NET_NAME = [rs stringForColumn:kNET_NAME];
//        c_ipinfo_model.CHANGE_DATE = [rs stringForColumn:kCHANGE_DATE];
//        c_ipinfo_model.AS_CODE = [rs stringForColumn:kAS_CODE];
        if (![c_ipinfo_model.IP_SECT isEqualToString:@"0.0.0.0 - 255.255.255.255"]) {
            [c_ipinfo_modelArray addObject:c_ipinfo_model];
            [c_ipinfo_model release];
        } else {
            [c_ipinfo_model release];
        }
    }
    [database close];
    return c_ipinfo_modelArray;
}
- (int)totalCountIp_Info
{
    NSString *dbPath = [[NSBundle mainBundle]pathForResource:kDBName ofType:@"db"];
    database = [FMDatabase databaseWithPath:dbPath];
    [database open];
    FMResultSet *rs = [database executeQuery:kSearchTotalCountIp_Info];
    int count = 0;
    while ([rs next]) {
        count++;
    }
    [database close];
    return count;
}
- (NSMutableArray *)findByIPV4_2WithCodeNum_2_start:(NSString *)codeNum_2_start codeNum_2_end:(NSString *)codeNum_2_end
{
    NSString *dbPath = [[NSBundle mainBundle]pathForResource:kDBName ofType:@"db"];
    database = [FMDatabase databaseWithPath:dbPath];
    NSMutableArray *c_ipinfo_modelArray = [[[NSMutableArray alloc]init]autorelease];
    [database open];
    FMResultSet *rs = [database executeQuery:[NSString stringWithFormat:kSearchFindByIPV4_2, codeNum_2_start, codeNum_2_end, codeNum_2_start, codeNum_2_end, codeNum_2_start, codeNum_2_end, @"-1"]];
    while ([rs next]) {
        RITT_C_IPINFO_Model *c_ipinfo_model = [[RITT_C_IPINFO_Model alloc]initWithResultSet:rs];
//        c_ipinfo_model._ID = [rs stringForColumn:k_ID];
//        c_ipinfo_model.FROM_IP = [rs stringForColumn:kFROM_IP];
//        c_ipinfo_model.TO_IP = [rs stringForColumn:kTO_IP];
//        c_ipinfo_model.IP_SECT = [rs stringForColumn:kIP_SECT];
//        c_ipinfo_model.MANAGE_CUS = [rs stringForColumn:kMANAGE_CUS];
//        c_ipinfo_model.ADDRESS_STATUS = [rs stringForColumn:kADDRESS_STATUS];
//        c_ipinfo_model.CUSTOMER = [rs stringForColumn:kCUSTOMER];
//        c_ipinfo_model.USE_TYPE = [rs stringForColumn:kUSE_TYPE];
//        c_ipinfo_model.USE_LOC = [rs stringForColumn:kUSE_LOC];
//        c_ipinfo_model.DATA_FROM = [rs stringForColumn:kDATA_FROM];
//        c_ipinfo_model.CONTACTPERSON = [rs stringForColumn:kCONTACTPERSON];
//        c_ipinfo_model.CONTACTPHONE = [rs stringForColumn:kCONTACTPHONE];
//        c_ipinfo_model.P_ID = [rs stringForColumn:kP_ID];
//        c_ipinfo_model.ALLOC_DATE = [rs stringForColumn:kALLOC_DATE];
//        c_ipinfo_model.NET_NAME = [rs stringForColumn:kNET_NAME];
//        c_ipinfo_model.CHANGE_DATE = [rs stringForColumn:kCHANGE_DATE];
//        c_ipinfo_model.AS_CODE = [rs stringForColumn:kAS_CODE];
        if (![c_ipinfo_model.IP_SECT isEqualToString:@"0.0.0.0 - 255.255.255.255"]) {
            [c_ipinfo_modelArray addObject:c_ipinfo_model];
            [c_ipinfo_model release];
        } else {
            [c_ipinfo_model release];
        }
    }
    [database close];
    return c_ipinfo_modelArray;
}
@end
