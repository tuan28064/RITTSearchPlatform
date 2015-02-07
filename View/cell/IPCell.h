//
//  IPCell.h
//  RITTSearchPlatform
//
//  Created by wangjingtuan on 14/10/26.
//  Copyright (c) 2014年 RITT. All rights reserved.
//

#import "BaseCell.h"

@class RITT_C_IPINFO_Model;
@interface IPCell : BaseCell

@property (nonatomic, retain) UILabel *IP_SECTLabel;
@property (nonatomic, retain) UILabel *CUSTOMERLabel;
@property (nonatomic, retain) UILabel *NET_NAMELabel;
@property (nonatomic, retain) UILabel *ALLOC_DATELabel;
@property (nonatomic, retain) UILabel *DATA_FROMLabel;

@property (nonatomic, retain) UILabel *IP_SECTLabelForContent;
@property (nonatomic, retain) UILabel *CUSTOMERLabelForContent;
@property (nonatomic, retain) UILabel *NET_NAMELabelForContent;
@property (nonatomic, retain) UILabel *ALLOC_DATELabelForContent;
@property (nonatomic, retain) UILabel *DATA_FROMLabelForContent;

- (void)cellContent:(RITT_C_IPINFO_Model *)ritt_c_ipinfo_model;
+ (float)heightForCUSTOMERLabel:(RITT_C_IPINFO_Model *)ritt_c_ipinfo_model;
+ (float)heightForNet_NameLabel:(RITT_C_IPINFO_Model *)ritt_c_ipinfo_model;
+ (float)heightForIP_SECTLabel:(RITT_C_IPINFO_Model *)ritt_c_ipinfo_model;
+ (float)heightForALLOC_DATELabel:(RITT_C_IPINFO_Model *)ritt_c_ipinfo_model;
+ (float)heightForDATA_FROMLabel:(RITT_C_IPINFO_Model *)ritt_c_ipinfo_model;

@end
