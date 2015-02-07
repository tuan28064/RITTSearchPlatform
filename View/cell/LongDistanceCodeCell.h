//
//  LongDistanceCodeCell.h
//  RITTSearchPlatform
//
//  Created by wangjingtuan on 14-9-28.
//  Copyright (c) 2014年 RITT. All rights reserved.
//

#import "BaseCell.h"

@class RITT_C_LOC_CODE_Model;
@interface LongDistanceCodeCell : BaseCell

@property (nonatomic, retain) UILabel *longDistanceCodeLabel;
@property (nonatomic, retain) UILabel *longDistanceLocationLabel;

- (void)cellContent:(RITT_C_LOC_CODE_Model *)c_code_model;

@end
