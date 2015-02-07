//
//  DomainSearchResultDetail.h
//  RITTSearchPlatform
//
//  Created by wangjingtuan on 14-10-16.
//  Copyright (c) 2014年 RITT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DomainSearchResultDetail : UIView

@property (nonatomic, retain) UILabel *domainLabel;
@property (nonatomic, retain) UILabel *statusLabel;
@property (nonatomic, retain) UILabel *allUnitLabel;
@property (nonatomic, retain) UILabel *registerUnitLabel;
@property (nonatomic, retain) UILabel *dnsServerLabel;
@property (nonatomic, retain) UILabel *registerTimeLabel;
@property (nonatomic, retain) UILabel *modifiedTimeLabel;

- (void)content:(NSArray *)content;

@end
