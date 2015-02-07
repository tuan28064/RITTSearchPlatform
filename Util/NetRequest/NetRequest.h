//
//  NetRequest.h
//  RITTSearchPlatform
//
//  Created by wangjingtuan on 14-10-12.
//  Copyright (c) 2014年 RITT. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NetRequestProtocol <NSObject>

- (void)netRequestFinished:(NSMutableDictionary *)data withAct:(int)act;

- (void)netRequestFailed:(NSMutableDictionary *)data withAct:(int)act;

@end

@interface NetRequest : NSObject

@property (nonatomic, assign) id<NetRequestProtocol> delegate;

+ (instancetype)sharedInstance;

- (void)code:(NSString *)mme_eid;
- (void)domain:(NSString *)domain;
- (void)dbCheckForUpdate:(NSString *)dbSW;

@end
