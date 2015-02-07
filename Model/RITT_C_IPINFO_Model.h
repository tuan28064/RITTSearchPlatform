//
//  RITT_C_IPINFO_Model.h
//  RITTSearchPlatform
//
//  Created by wangjingtuan on 14-9-11.
//  Copyright (c) 2014年 RITT. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FMResultSet;
@interface RITT_C_IPINFO_Model : NSObject

@property (nonatomic, copy) NSString *_ID;
@property (nonatomic, copy) NSString *P_ID;
@property (nonatomic, copy) NSString *FROM_IP;
@property (nonatomic, copy) NSString *TO_IP;
@property (nonatomic, copy) NSString *IP_SECT;
@property (nonatomic, copy) NSString *MANAGE_CUS;
@property (nonatomic, copy) NSString *ADDRESS_STATUS;
@property (nonatomic, copy) NSString *CUSTOMER;
@property (nonatomic, copy) NSString *USE_TYPE;
@property (nonatomic, copy) NSString *USE_LOC;
@property (nonatomic, copy) NSString *DATA_FROM;
@property (nonatomic, copy) NSString *CONTACTPERSON;
@property (nonatomic, copy) NSString *CONTACTPHONE;
@property (nonatomic, copy) NSString *ALLOC_DATE;
@property (nonatomic, copy) NSString *NET_NAME;
@property (nonatomic, copy) NSString *CHANGE_DATE;
@property (nonatomic, copy) NSString *AS_CODE;

- (id)initWithResultSet:(FMResultSet *)resultSet;

@end
