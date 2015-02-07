//
//  RITTSearchResultViewController.h
//  RITTSearchPlatform
//
//  Created by wangjingtuan on 14-9-27.
//  Copyright (c) 2014年 RITT. All rights reserved.
//

#import "RITTBaseViewController.h"

@interface RITTSearchResultViewController : RITTBaseViewController

//输入参数1
@property (nonatomic, copy) NSString *searchInput;
//输入参数2
@property (nonatomic, copy) NSString *searchInput_param2;
//查询类型
@property (nonatomic, assign) InputType inputType;
//是否是push进来，push进来刷新
@property (nonatomic, assign) BOOL isPush;

@end
