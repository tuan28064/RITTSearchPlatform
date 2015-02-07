//
//  IPAdapter.m
//  RITTSearchPlatform
//
//  Created by wangjingtuan on 14/10/26.
//  Copyright (c) 2014年 RITT. All rights reserved.
//

#import "IPAdapter.h"
#import "IPCell.h"

@implementation IPAdapter

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([self.list count]) {
        return  [self.list count];
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"IPCell";
    IPCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[[IPCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID]autorelease];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [cell cellContent:[self.list objectAtIndex:indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 35 + [IPCell heightForALLOC_DATELabel:[self.list objectAtIndex:indexPath.row]] + [IPCell heightForCUSTOMERLabel:[self.list objectAtIndex:indexPath.row]] + [IPCell heightForDATA_FROMLabel:[self.list objectAtIndex:indexPath.row]] + [IPCell heightForIP_SECTLabel:[self.list objectAtIndex:indexPath.row]] + [IPCell heightForNet_NameLabel:[self.list objectAtIndex:indexPath.row]];
}


@end
