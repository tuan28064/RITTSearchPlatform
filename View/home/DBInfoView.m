//
//  DBInfoView.m
//  RITTSearchPlatform
//
//  Created by wangjingtuan on 14-9-27.
//  Copyright (c) 2014年 RITT. All rights reserved.
//

#import "DBInfoView.h"

@interface DBInfoView ()

@property (nonatomic, retain) UILabel *introLabel;
@property (nonatomic, retain) UILabel *codeLabel;
@property (nonatomic, retain) UILabel *ipLabel;
@property (nonatomic, retain) UILabel *domainLabel;

@end

@implementation DBInfoView

@synthesize introLabel;
@synthesize codeLabel;
@synthesize ipLabel;
@synthesize domainLabel;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        introLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 20)];
        introLabel.text = @"综合业务资源查询平台 共收录：";
        introLabel.font = [UIFont systemFontOfSize:12.0];
        introLabel.textColor = [UIColor colorWithRed:178.0 / 255.0 green:178.0 / 255.0 blue:178.0 / 255.0 alpha:1.0f];
        [self addSubview:introLabel];
        
        codeLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(introLabel.frame) + 30, CGRectGetMaxY(introLabel.frame), 200, 20)];
        codeLabel.font = [UIFont systemFontOfSize:12.0f];
        codeLabel.textColor = [UIColor colorWithRed:178.0 / 255.0 green:178.0 / 255.0 blue:178.0 / 255.0 alpha:1.0f];
        [self addSubview:codeLabel];
        
        ipLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(introLabel.frame) + 40, CGRectGetMaxY(codeLabel.frame), 200, 20)];
        ipLabel.font = [UIFont systemFontOfSize:12.0f];
        ipLabel.textColor = [UIColor colorWithRed:178.0 / 255.0 green:178.0 / 255.0 blue:178.0 / 255.0 alpha:1.0f];
        [self addSubview:ipLabel];
        
        domainLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(introLabel.frame) + 30, CGRectGetMaxY(ipLabel.frame), 200, 20)];
        domainLabel.font = [UIFont systemFontOfSize:12.0f];
        domainLabel.textColor = [UIColor colorWithRed:178.0 / 255.0 green:178.0 / 255.0 blue:178.0 / 255.0 alpha:1.0f];
        [self addSubview:domainLabel];
        
        
    }
    return self;
}

- (void)dbInfoWithCodeCount:(NSString *)codeCount ipCount:(NSString *)ipCount domainCount:(NSString *)domainCount
{
    codeLabel.text = [NSString stringWithFormat:@"码号数据%@条", codeCount];
    ipLabel.text = [NSString stringWithFormat:@"IP数据%@条", ipCount];
    domainLabel.text = [NSString stringWithFormat:@"域名数据%@条", domainCount];

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
