//
//  RITT_C_LOC_CODE_Model.h
//  RITTSearchPlatform
//
//  Created by wangjingtuan on 14-9-11.
//  Copyright (c) 2014年 RITT. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FMResultSet;
@interface RITT_C_LOC_CODE_Model : NSObject

@property (nonatomic, copy) NSString *_ID;
@property (nonatomic, copy) NSString *PROVINCE;
@property (nonatomic, copy) NSString *NAME;
@property (nonatomic, copy) NSString *CODE;

- (id)initWithResultSet:(FMResultSet *)resultSet;

@end
