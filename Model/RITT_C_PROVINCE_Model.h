//
//  RITT_C_PROVINCE_Model.h
//  RITTSearchPlatform
//
//  Created by wangjingtuan on 14-9-11.
//  Copyright (c) 2014年 RITT. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FMResultSet;
@interface RITT_C_PROVINCE_Model : NSObject

@property (nonatomic, copy) NSString *_ID;
@property (nonatomic, copy) NSString *MME_EID;
@property (nonatomic, copy) NSString *CUS_NAME;

- (id)initWithResultSet:(FMResultSet *)resultSet;

@end
