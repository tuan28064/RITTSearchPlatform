//
//  RITT_C_DB_INFO_Model.h
//  RITTSearchPlatform
//
//  Created by wangjingtuan on 14-9-11.
//  Copyright (c) 2014年 RITT. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FMResultSet;
@interface RITT_C_DB_INFO_Model : NSObject

@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *CODE_COUNT;
@property (nonatomic, copy) NSString *IP_COUNT;
@property (nonatomic, copy) NSString *DOMAIN_COUNT;

- (id)initWithResultSet:(FMResultSet *)resultSet;

@end
