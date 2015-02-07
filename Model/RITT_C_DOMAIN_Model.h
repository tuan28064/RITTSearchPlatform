//
//  RITT_C_DOMAIN_Model.h
//  RITTSearchPlatform
//
//  Created by wangjingtuan on 14-9-11.
//  Copyright (c) 2014年 RITT. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FMResultSet;
@interface RITT_C_DOMAIN_Model : NSObject

@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *DOMAIN_NAME;
@property (nonatomic, copy) NSString *REGISTRANT;
@property (nonatomic, copy) NSString *ORE_NAME;
@property (nonatomic, copy) NSString *REG_TIME;
@property (nonatomic, copy) NSString *UPDATE_TIME;
@property (nonatomic, copy) NSString *DOMAIN_STATUS;
@property (nonatomic, copy) NSString *NAME_SERVER;

- (id)initWithResultSet:(FMResultSet *)resultSet;

@end
