//
//  LocQuery_A95Adapter.m
//  RITTSearchPlatform
//
//  Created by wangjingtuan on 14-10-12.
//  Copyright (c) 2014年 RITT. All rights reserved.
//

#import "LocQuery_A95Adapter.h"
#import "LocQuery_A95Cell.h"
#import "RITT_C_CODE_Model.h"
#import "RITT_C_DOMAIN_Model.h"

@implementation LocQuery_A95Adapter

@synthesize showDetaildelegate;
@synthesize type;

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([self.list count]) {
        return  [self.list count];
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"LocQuery_A95Cell";
    LocQuery_A95Cell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[[LocQuery_A95Cell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID]autorelease];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    if ([type isEqualToString:@"domain"]) { //域名
        [cell cellContentForDomain:[self.list objectAtIndex:indexPath.row]];
    } else if ([type isEqualToString:@"code"]) {    //码号
        [cell cellContent:[self.list objectAtIndex:indexPath.row]];
    } else if ([type isEqualToString:@"95"]) {  //95规划写死
        [cell cellContentForOther:[self.list objectAtIndex:indexPath.row]];
    } else {    //其他
        [cell cellContentForOther:[self.list objectAtIndex:indexPath.row]];
        cell.rightAngleImageView.hidden = YES;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if ([type isEqualToString:@"code"]) {   //码号
        [showDetaildelegate showCodeDetail:((RITT_C_CODE_Model *)[self.list objectAtIndex:indexPath.row]).MME_EID withCode:((RITT_C_CODE_Model *)[self.list objectAtIndex:indexPath.row]).CODE];
    } else if ([type isEqualToString:@"domain"]) {  //域名
        [showDetaildelegate showDomainDetail:((RITT_C_DOMAIN_Model *)[self.list objectAtIndex:indexPath.row]).ID];
    } else if ([type isEqualToString:@"95"]) {  //95规划
        NSArray *codeArray = [NSArray arrayWithObjects:@"950", @"951", @"952", @"955", @"957", @"958", @"959", nil];
        [showDetaildelegate show95Detail:[codeArray objectAtIndex:indexPath.row]];
    }
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([type isEqualToString:@"code"]) {
        return 6 + [LocQuery_A95Cell heightForNumberLabel:[self.list objectAtIndex:indexPath.row]] + 4 + [LocQuery_A95Cell heightForNameLabel:[self.list objectAtIndex:indexPath.row]] + 6;
    } else if ([type isEqualToString:@"domain"]) {
        return 6 + [LocQuery_A95Cell heightForNumberLabelForDomain:[self.list objectAtIndex:indexPath.row]] + 4 + [LocQuery_A95Cell heightForNameLabelForDomain:[self.list objectAtIndex:indexPath.row]] + 6;
    } else {
        return 6 + [LocQuery_A95Cell heightForNumberLabel:[self.list objectAtIndex:indexPath.row]] + 4 + [LocQuery_A95Cell heightForNameLabel:[self.list objectAtIndex:indexPath.row]] + 6;
    }
    return 44;
}


@end
