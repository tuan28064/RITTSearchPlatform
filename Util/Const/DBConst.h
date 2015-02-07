//
//  DBConst.h
//  RITTSearchPlatform
//
//  Created by wangjingtuan on 14-9-10.
//  Copyright (c) 2014年 RITT. All rights reserved.
//

#ifndef RITTSearchPlatform_DBConst_h
#define RITTSearchPlatform_DBConst_h
#import "UIDevice+Category.h"

static NSString * const kDBName = @"irs";               //数据库名称

//C_CODE表及其中字段
static NSString * const kC_CODE = @"C_CODE";            //C_CODE表
static NSString * const kCODE = @"CODE";
static NSString * const kEXPIRETIME = @"EXPIRETIME";
static NSString * const kSTATUS = @"STATUS";
static NSString * const kLOC_NAME = @"LOC_NAME";

//C_DB_INFO表及其中字段
static NSString * const kC_DB_INFO = @"C_DB_INFO";      //C_DB_INFO表
static NSString * const kCODE_COUNT = @"CODE_COUNT";
static NSString * const kIP_COUNT = @"IP_COUNT";
static NSString * const kDOMAIN_COUNT = @"DOMAIN_COUNT";

//C_DOMAIN表及其中字段
static NSString * const kC_DOMAIN = @"C_DOMAIN";        //C_DOMAIN表
static NSString * const kID = @"ID";
static NSString * const kDOMAIN_NAME = @"DOMAIN_NAME";
static NSString * const kREGISTRANT = @"REGISTRANT";
static NSString * const kORE_NAME = @"ORE_NAME";
static NSString * const kREG_TIME = @"REG_TIME";
static NSString * const kUPDATE_TIME = @"UPDATE_TIME";
static NSString * const kDOMAIN_STATUS = @"DOMAIN_STATUS";
static NSString * const kNAME_SERVER = @"NAME_SERVER";

//C_IPINFO表及其中字段
static NSString * const kC_IPINFO = @"C_IPINFO";        //C_IPINFO表
static NSString * const kP_ID = @"P_ID";
static NSString * const kFROM_IP = @"FROM_IP";
static NSString * const kTO_IP = @"TO_IP";
static NSString * const kIP_SECT = @"IP_SECT";
static NSString * const kMANAGE_CUS = @"MANAGE_CUS";
static NSString * const kADDRESS_STATUS = @"ADDRESS_STATUS";
static NSString * const kCUSTOMER = @"CUSTOMER";
static NSString * const kUSE_TYPE = @"USE_TYPE";
static NSString * const kUSE_LOC = @"USE_LOC";
static NSString * const kDATA_FROM = @"DATA_FROM";
static NSString * const kCONTACTPERSON = @"CONTACTPERSON";
static NSString * const kCONTACTPHONE = @"CONTACTPHONE";
static NSString * const kALLOC_DATE = @"ALLOC_DATE";
static NSString * const kNET_NAME = @"NET_NAME";
static NSString * const kCHANGE_DATE = @"CHANGE_DATE";
static NSString * const kAS_CODE = @"AS_CODE";

//C_LOC_CODE表及其中字段
static NSString * const kC_LOC_CODE = @"C_LOC_CODE";    //C_LOC_CODE表
static NSString * const kPROVINCE = @"PROVINCE";
static NSString * const kNAME = @"NAME";

//C_PLAN表及其中字段
static NSString * const kC_PLAN = @"C_PLAN";            //C_PLAN表
static NSString * const kCODESETDESCRIPTION = @"CODESETDESCRIPTION";
static NSString * const kBITLENMANAGE = @"BITLENMANAGE";
static NSString * const kMANAGEDEPT_EID = @"MANAGEDEPT_EID";

//C_PROVINCE表及其中字段
static NSString * const kC_PROVINCE = @"C_PROVINCE";    //C_PROVINCE表
static NSString * const k_ID = @"_ID";
static NSString * const kMME_EID = @"MME_EID";
static NSString * const kCUS_NAME = @"CUS_NAME";

//查询语句

static NSString * const kSearchFindAll = @"select CODE, CUS_NAME from C_CODE";
static NSString * const kSearchFindProvinceAll = @"select MME_EID, CUS_NAME from C_PROVINCE";
static NSString * const kSearchTotalCount = @"select count(_ID) from C_DB_INFO";
static NSString * const kSearchFindByPage = @"select CODE,CUS_NAME, EXPIRETIME from C_CODE order by _ID desc limit %d offset %d";
static NSString * const kSearchFindByCon = @"SELECT CODE,CUS_NAME, EXPIRETIME FROM C_CODE WHERE CODE = '%@'";
static NSString * const kSearchFindByCondition = @"select CODE,CUS_NAME, EXPIRETIME from C_CODE where CODE like '%@%%'";
static NSString * const kSearchFindByProCondition = @"select CODE,CUS_NAME,EXPIRETIME from C_CODE where CODE like %@ and MANAGEDEPT_EID = %@";
static NSString * const kSearchFindByCODELOC = @"SELECT NAME FROM C_LOC_CODE WHERE CODE = %@";
static NSString * const kSearchFindByCODE_A = @"SELECT _ID,CODE,CUS_NAME,EXPIRETIME,STATUS,MME_EID FROM C_CODE WHERE CODE LIKe '%@%%' AND STATUS <> 3 ";
static NSString * const kSearchFindByCODE_B = @"SELECT _ID,CODE,CUS_NAME,EXPIRETIME,STATUS,MME_EID FROM C_CODE WHERE CODE LIKe '%@%%' AND STATUS <> 3";
static NSString * const kSearchFindByCODE_C = @"SELECT _ID,PROVINCE,NAME,CODE FROM C_LOC_CODE WHERE CODE like '%@%%'";
static NSString * const kSearchFindByCODE_C2 = @"SELECT _ID,PROVINCE,NAME,CODE FROM C_LOC_CODE where province like '%@%%' or name like '%@%%'";
static NSString * const kSearchFindByCODE_D = @"SELECT _ID,CODE,CUS_NAME,EXPIRETIME,STATUS,MME_EID FROM C_CODE WHERE CODE LIKe '%@%%' AND MANAGEDEPT_EID = '%@' AND STATUS <> 3";
static NSString * const kSearchFindByCODE_E = @"SELECT _ID,CODE,CUS_NAME,EXPIRETIME,STATUS,MME_EID FROM C_CODE WHERE CODE LIKe '%@%%' AND MANAGEDEPT_EID = '%@' AND STATUS <> 3";
static NSString * const kSearchFindByCODE_F = @"SELECT _ID,CODE,CUS_NAME,LOC_NAME FROM C_CODE WHERE CODE LIKe '%@%%' AND MANAGEDEPT_EID = '%@' AND STATUS <> 3";
static NSString * const kSearchFindByCODE_G = @"SELECT _ID,CODE,CUS_NAME,MANAGEDEPT_EID,STATUS,LOC_NAME FROM C_CODE WHERE CODE LIKe '%@%%'";
static NSString * const kSearchFindByCODE_G2 = @"SELECT CUS_NAME FROM C_PROVINCE WHERE MME_EID = %@";
static NSString * const kSearchFindByCODE_ALL = @"SELECT _ID,CODE,CUS_NAME,EXPIRETIME,STATUS,MME_EID FROM C_CODE WHERE CODE LIKe '%@%%' AND STATUS <> 3";
static NSString * const kSearchFindProvinceNameAll = @"select _ID,MME_EID,CUS_NAME from C_PROVINCE";
static NSString * const kSearchFindByLOC = @"SELECT CODE FROM C_LOC_NAME WHERE NAME = %@";
static NSString * const kSearchTotalCountDB_Info = @"select * from C_DB_INFO";
static NSString * const kSearchFindDomain_Info = @"select ID,DOMAIN_NAME,REGISTRANT,ORE_NAME,REG_TIME,UPDATE_TIME,DOMAIN_STATUS,NAME_SERVER from C_DOMAIN where DOMAIN_NAME like '%@%%'";
static NSString * const kSearchTotalCountDomain_Info = @"select * from C_DOMAIN";
static NSString * const kSearchFindIp_Info = @"select * from C_IPINFO where '%@' between from_ip and to_ip order by to_ip-from_ip desc";
static NSString * const kSearchTotalCountIp_Info = @"select * from C_IPINFO";
static NSString * const kSearchFindByIPV4_2 = @"select * from C_IPINFO where(( from_ip between '%@' and '%@' )or( to_ip between '%@' and '%@' )or(  '%@' between from_ip and to_ip   and  '%@' between from_ip and to_ip    )  ) and p_id = '%@' order by from_ip";

#define kFloatOfSystemVersion [[UIDevice currentDevice] floatOfSystemVersion]
#define kHeightForStatusBar [[UIDevice currentDevice] heightForStatusBar]
#define kIsGreaterThanIOS7 [[UIDevice currentDevice] isGreaterThanIOS7]
#define kHeightForScreen [[UIDevice currentDevice] heightForScreen]
#define kWidthForScreen [[UIDevice currentDevice] widthForScreen]
#define kIsFourInchScreen [[UIDevice currentDevice] isFourInchScreen]
#define ProvinceBgColor [UIColor colorWithRed:98.0 / 255 green:171.0 / 255 blue:244.0 / 255 alpha:1.0f]
#define LineBgColor [UIColor colorWithRed:170.0 / 255 green:170.0 / 255 blue:170.0 / 255 alpha:1.0f]

static int const kNavBarHeight = 44;
static int const kStatusBarHeight = 20;

static NSString * const kRegexIPv4 = @"^(1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|[1-9])\\.(1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|\\d)\\.(1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|\\d)\\.(1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|\\d)$";

static NSString * const kRegexIPv4_2 = @"^(1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|[1-9])\\.(1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|\\d)$";

static NSString * const kRegexIPv4_3 = @"^(1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|[1-9])\\.(1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|\\d)\\.(1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|\\d)$";

//static NSString * const kRegexIPv6 = @"^([\\da-fA-F]{1,4}:){6}((25[0-5]|2[0-4]\\d|[01]?\\d\\d?)\\.){3}(25[0-5]|2[0-4]\\d|[01]?\\d\\d?)$|^::([\\da-fA-F]{1,4}:){0,4}((25[0-5]|2[0-4]\\d|[01]?\\d\\d?)\\.){3}(25[0-5]|2[0-4]\\d|[01]?\\d\\d?)$|^([\\da-fA-F]{1,4}:):([\\da-fA-F]{1,4}:){0,3}((25[0-5]|2[0-4]\\d|[01]?\\d\\d?)\\.){3}(25[0-5]|2[0-4]\\d|[01]?\\d\\d?)$|^([\\da-fA-F]{1,4}:){2}:([\\da-fA-F]{1,4}:){0,2}((25[0-5]|2[0-4]\\d|[01]?\\d\\d?)\\.){3}(25[0-5]|2[0-4]\\d|[01]?\\d\\d?)$|^([\\da-fA-F]{1,4}:){3}:([\\da-fA-F]{1,4}:){0,1}((25[0-5]|2[0-4]\\d|[01]?\\d\\d?)\\.){3}(25[0-5]|2[0-4]\\d|[01]?\\d\\d?)$|^([\\da-fA-F]{1,4}:){4}:((25[0-5]|2[0-4]\\d|[01]?\\d\\d?)\\.){3}(25[0-5]|2[0-4]\\d|[01]?\\d\\d?)$|^([\\da-fA-F]{1,4}:){7}[\\da-fA-F]{1,4}$|^:((:[\\da-fA-F]{1,4}){1,6}|:)$|^[\\da-fA-F]{1,4}:((:[\\da-fA-F]{1,4}){1,5}|:)$|^([\\da-fA-F]{1,4}:){2}((:[\\da-fA-F]{1,4}){1,4}|:)$|^([\\da-fA-F]{1,4}:){3}((:[\\da-fA-F]{1,4}){1,3}|:)$|^([\\da-fA-F]{1,4}:){4}((:[\\da-fA-F]{1,4}){1,2}|:)$|^([\\da-fA-F]{1,4}:){5}:([\\da-fA-F]{1,4})?$|^([\\da-fA-F]{1,4}:){6}:$";

//static NSString * const kRegexIPv6 = [NSString stringWithFormat:@"%@", ^([\\da-fA-F]{1,4}:){6}((25[0-5]|2[0-4]\\d|[01]?\\d\\d?)\\.){3}(25[0-5]|2[0-4]\\d|[01]?\\d\\d?)$|^::([\\da-fA-F]{1,4}:){0,4}((25[0-5]|2[0-4]\\d|[01]?\\d\\d?)\\.){3}(25[0-5]|2[0-4]\\d|[01]?\\d\\d?)$|^([\\da-fA-F]{1,4}:):([\\da-fA-F]{1,4}:){0,3}((25[0-5]|2[0-4]\\d|[01]?\\d\\d?)\\.){3}(25[0-5]|2[0-4]\\d|[01]?\\d\\d?)$|^([\\da-fA-F]{1,4}:){2}:([\\da-fA-F]{1,4}:){0,2}((25[0-5]|2[0-4]\\d|[01]?\\d\\d?)\\.){3}(25[0-5]|2[0-4]\\d|[01]?\\d\\d?)$|^([\\da-fA-F]{1,4}:){3}:([\\da-fA-F]{1,4}:){0,1}((25[0-5]|2[0-4]\\d|[01]?\\d\\d?)\\.){3}(25[0-5]|2[0-4]\\d|[01]?\\d\\d?)$|^([\\da-fA-F]{1,4}:){4}:((25[0-5]|2[0-4]\\d|[01]?\\d\\d?)\\.){3}(25[0-5]|2[0-4]\\d|[01]?\\d\\d?)$|^([\\da-fA-F]{1,4}:){7}[\\da-fA-F]{1,4}$|^:((:[\\da-fA-F]{1,4}){1,6}|:)$|^[\\da-fA-F]{1,4}:((:[\\da-fA-F]{1,4}){1,5}|:)$|^([\\da-fA-F]{1,4}:){2}((:[\\da-fA-F]{1,4}){1,4}|:)$|^([\\da-fA-F]{1,4}:){3}((:[\\da-fA-F]{1,4}){1,3}|:)$|^([\\da-fA-F]{1,4}:){4}((:[\\da-fA-F]{1,4}){1,2}|:)$|^([\\da-fA-F]{1,4}:){5}:([\\da-fA-F]{1,4})?$|^([\\da-fA-F]{1,4}:){6}:$];

typedef enum {
    InputType_A_95 = 95, //全国短号码95规划
    InputType_A = 96,    //全国短号码
    InputType_B_106 = 106,  //全国短消息106规划
    InputType_B = 107,    //全国短消息106规划
    InputType_C = 200,  //长途区号
    InputType_C2 = 222, //地名查长途号
    InputType_D = 201,  //96号码
    InputType_E = 202,
    InputType_F = 203,  //局号
    InputType_G = 204,  //移动号
    InputType_all = 300,    //其他
    InputType_IPv4 = 205,
    InputType_IPv6 = 206,
    InputType_IPv4_2 = 207,
    InputType_domain = 208,
}InputType;

typedef enum {
    ReqAct_domain,
    ReqAct_code,
    ReqAct_dbCheckForUpdate,
}NetRequestAct; //网络请求类型

static int const kUIButtonTag = 9892;

#pragma mark - 网络请求部分

#define RequestURL(string) [kBaseURL stringByAppendingFormat:@"%@", string]

static NSString * const kBaseURL = @"http://202.96.50.189:7001/doCommon.html";    //测试服务

static NSString * const kAct_act = @"act";
static NSString * const kRequestFormGET = @"GET";   //GET请求
static NSString * const kRequestFormPOST = @"POST"; //POST请求
static NSString * const kData_result = @"result";   //0成功，1失败
static NSString * const kData_success = @"0";

static NSString * const kParam_name = @"name";
static NSString * const kParam_mme_eid = @"mme_eid";
static NSString * const kParam_domain = @"domain";
static NSString * const kParam_dbSW = @"dbSW";

static NSString * const kData_url = @"url";
static NSString * const kData_dbSW = @"dbSW";

//其他常量
static int const kMBProgressHUDTag = 3827;

#endif
