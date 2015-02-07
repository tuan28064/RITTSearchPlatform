//
//  RITTDatabaseOperation.h
//  RITTSearchPlatform
//
//  Created by wangjingtuan on 14-9-10.
//  Copyright (c) 2014年 RITT. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FMDatabase;
@class RITT_C_CODE_Model;
@class RITT_C_DB_INFO_Model;

@interface RITTDatabaseOperation : NSObject

+ (instancetype)sharedInstance;

//返回所有黑名单号码信息C_CODE
- (NSMutableArray *)findAll;

//返回所有黑名单号码信息C_PROVINCE
- (NSMutableArray *)findProvinceAll;

//分批获取数据库里边黑名单的信息
- (NSMutableArray *)findByPageWithMaxNumber:(int)maxNumber startIndex:(int)startIndex;

//分批获取数据库里面黑名单的信息
- (RITT_C_CODE_Model *)findByConWithCode:(NSString *)code;

//分批获取数据库里面黑名单的信息
- (NSMutableArray *)findByConditionWithCode:(NSString *)code;

//分批获取数据库里面黑名单的信息
- (NSMutableArray *)findByProConditionWithCode:(NSString *)code provinceMid:(NSString *)provinceMid;
//分批获取数据库里面黑名单的信息
- (NSString *)findByCODELOCWithCode:(NSString *)code;

- (NSMutableArray *)findByCODE_AWithCode:(NSString *)code;
- (NSMutableArray *)findByCODE_BWithCode:(NSString *)code;
- (NSMutableArray *)findByCODE_CWithCode:(NSString *)code;
- (NSMutableArray *)findByCODE_C2WithCode:(NSString *)code;
- (NSMutableArray *)findByCODE_DWithCode:(NSString *)code mid:(NSString *)mid;
- (NSMutableArray *)findByCODE_EWithCode:(NSString *)code mid:(NSString *)mid;
- (NSMutableArray *)findByCODE_FWithCode:(NSString *)code mid:(NSString *)mid;
- (NSMutableArray *)findByCODE_GWithCode:(NSString *)code;
- (NSMutableArray *)findByCODE_ALLWithCode:(NSString *)code;

- (NSMutableArray *)findProvinceNameAll;

- (int)getTotalCount;

- (NSString *)findByLOCWithCode:(NSString *)code;

- (RITT_C_DB_INFO_Model *)totalCountDB_Info;

//domain DAO
- (NSMutableArray *)findWithDomainInfo:(NSString *)domainInfo;
- (int)totalCountDomain_Info;

//IP DAO
- (NSMutableArray *)findWithIpInfo:(NSString *)ipInfo;
- (int)totalCountIp_Info;
- (NSMutableArray *)findByIPV4_2WithCodeNum_2_start:(NSString *)codeNum_2_start codeNum_2_end:(NSString *)codeNum_2_end;

@end
