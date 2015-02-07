//
//  RITTBaseViewController.h
//  RITTSearchPlatform
//
//  Created by wangjingtuan on 14-9-10.
//  Copyright (c) 2014年 RITT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseAdapter.h"

@interface RITTBaseViewController : UIViewController <AdapterProtocol>

//navbar的title
@property (nonatomic, retain) NSString *titleViewContent;

//数据接收数组
@property (nonatomic, retain) NSArray *list;

//查询提示语
@property (nonatomic, retain) UILabel *searchInfoLabel;

//设置navbar的左右按钮和navbar的title
- (void)generateNavBarUIWithLeftImage:(UIImage *)leftImage rightImage:(UIImage *)rightImage titleText:(NSString *)titleText target:(id)target;

@end
