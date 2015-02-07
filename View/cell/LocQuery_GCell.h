//
//  LocQuery_GCell.h
//  RITTSearchPlatform
//
//  Created by wangjingtuan on 14-10-12.
//  Copyright (c) 2014年 RITT. All rights reserved.
//

#import "BaseCell.h"

@class RITT_C_CODE_Model;
@interface LocQuery_GCell : BaseCell

@property (nonatomic, retain) UILabel *phoneNumberLabel;
@property (nonatomic, retain) UILabel *phoneNameLabel;
@property (nonatomic, retain) UILabel *locLabel;

- (void)cellContent:(RITT_C_CODE_Model *)ritt_c_code_model;

@end
