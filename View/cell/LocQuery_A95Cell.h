//
//  LocQuery_A95Cell.h
//  RITTSearchPlatform
//
//  Created by wangjingtuan on 14-10-12.
//  Copyright (c) 2014年 RITT. All rights reserved.
//

#import "BaseCell.h"

@class RITT_C_CODE_Model;
@class RITT_C_DOMAIN_Model;
@interface LocQuery_A95Cell : BaseCell

@property (nonatomic, retain) UILabel *phoneNumberLabel;
@property (nonatomic, retain) UILabel *phoneNameLabel;
@property (nonatomic, retain) UILabel *expiretimeLabel;
@property (nonatomic, retain) UIImageView *rightAngleImageView;

- (void)cellContent:(RITT_C_CODE_Model *)ritt_c_code_model;

+ (float)heightForNumberLabel:(RITT_C_CODE_Model *)ritt_c_code_model;

+ (float)heightForNameLabel:(RITT_C_CODE_Model *)ritt_c_code_model;

+ (float)heightForNumberLabelForDomain:(RITT_C_DOMAIN_Model *)ritt_c_domain_model;

+ (float)heightForNameLabelForDomain:(RITT_C_DOMAIN_Model *)ritt_c_domain_model;

- (void)cellContentForDomain:(RITT_C_DOMAIN_Model *)ritt_c_domain_model;

- (void)cellContentForOther:(RITT_C_CODE_Model *)ritt_c_code_model;

//- (void)cellContentFor95:(RITT_C_CODE_Model *)ritt_c_code_model;

@end
