//
//  LongDistanceCodeCell.m
//  RITTSearchPlatform
//
//  Created by wangjingtuan on 14-9-28.
//  Copyright (c) 2014年 RITT. All rights reserved.
//

#import "LongDistanceCodeCell.h"
#import "RITT_C_LOC_CODE_Model.h"

@implementation LongDistanceCodeCell

@synthesize longDistanceCodeLabel;
@synthesize longDistanceLocationLabel;

- (void)dealloc
{
    [longDistanceCodeLabel release], longDistanceCodeLabel = nil;
    [longDistanceLocationLabel release], longDistanceLocationLabel = nil;
    [super dealloc];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        //长途区号
        longDistanceCodeLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 15, 80, 16)];
        longDistanceCodeLabel.backgroundColor = [UIColor clearColor];
        longDistanceCodeLabel.textColor = [UIColor colorWithRed:0 / 255 green:0 / 255 blue:139.0 / 255 alpha:1.0f];
        longDistanceCodeLabel.font = [UIFont systemFontOfSize:15.0];
        [self.contentView addSubview:longDistanceCodeLabel];
        
        //所属省份
        longDistanceLocationLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width - 15 - 120, CGRectGetMinX(longDistanceCodeLabel.frame), 120, 16)];
        longDistanceLocationLabel.backgroundColor = [UIColor clearColor];
        longDistanceLocationLabel.font = [UIFont systemFontOfSize:15.0f];
        [self.contentView addSubview:longDistanceLocationLabel];
        
    }
    return self;
}

- (void)cellContent:(RITT_C_LOC_CODE_Model *)c_loc_code_model
{
    longDistanceCodeLabel.text = [NSString stringWithFormat:@"%@", c_loc_code_model.CODE];
    longDistanceLocationLabel.text = [NSString stringWithFormat:@"%@ %@", c_loc_code_model.PROVINCE, c_loc_code_model.NAME];
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
