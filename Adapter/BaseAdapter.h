//
//  BaseAdapter.h
//  RITTSearchPlatform
//
//  Created by wangjingtuan on 14-9-29.
//  Copyright (c) 2014年 RITT. All rights reserved.
//

#import <Foundation/Foundation.h>

//响应该Protocol，实现点击cell后的操作
@protocol AdapterProtocol <NSObject>

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface BaseAdapter : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, assign) id<AdapterProtocol> delegate;
@property (nonatomic, retain) NSArray *list;

@end
