//
//  IPCell.m
//  RITTSearchPlatform
//
//  Created by wangjingtuan on 14/10/26.
//  Copyright (c) 2014年 RITT. All rights reserved.
//

#import "IPCell.h"
#import "RITT_C_IPINFO_Model.h"

@implementation IPCell

@synthesize IP_SECTLabel;
@synthesize CUSTOMERLabel;
@synthesize NET_NAMELabel;
@synthesize ALLOC_DATELabel;
@synthesize DATA_FROMLabel;

@synthesize IP_SECTLabelForContent;
@synthesize CUSTOMERLabelForContent;
@synthesize NET_NAMELabelForContent;
@synthesize ALLOC_DATELabelForContent;
@synthesize DATA_FROMLabelForContent;

- (void)dealloc
{
    [IP_SECTLabel release], IP_SECTLabel = nil;
    [CUSTOMERLabel release], CUSTOMERLabel = nil;
    [NET_NAMELabel release], NET_NAMELabel = nil;
    [ALLOC_DATELabel release], ALLOC_DATELabel = nil;
    [DATA_FROMLabel release], DATA_FROMLabel = nil;
    
    [IP_SECTLabelForContent release], IP_SECTLabelForContent = nil;
    [CUSTOMERLabelForContent release], CUSTOMERLabelForContent = nil;
    [NET_NAMELabelForContent release], NET_NAMELabelForContent = nil;
    [ALLOC_DATELabelForContent release], ALLOC_DATELabelForContent = nil;
    [DATA_FROMLabelForContent release], DATA_FROMLabelForContent = nil;
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        //各字段名称和数据库中含义一致
        IP_SECTLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 6, self.frame.size.width - 20, 20)];
        IP_SECTLabel.textAlignment = NSTextAlignmentJustified;
        IP_SECTLabel.font = [UIFont systemFontOfSize:14.0f];
        [self addSubview:IP_SECTLabel];
        
        IP_SECTLabelForContent = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(IP_SECTLabel.frame), CGRectGetMinY(IP_SECTLabel.frame), self.frame.size.width - 20, 20)];
        IP_SECTLabelForContent.font = [UIFont systemFontOfSize:14.0f];
        IP_SECTLabelForContent.numberOfLines = 0;
//        IP_SECTLabelForContent.backgroundColor = [UIColor greenColor];
        [self addSubview:IP_SECTLabelForContent];
        
        CUSTOMERLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(IP_SECTLabel.frame), CGRectGetMaxY(IP_SECTLabel.frame) + 6, self.frame.size.width - 20, 20)];
        CUSTOMERLabel.textAlignment = NSTextAlignmentJustified;
        CUSTOMERLabel.font = [UIFont systemFontOfSize:14.0f];
        [self addSubview:CUSTOMERLabel];
        
        CUSTOMERLabelForContent = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(CUSTOMERLabel.frame), CGRectGetMinY(CUSTOMERLabel.frame), self.frame.size.width - 20, 20)];
        CUSTOMERLabelForContent.font = [UIFont systemFontOfSize:14.0f];
        CUSTOMERLabelForContent.numberOfLines = 0;
//        CUSTOMERLabelForContent.backgroundColor = [UIColor blueColor];
        [self addSubview:CUSTOMERLabelForContent];
        
        NET_NAMELabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(IP_SECTLabel.frame), CGRectGetMaxY(CUSTOMERLabel.frame) + 6, self.frame.size.width - 20, 20)];
        NET_NAMELabel.textAlignment = NSTextAlignmentJustified;
        NET_NAMELabel.font = [UIFont systemFontOfSize:14.0f];
        [self addSubview:NET_NAMELabel];
        
        NET_NAMELabelForContent = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(NET_NAMELabel.frame), CGRectGetMinY(NET_NAMELabel.frame), self.frame.size.width - 20, 20)];
        NET_NAMELabelForContent.font = [UIFont systemFontOfSize:14.0f];
        NET_NAMELabelForContent.numberOfLines = 0;
//        NET_NAMELabelForContent.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:NET_NAMELabelForContent];
        
        ALLOC_DATELabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(IP_SECTLabel.frame), CGRectGetMaxY(NET_NAMELabel.frame) + 6, self.frame.size.width - 20, 20)];
        ALLOC_DATELabel.textAlignment = NSTextAlignmentJustified;
        ALLOC_DATELabel.font = [UIFont systemFontOfSize:14.0f];
        [self addSubview:ALLOC_DATELabel];
        
        ALLOC_DATELabelForContent = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(ALLOC_DATELabel.frame), CGRectGetMinY(ALLOC_DATELabel.frame), self.frame.size.width - 20, 20)];
        ALLOC_DATELabelForContent.font = [UIFont systemFontOfSize:14.0f];
        ALLOC_DATELabelForContent.numberOfLines = 0;
//        ALLOC_DATELabelForContent.backgroundColor = [UIColor redColor];
        [self addSubview:ALLOC_DATELabelForContent];
        
        DATA_FROMLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(IP_SECTLabel.frame), CGRectGetMaxY(ALLOC_DATELabel.frame) + 6, self.frame.size.width - 20, 20)];
        DATA_FROMLabel.textColor = [UIColor colorWithRed:170.0 / 255 green:170.0 / 255 blue:170.0 / 255 alpha:1.0f];
        DATA_FROMLabel.textAlignment = NSTextAlignmentJustified;
        DATA_FROMLabel.font = [UIFont systemFontOfSize:14.0f];
        [self addSubview:DATA_FROMLabel];
        
        DATA_FROMLabelForContent = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(DATA_FROMLabel.frame), CGRectGetMinY(DATA_FROMLabel.frame), self.frame.size.width - 20, 20)];
        DATA_FROMLabelForContent.font = [UIFont systemFontOfSize:14.0f];
        DATA_FROMLabelForContent.numberOfLines = 0;
//        DATA_FROMLabelForContent.backgroundColor = [UIColor orangeColor];
        [self addSubview:DATA_FROMLabelForContent];
        
    }
    return self;
}

- (void)cellContent:(RITT_C_IPINFO_Model *)ritt_c_ipinfo_model
{
    IP_SECTLabel.text = [NSString stringWithFormat:@"地址段："];
    IP_SECTLabel.frame = CGRectMake(15, 6, [self widthForString:IP_SECTLabel.text fontSize:14.0 width:0 view:IP_SECTLabel], 14);
    
    IP_SECTLabelForContent.text = [NSString stringWithFormat:@"%@", ritt_c_ipinfo_model.IP_SECT];
    IP_SECTLabelForContent.frame = CGRectMake(CGRectGetMaxX(IP_SECTLabel.frame), CGRectGetMinY(IP_SECTLabel.frame), self.frame.size.width - 30 - IP_SECTLabel.frame.size.width, [self heightForString:IP_SECTLabelForContent.text fontSize:14.0 width:self.frame.size.width - 30 - IP_SECTLabel.frame.size.width]);
    
    CUSTOMERLabel.text = [NSString stringWithFormat:@"使用单位："];
    CUSTOMERLabel.frame = CGRectMake(CGRectGetMinX(IP_SECTLabel.frame), CGRectGetMaxY(IP_SECTLabelForContent.frame) + 6, [self widthForString:CUSTOMERLabel.text fontSize:14.0 width:0 view:CUSTOMERLabel], 14);
    
    CUSTOMERLabelForContent.text = [NSString stringWithFormat:@"%@", ritt_c_ipinfo_model.CUSTOMER];
    CUSTOMERLabelForContent.frame = CGRectMake(CGRectGetMaxX(CUSTOMERLabel.frame), CGRectGetMinY(CUSTOMERLabel.frame), self.frame.size.width - 30 - CUSTOMERLabel.frame.size.width, [self heightForString:CUSTOMERLabelForContent.text fontSize:14.0 width:self.frame.size.width - 30 - CUSTOMERLabel.frame.size.width]);
    
    NET_NAMELabel.text = [NSString stringWithFormat:@"使用网络："];
    NET_NAMELabel.frame = CGRectMake(CGRectGetMinX(IP_SECTLabel.frame), CGRectGetMaxY(CUSTOMERLabelForContent.frame) + 6, [self widthForString:NET_NAMELabel.text fontSize:14.0 width:0 view:NET_NAMELabel], 14);
    
    NET_NAMELabelForContent.text = [NSString stringWithFormat:@"%@", ritt_c_ipinfo_model.NET_NAME];
    NET_NAMELabelForContent.frame = CGRectMake(CGRectGetMaxX(NET_NAMELabel.frame), CGRectGetMinY(NET_NAMELabel.frame), self.frame.size.width - 30 - NET_NAMELabel.frame.size.width, [self heightForString:NET_NAMELabelForContent.text fontSize:14.0 width:self.frame.size.width - 30 - NET_NAMELabel.frame.size.width]);
    
    ALLOC_DATELabel.text = [NSString stringWithFormat:@"分配日期："];
    ALLOC_DATELabel.frame = CGRectMake(CGRectGetMinX(IP_SECTLabel.frame), CGRectGetMaxY(NET_NAMELabelForContent.frame) + 6, [self widthForString:ALLOC_DATELabel.text fontSize:14.0 width:0 view:ALLOC_DATELabel], 14);
    
    ALLOC_DATELabelForContent.text = [NSString stringWithFormat:@"%@", ritt_c_ipinfo_model.ALLOC_DATE];
    ALLOC_DATELabelForContent.frame = CGRectMake(CGRectGetMaxX(ALLOC_DATELabel.frame), CGRectGetMinY(ALLOC_DATELabel.frame), self.frame.size.width - 30 - ALLOC_DATELabel.frame.size.width, [self heightForString:ALLOC_DATELabelForContent.text fontSize:14.0 width:self.frame.size.width - 30 - ALLOC_DATELabel.frame.size.width]);
    
    DATA_FROMLabel.text = [NSString stringWithFormat:@"数据来源："];
    DATA_FROMLabel.frame = CGRectMake(CGRectGetMinX(IP_SECTLabel.frame), CGRectGetMaxY(ALLOC_DATELabelForContent.frame) + 6, [self widthForString:DATA_FROMLabel.text fontSize:14.0 width:0 view:DATA_FROMLabel], 14);
    
    DATA_FROMLabelForContent.text = [NSString stringWithFormat:@"%@", ritt_c_ipinfo_model.DATA_FROM];
    DATA_FROMLabelForContent.frame = CGRectMake(CGRectGetMaxX(DATA_FROMLabel.frame), CGRectGetMinY(DATA_FROMLabel.frame), self.frame.size.width - 30 - DATA_FROMLabel.frame.size.width, [self heightForString:DATA_FROMLabelForContent.text fontSize:14.0 width:self.frame.size.width - 30 - DATA_FROMLabel.frame.size.width]);
    
}

#pragma mark - 计算text宽度
- (float)widthForString:(NSString *)string fontSize:(float)fontSize width:(float)width view:(UIView *)view
{
    CGSize sizeToFit = [string sizeWithFont:[UIFont systemFontOfSize:fontSize] constrainedToSize:CGSizeMake(MAXFLOAT, view.frame.size.height)];
    return sizeToFit.width;
}

- (float)heightForString:(NSString *)string fontSize:(float)fontSize width:(float)width
{
    CGSize sizeToFit = [string sizeWithFont:[UIFont systemFontOfSize:fontSize] constrainedToSize:CGSizeMake(width, CGFLOAT_MAX) lineBreakMode:NSLineBreakByWordWrapping];
    return sizeToFit.height;
}

//
+ (float)heightForCUSTOMERLabel:(RITT_C_IPINFO_Model *)ritt_c_ipinfo_model
{
    CGSize customer_size = [ritt_c_ipinfo_model.CUSTOMER sizeWithFont:[UIFont systemFontOfSize:14.0f] constrainedToSize:CGSizeMake(220, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
    return customer_size.height;
}

+ (float)heightForNet_NameLabel:(RITT_C_IPINFO_Model *)ritt_c_ipinfo_model
{
    CGSize net_name_size = [ritt_c_ipinfo_model.NET_NAME sizeWithFont:[UIFont systemFontOfSize:14.0f] constrainedToSize:CGSizeMake(220, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
    return net_name_size.height;
}

+ (float)heightForIP_SECTLabel:(RITT_C_IPINFO_Model *)ritt_c_ipinfo_model
{
    CGSize ip_sect_size = [ritt_c_ipinfo_model.IP_SECT sizeWithFont:[UIFont systemFontOfSize:14.0f] constrainedToSize:CGSizeMake(220, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
    return ip_sect_size.height;
}

+ (float)heightForALLOC_DATELabel:(RITT_C_IPINFO_Model *)ritt_c_ipinfo_model
{
    CGSize alloc_date_size = [ritt_c_ipinfo_model.ALLOC_DATE sizeWithFont:[UIFont systemFontOfSize:14.0f] constrainedToSize:CGSizeMake(220, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
    return alloc_date_size.height;
}

+ (float)heightForDATA_FROMLabel:(RITT_C_IPINFO_Model *)ritt_c_ipinfo_model
{
    CGSize data_from_size = [ritt_c_ipinfo_model.DATA_FROM sizeWithFont:[UIFont systemFontOfSize:14.0f] constrainedToSize:CGSizeMake(220, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
    return data_from_size.height;
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
