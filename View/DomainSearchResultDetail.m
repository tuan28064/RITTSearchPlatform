//
//  DomainSearchResultDetail.m
//  RITTSearchPlatform
//
//  Created by wangjingtuan on 14-10-16.
//  Copyright (c) 2014年 RITT. All rights reserved.
//

#import "DomainSearchResultDetail.h"

@implementation DomainSearchResultDetail

@synthesize domainLabel;
@synthesize statusLabel;
@synthesize allUnitLabel;
@synthesize registerUnitLabel;
@synthesize dnsServerLabel;
@synthesize registerTimeLabel;
@synthesize modifiedTimeLabel;

- (void)dealloc
{
    [domainLabel release], domainLabel = nil;
    [statusLabel release], statusLabel = nil;
    [allUnitLabel release], allUnitLabel = nil;
    [registerUnitLabel release], registerUnitLabel = nil;
    [dnsServerLabel release], dnsServerLabel = nil;
    [registerUnitLabel release], registerUnitLabel = nil;
    [modifiedTimeLabel release], modifiedTimeLabel = nil;
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        domainLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, self.frame.size.width - 20, 40)];
        domainLabel.backgroundColor = [UIColor clearColor];
        domainLabel.font = [UIFont systemFontOfSize:14.0];
        domainLabel.numberOfLines = 0;
        [self addSubview:domainLabel];
        
        statusLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(domainLabel.frame) + 6, CGRectGetMaxY(domainLabel.frame), self.frame.size.width - 20, 40)];
        statusLabel.backgroundColor = [UIColor clearColor];
        statusLabel.font = [UIFont systemFontOfSize:14.0f];
        statusLabel.numberOfLines = 0;
        [self addSubview:statusLabel];
        
        allUnitLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(domainLabel.frame) + 6, CGRectGetMaxY(statusLabel.frame), self.frame.size.width - 20, 40)];
        allUnitLabel.backgroundColor = [UIColor clearColor];
        allUnitLabel.numberOfLines = 0;
        allUnitLabel.font = [UIFont systemFontOfSize:14.0f];
        [self addSubview:allUnitLabel];
        
        registerUnitLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(domainLabel.frame) + 6, CGRectGetMaxY(allUnitLabel.frame), self.frame.size.width - 20, 40)];
        registerUnitLabel.backgroundColor = [UIColor clearColor];
        registerUnitLabel.numberOfLines = 0;
        registerUnitLabel.font = [UIFont systemFontOfSize:14.0f];
        [self addSubview:registerUnitLabel];
        
        dnsServerLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(domainLabel.frame) + 6, CGRectGetMaxY(registerUnitLabel.frame), self.frame.size.width - 20, 40)];
        dnsServerLabel.backgroundColor = [UIColor clearColor];
        dnsServerLabel.numberOfLines = 0;
        dnsServerLabel.font = [UIFont systemFontOfSize:14.0f];
        [self addSubview:dnsServerLabel];
        
        registerTimeLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(domainLabel.frame) + 6, CGRectGetMaxY(dnsServerLabel.frame), self.frame.size.width - 20, 40)];
        registerTimeLabel.backgroundColor = [UIColor clearColor];
        registerTimeLabel.numberOfLines = 0;
        registerTimeLabel.font = [UIFont systemFontOfSize:14.0f];
        [self addSubview:registerTimeLabel];
        
        modifiedTimeLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(domainLabel.frame) + 6, CGRectGetMaxY(registerUnitLabel.frame), self.frame.size.width - 20, 40)];
        modifiedTimeLabel.backgroundColor = [UIColor clearColor];
        modifiedTimeLabel.numberOfLines = 0;
        modifiedTimeLabel.font = [UIFont systemFontOfSize:14.0f];
        [self addSubview:modifiedTimeLabel];
    }
    return self;
}

- (void)content:(NSArray *)content
{
    domainLabel.text = [NSString stringWithFormat:@"域        名：%@", [content objectAtIndex:0]];
    domainLabel.frame = CGRectMake(10, 0, self.frame.size.width - 20, [self heightForString:domainLabel.text fontSize:14.0 width:self.frame.size.width - 20]);
    
    statusLabel.text = [NSString stringWithFormat:@"域名状态：%@", [content objectAtIndex:1]];
    statusLabel.frame = CGRectMake(CGRectGetMinX(domainLabel.frame), CGRectGetMaxY(domainLabel.frame) + 6, self.frame.size.width - 20, [self heightForString:statusLabel.text fontSize:14.0 width:self.frame.size.width - 20]);
    
    allUnitLabel.text = [NSString stringWithFormat:@"所有机构：%@", [content objectAtIndex:2]];
    allUnitLabel.frame = CGRectMake(CGRectGetMinX(domainLabel.frame), CGRectGetMaxY(statusLabel.frame) + 6, self.frame.size.width - 20, [self heightForString:allUnitLabel.text fontSize:14.0 width:self.frame.size.width - 20]);

    registerUnitLabel.text = [NSString stringWithFormat:@"注册机构：%@", [content objectAtIndex:4]];
    registerUnitLabel.frame = CGRectMake(CGRectGetMinX(domainLabel.frame), CGRectGetMaxY(allUnitLabel.frame) + 6, self.frame.size.width - 20, [self heightForString:registerUnitLabel.text fontSize:14.0 width:self.frame.size.width - 20]);
    
    NSString *dnsString = @"DNS服务器：";
    NSArray *dnsArray = [[content objectAtIndex:5]componentsSeparatedByString:@"|"];
    for (int i = 0; i < [dnsArray count] - 1; i++) {
        NSString *string = [NSString stringWithFormat:@"%@", [dnsArray objectAtIndex:i]];
        if ([dnsArray count] > 1) {
            if (i == 0) {
                dnsString = [dnsString stringByAppendingString:string];
                dnsString = [dnsString stringByAppendingString:@"\n"];
            } else {
                dnsString = [dnsString stringByAppendingString:@"                     "];
                dnsString = [dnsString stringByAppendingString:string];
                dnsString = [dnsString stringByAppendingString:@"\n"];
            }
        } else if ([dnsArray count] == 1) {
            if (i == 0) {
                dnsString = [dnsString stringByAppendingString:string];
                dnsString = [dnsString stringByAppendingString:@"\n"];
            }
        }
        
        
    }
    dnsServerLabel.text = dnsString;
    dnsServerLabel.frame = CGRectMake(CGRectGetMinX(domainLabel.frame), CGRectGetMaxY(registerUnitLabel.frame) + 6, self.frame.size.width - 20, [self heightForString:dnsServerLabel.text fontSize:14.0 width:self.frame.size.width - 20]);
    
    registerTimeLabel.text = [NSString stringWithFormat:@"注册时间：%@", [content objectAtIndex:6]];
    registerTimeLabel.frame = CGRectMake(CGRectGetMinX(domainLabel.frame), CGRectGetMaxY(dnsServerLabel.frame) + 6, self.frame.size.width - 20, [self heightForString:registerTimeLabel.text fontSize:14.0 width:self.frame.size.width - 20]);
    
    modifiedTimeLabel.text = [NSString stringWithFormat:@"变更时间：%@", [content objectAtIndex:7]];
    modifiedTimeLabel.frame = CGRectMake(CGRectGetMinX(domainLabel.frame), CGRectGetMaxY(registerTimeLabel.frame) + 6, self.frame.size.width - 20, [self heightForString:modifiedTimeLabel.text fontSize:14.0 width:self.frame.size.width - 20]);
}

- (float)heightForString:(NSString *)string fontSize:(float)fontSize width:(float)width
{
    CGSize sizeToFit = [string sizeWithFont:[UIFont systemFontOfSize:fontSize] constrainedToSize:CGSizeMake(width, CGFLOAT_MAX) lineBreakMode:NSLineBreakByWordWrapping];
    return sizeToFit.height;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
