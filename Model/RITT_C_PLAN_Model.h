//
//  RITT_C_PLAN_Model.h
//  RITTSearchPlatform
//
//  Created by wangjingtuan on 14-9-11.
//  Copyright (c) 2014年 RITT. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FMResultSet;
@interface RITT_C_PLAN_Model : NSObject

@property (nonatomic, copy) NSString *MME_EID;
@property (nonatomic, copy) NSString *CODESETDESCRIPTION;
@property (nonatomic, copy) NSString *BITLENMANAGE;
@property (nonatomic, copy) NSString *MANAGEDEPT_EID;

- (id)initWithResultSet:(FMResultSet *)resultSet;

@end
