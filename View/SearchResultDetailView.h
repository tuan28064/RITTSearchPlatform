//
//  SearchResultDetailView.h
//  RITTSearchPlatform
//
//  Created by wangjingtuan on 14-10-12.
//  Copyright (c) 2014年 RITT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchResultDetailView : UIView

@property (nonatomic, retain) UILabel *CUS_NAMELabel;
@property (nonatomic, retain) UILabel *EXPIRETIMELabel;
@property (nonatomic, retain) UILabel *PUSAGELabel;
@property (nonatomic, retain) UILabel *LOC_NAMELabel;
@property (nonatomic, retain) UILabel *QUALIFYDOCNOLabel;
@property (nonatomic, retain) UILabel *ISFEELabel;
@property (nonatomic, retain) UILabel *CONTACTPERSONLabel;
@property (nonatomic, retain) UILabel *CONTACTPHONELabel;
@property (nonatomic, retain) UILabel *CONTACTMOBILELabel;
@property (nonatomic, retain) UILabel *ADDRESSLabel;

@property (nonatomic, retain) UILabel *CUS_NAMELabelForContent;
@property (nonatomic, retain) UILabel *EXPIRETIMELabelForContent;
@property (nonatomic, retain) UILabel *PUSAGELabelForContent;
@property (nonatomic, retain) UILabel *LOC_NAMELabelForContent;
@property (nonatomic, retain) UILabel *QUALIFYDOCNOLabelForContent;
@property (nonatomic, retain) UILabel *ISFEELabelForContent;
@property (nonatomic, retain) UILabel *CONTACTPERSONLabelForContent;
@property (nonatomic, retain) UILabel *CONTACTPHONELabelForContent;
@property (nonatomic, retain) UILabel *CONTACTMOBILELabelForContent;
@property (nonatomic, retain) UILabel *ADDRESSLabelForContent;

- (void)content:(NSArray *)content;

@end
