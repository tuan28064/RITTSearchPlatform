//
//  LongDistanceCodeAdapter.m
//  RITTSearchPlatform
//
//  Created by wangjingtuan on 14-9-29.
//  Copyright (c) 2014年 RITT. All rights reserved.
//

#import "LongDistanceCodeAdapter.h"
#import "LongDistanceCodeCell.h"

@implementation LongDistanceCodeAdapter

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([self.list count]) {
        return  [self.list count];
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"LongDistanceCodeCell";
    LongDistanceCodeCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[[LongDistanceCodeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID]autorelease];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [cell cellContent:[self.list objectAtIndex:indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
