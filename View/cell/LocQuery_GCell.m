//
//  LocQuery_GCell.m
//  RITTSearchPlatform
//
//  Created by wangjingtuan on 14-10-12.
//  Copyright (c) 2014年 RITT. All rights reserved.
//

#import "LocQuery_GCell.h"
#import "RITT_C_CODE_Model.h"

@implementation LocQuery_GCell

@synthesize phoneNameLabel;
@synthesize phoneNumberLabel;
@synthesize locLabel;

- (void)dealloc
{
    [phoneNumberLabel release], phoneNumberLabel = nil;
    [phoneNameLabel release], phoneNameLabel = nil;
    [locLabel release], locLabel = nil;
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
        
        //电话号码
        phoneNumberLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 6, 180, 12)];
        phoneNumberLabel.backgroundColor = [UIColor clearColor];
        phoneNumberLabel.font = [UIFont systemFontOfSize:14.0f];
        phoneNumberLabel.textColor = [UIColor colorWithRed:0 / 255 green:0 / 255 blue:139.0 / 255 alpha:1.0f];
        [self.contentView addSubview:phoneNumberLabel];
        
        //所属公司
        phoneNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(phoneNumberLabel.frame), CGRectGetMaxY(phoneNumberLabel.frame) + 8, 180, 12)];
        phoneNameLabel.backgroundColor = [UIColor clearColor];
        phoneNameLabel.font = [UIFont systemFontOfSize:12.0f];
        [self.contentView addSubview:phoneNameLabel];
        
        //所属地区
        locLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width - 15 - 80, 15, 120, 12)];
        locLabel.backgroundColor = [UIColor clearColor];
        locLabel.font = [UIFont systemFontOfSize:12.0f];
        [self.contentView addSubview:locLabel];
    }
    return self;
    
}

- (void)cellContent:(RITT_C_CODE_Model *)ritt_c_code_model
{
    phoneNumberLabel.text = ritt_c_code_model.CODE;
    phoneNameLabel.text = ritt_c_code_model.CUS_NAME;
//    if (ritt_c_code_model.MANAGEDEPT_EID && ritt_c_code_model.LOC_NAME) {
//        locLabel.text = [NSString stringWithFormat:@"%@ %@", ritt_c_code_model.MANAGEDEPT_EID, ritt_c_code_model.LOC_NAME];
//    } else if (ritt_c_code_model.MANAGEDEPT_EID) {
//        locLabel.text = [NSString stringWithFormat:@"%@ %@", ritt_c_code_model.MANAGEDEPT_EID, ritt_c_code_model.LOC_NAME];
//    }
    if (ritt_c_code_model.MANAGEDEPT_EID) {
        locLabel.text = [NSString stringWithFormat:@"%@ %@", ritt_c_code_model.MANAGEDEPT_EID, ritt_c_code_model.LOC_NAME];
    } else {
        locLabel.text = [NSString stringWithFormat:@"%@", ritt_c_code_model.LOC_NAME];
    }
    
    locLabel.frame = CGRectMake(self.frame.size.width - 40 - [self widthForString:locLabel.text fontSize:12.0 width:0 view:locLabel], 15, [self widthForString:locLabel.text fontSize:12.0 width:0 view:locLabel], 12);
}

#pragma mark - 计算text宽度
- (float)widthForString:(NSString *)string fontSize:(float)fontSize width:(float)width view:(UIView *)view
{
    CGSize sizeToFit = [string sizeWithFont:[UIFont systemFontOfSize:fontSize] constrainedToSize:CGSizeMake(MAXFLOAT, view.frame.size.height)];
    return sizeToFit.width;
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
