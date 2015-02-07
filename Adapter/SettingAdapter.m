//
//  SettingAdapter.m
//  RITTSearchPlatform
//
//  Created by wangjingtuan on 14-10-8.
//  Copyright (c) 2014年 RITT. All rights reserved.
//

#import "SettingAdapter.h"

@implementation SettingAdapter

@synthesize settingAdapterDelegate;

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"SettingCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID]autorelease];
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.textColor = [UIColor colorWithRed:0 / 255 green:0 / 255 blue:139.0 / 255 alpha:1.0f];
    }
    if (indexPath.row == 0) {
        cell.textLabel.text = @"在线升级";
    } else if (indexPath.row == 1) {
        cell.textLabel.text = @"帮助";
    } else if (indexPath.row == 2) {
        cell.textLabel.text = @"关于";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            [settingAdapterDelegate updateDB];
        }
            break;
            
        default:
            break;
    }
}

@end
