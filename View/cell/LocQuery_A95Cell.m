//
//  LocQuery_A95Cell.m
//  RITTSearchPlatform
//
//  Created by wangjingtuan on 14-10-12.
//  Copyright (c) 2014年 RITT. All rights reserved.
//

#import "LocQuery_A95Cell.h"
#import "RITT_C_CODE_Model.h"
#import "RITT_C_DOMAIN_Model.h"
#import "NSDate+Category.h"

@implementation LocQuery_A95Cell

@synthesize phoneNameLabel;
@synthesize phoneNumberLabel;
@synthesize expiretimeLabel;
@synthesize rightAngleImageView;

- (void)dealloc
{
    [phoneNumberLabel release], phoneNumberLabel = nil;
    [phoneNameLabel release], phoneNameLabel = nil;
    [expiretimeLabel release], expiretimeLabel = nil;
    [rightAngleImageView release], rightAngleImageView = nil;
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
        
        //码号
        phoneNumberLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 6, 180, 18)];
        phoneNumberLabel.backgroundColor = [UIColor clearColor];
        phoneNumberLabel.font = [UIFont systemFontOfSize:16.0f];
        phoneNumberLabel.textColor = [UIColor colorWithRed:0.0 / 255 green:0.0 / 255 blue:139.0 / 255 alpha:1.0f];
        [self.contentView addSubview:phoneNumberLabel];
        
        //公司名称
        phoneNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(phoneNumberLabel.frame), CGRectGetMaxY(phoneNumberLabel.frame) + 2, 180, 12)];
        phoneNameLabel.backgroundColor = [UIColor clearColor];
        phoneNameLabel.font = [UIFont systemFontOfSize:12.0f];
        [self.contentView addSubview:phoneNameLabel];
        
        //过期时间
        expiretimeLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width - 15 - 120, 22, 120, 10)];
        expiretimeLabel.backgroundColor = [UIColor clearColor];
        expiretimeLabel.font = [UIFont systemFontOfSize:10.0f];
        [self.contentView addSubview:expiretimeLabel];
        
        //右侧箭头
        rightAngleImageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width - 8 - 8, self.frame.size.height / 2 - 3, 7, 14)];
        rightAngleImageView.image = [UIImage imageNamed:@"home_rightAngle"];
        [self.contentView addSubview:rightAngleImageView];
    }
    return self;

}

- (void)cellContent:(RITT_C_CODE_Model *)ritt_c_code_model
{
//    if ([ritt_c_code_model.CODE rangeOfString:@"("].location != NSNotFound) {
//        phoneNumberLabel.text = [ritt_c_code_model.CODE substringToIndex:[ritt_c_code_model.CODE rangeOfString:@"("].location];
//    } else {
        phoneNumberLabel.text = ritt_c_code_model.CODE;
//    }
    
    phoneNameLabel.text = ritt_c_code_model.CUS_NAME;
    phoneNameLabel.frame = CGRectMake(CGRectGetMinX(phoneNumberLabel.frame), CGRectGetMaxY(phoneNumberLabel.frame) + 4, 180, [self heightForString:phoneNameLabel.text fontSize:12.0f width:180]);
    phoneNameLabel.numberOfLines = 0;
    
    if ([NSDate isDateExpire:ritt_c_code_model.EXPIRETIME]) {
        expiretimeLabel.textColor = [UIColor redColor];
    } else {
        expiretimeLabel.textColor = [UIColor blackColor];
    }
    
    if (![ritt_c_code_model.EXPIRETIME isEqualToString:@""]) {
        expiretimeLabel.text = [NSString stringWithFormat:@"有效期限：%@",ritt_c_code_model.EXPIRETIME];
    } else {
        expiretimeLabel.text = [NSString stringWithFormat:@"有效期限：未知"];
    }
    
    rightAngleImageView.frame = CGRectMake(self.frame.size.width - 8 - 8, CGRectGetMaxY(phoneNumberLabel.frame) - 6, 7, 14);

    expiretimeLabel.frame = CGRectMake(CGRectGetMaxX(phoneNameLabel.frame) + 14, CGRectGetMaxY(rightAngleImageView.frame), [self widthForString:expiretimeLabel.text fontSize:10.0 width:0 view:expiretimeLabel], 10);
    
}

- (void)cellContentForOther:(RITT_C_CODE_Model *)ritt_c_code_model
{
//    if ([ritt_c_code_model.CODE rangeOfString:@"("].location != NSNotFound) {
//        phoneNumberLabel.text = [ritt_c_code_model.CODE substringToIndex:[ritt_c_code_model.CODE rangeOfString:@"("].location];
//    } else {
        phoneNumberLabel.text = ritt_c_code_model.CODE;
//    }
    
    phoneNameLabel.text = ritt_c_code_model.CUS_NAME;
    phoneNameLabel.frame = CGRectMake(CGRectGetMinX(phoneNumberLabel.frame), CGRectGetMaxY(phoneNumberLabel.frame) + 4, 180, [self heightForString:phoneNameLabel.text fontSize:12.0f width:180]);
    phoneNameLabel.numberOfLines = 0;
    
    if ([NSDate isDateExpire:ritt_c_code_model.EXPIRETIME]) {
        expiretimeLabel.textColor = [UIColor redColor];
    } else {
        expiretimeLabel.textColor = [UIColor blackColor];
    }
    expiretimeLabel.text = [NSString stringWithFormat:@"%@",ritt_c_code_model.EXPIRETIME];
    rightAngleImageView.frame = CGRectMake(self.frame.size.width - 8 - 8, CGRectGetMaxY(phoneNumberLabel.frame) - 6, 7, 14);
    
    expiretimeLabel.frame = CGRectMake(self.frame.size.width - 8 - [self widthForString:expiretimeLabel.text fontSize:10.0 width:0 view:expiretimeLabel], CGRectGetMaxY(rightAngleImageView.frame), [self widthForString:expiretimeLabel.text fontSize:10.0 width:0 view:expiretimeLabel], 10);

}


- (void)cellContentForDomain:(RITT_C_DOMAIN_Model *)ritt_c_domain_model
{
    phoneNumberLabel.text = ritt_c_domain_model.ID;

    phoneNameLabel.text = ritt_c_domain_model.DOMAIN_NAME;
    phoneNameLabel.frame = CGRectMake(CGRectGetMinX(phoneNumberLabel.frame), CGRectGetMaxY(phoneNumberLabel.frame) + 4, 180, [self heightForString:phoneNameLabel.text fontSize:12.0f width:180]);
    phoneNameLabel.numberOfLines = 0;
    
//    
//    if ([NSDate isDateExpire:ritt_c_domain_model.REG_TIME]) {
//        expiretimeLabel.textColor = [UIColor redColor];
//    } else {
//        expiretimeLabel.textColor = [UIColor blackColor]; 
//    }
    expiretimeLabel.text = [NSString stringWithFormat:@"注册时间：%@",ritt_c_domain_model.REG_TIME];
    rightAngleImageView.frame = CGRectMake(self.frame.size.width - 8 - 8, CGRectGetMaxY(phoneNumberLabel.frame) - 6, 7, 14);
    
    expiretimeLabel.frame = CGRectMake(CGRectGetMaxX(phoneNameLabel.frame) + 14, CGRectGetMaxY(rightAngleImageView.frame), [self widthForString:expiretimeLabel.text fontSize:10.0 width:0 view:expiretimeLabel], 10);
}

#pragma mark - 计算text高度
- (float)heightForString:(NSString *)string fontSize:(float)fontSize width:(float)width
{
    CGSize sizeToFit = [string sizeWithFont:[UIFont systemFontOfSize:fontSize] constrainedToSize:CGSizeMake(width, CGFLOAT_MAX) lineBreakMode:NSLineBreakByWordWrapping];
    return sizeToFit.height;
}

#pragma mark - 计算text宽度
- (float)widthForString:(NSString *)string fontSize:(float)fontSize width:(float)width view:(UIView *)view
{
    CGSize sizeToFit = [string sizeWithFont:[UIFont systemFontOfSize:fontSize] constrainedToSize:CGSizeMake(MAXFLOAT, view.frame.size.height)];
    return sizeToFit.width;
}

+ (float)heightForNumberLabel:(RITT_C_CODE_Model *)ritt_c_code_model
{
    CGSize size = [ritt_c_code_model.CODE sizeWithFont:[UIFont systemFontOfSize:16.0f] constrainedToSize:CGSizeMake(180, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
    return size.height;
}

+ (float)heightForNameLabel:(RITT_C_CODE_Model *)ritt_c_code_model
{
    CGSize size = [ritt_c_code_model.CUS_NAME sizeWithFont:[UIFont systemFontOfSize:12.0f] constrainedToSize:CGSizeMake(180, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
    return size.height;
}

+ (float)heightForNumberLabelForDomain:(RITT_C_DOMAIN_Model *)ritt_c_domain_model
{
    CGSize size = [ritt_c_domain_model.ID sizeWithFont:[UIFont systemFontOfSize:16.0f] constrainedToSize:CGSizeMake(180, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
    return size.height;
}

+ (float)heightForNameLabelForDomain:(RITT_C_DOMAIN_Model *)ritt_c_domain_model
{
    CGSize size = [ritt_c_domain_model.DOMAIN_NAME sizeWithFont:[UIFont systemFontOfSize:12.0f] constrainedToSize:CGSizeMake(180, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
    return size.height;
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
