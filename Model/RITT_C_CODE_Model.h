//
//  RITT_C_CODE_Model.h
//  RITTSearchPlatform
//
//  Created by wangjingtuan on 14-9-11.
//  Copyright (c) 2014年 RITT. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FMResultSet;
@interface RITT_C_CODE_Model : NSObject

@property (nonatomic, copy) NSString *_ID;
@property (nonatomic, copy) NSString *MME_EID;
@property (nonatomic, copy) NSString *CODE;
@property (nonatomic, copy) NSString *CUS_NAME;
@property (nonatomic, copy) NSString *EXPIRETIME;
@property (nonatomic, copy) NSString *MANAGEDEPT_EID;
@property (nonatomic, copy) NSString *STATUS;
@property (nonatomic, copy) NSString *LOC_NAME;

- (id)initWithResultSet:(FMResultSet *)resultSet;

@end
