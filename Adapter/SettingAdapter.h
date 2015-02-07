//
//  SettingAdapter.h
//  RITTSearchPlatform
//
//  Created by wangjingtuan on 14-10-8.
//  Copyright (c) 2014年 RITT. All rights reserved.
//

#import "BaseAdapter.h"

@protocol SettingAdapterProtocol <NSObject>

- (void)updateDB;

@end

@interface SettingAdapter : BaseAdapter

@property (nonatomic, assign) id<SettingAdapterProtocol> settingAdapterDelegate;

@end
