//
//  BaseAdapter.m
//  RITTSearchPlatform
//
//  Created by wangjingtuan on 14-9-29.
//  Copyright (c) 2014年 RITT. All rights reserved.
//

#import "BaseAdapter.h"

@implementation BaseAdapter

@synthesize delegate;
@synthesize list;

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [list count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([delegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]) {
        [delegate tableView:tableView didSelectRowAtIndexPath:indexPath];
    }
}

@end
