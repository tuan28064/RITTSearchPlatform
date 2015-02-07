//
//  LocQuery_A95Adapter.h
//  RITTSearchPlatform
//
//  Created by wangjingtuan on 14-10-12.
//  Copyright (c) 2014年 RITT. All rights reserved.
//

#import "BaseAdapter.h"

//根据协议方法，点击不同的cell进入不同的详情页
@protocol ShowDetailProtocol <NSObject>

- (void)showCodeDetail:(NSString *)mme_eid withCode:(NSString *)code;
- (void)showDomainDetail:(NSString *)domain;
- (void)show95Detail:(NSString *)code;

@end

@interface LocQuery_A95Adapter : BaseAdapter

@property (nonatomic, assign) id<ShowDetailProtocol> showDetaildelegate;

//判断是code类型还是domain的查询
@property (nonatomic, retain) NSString *type;


@end
