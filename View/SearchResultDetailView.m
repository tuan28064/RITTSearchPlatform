//
//  SearchResultDetailView.m
//  RITTSearchPlatform
//
//  Created by wangjingtuan on 14-10-12.
//  Copyright (c) 2014年 RITT. All rights reserved.
//

#import "SearchResultDetailView.h"

@implementation SearchResultDetailView

@synthesize CUS_NAMELabel;
@synthesize EXPIRETIMELabel;
@synthesize PUSAGELabel;
@synthesize LOC_NAMELabel;
@synthesize QUALIFYDOCNOLabel;
@synthesize ISFEELabel;
@synthesize CONTACTPERSONLabel;
@synthesize CONTACTPHONELabel;
@synthesize CONTACTMOBILELabel;
@synthesize ADDRESSLabel;

@synthesize CUS_NAMELabelForContent;
@synthesize EXPIRETIMELabelForContent;
@synthesize PUSAGELabelForContent;
@synthesize LOC_NAMELabelForContent;
@synthesize QUALIFYDOCNOLabelForContent;
@synthesize ISFEELabelForContent;
@synthesize CONTACTMOBILELabelForContent;
@synthesize CONTACTPERSONLabelForContent;
@synthesize CONTACTPHONELabelForContent;
@synthesize ADDRESSLabelForContent;

- (void)dealloc
{
    [CUS_NAMELabel release], CUS_NAMELabel = nil;
    [EXPIRETIMELabel release], EXPIRETIMELabel = nil;
    [PUSAGELabel release], PUSAGELabel = nil;
    [LOC_NAMELabel release], LOC_NAMELabel = nil;
    [QUALIFYDOCNOLabel release], QUALIFYDOCNOLabel = nil;
    [ISFEELabel release], ISFEELabel = nil;
    [CONTACTMOBILELabel release], CONTACTMOBILELabel = nil;
    [CONTACTPHONELabel release], CONTACTPHONELabel = nil;
    [CONTACTPERSONLabel release], CONTACTPERSONLabel = nil;
    [ADDRESSLabel release], ADDRESSLabel = nil;
    
    [CUS_NAMELabelForContent release], CUS_NAMELabelForContent = nil;
    [EXPIRETIMELabelForContent release], EXPIRETIMELabelForContent = nil;
    [PUSAGELabelForContent release], PUSAGELabelForContent = nil;
    [LOC_NAMELabelForContent release], LOC_NAMELabelForContent = nil;
    [QUALIFYDOCNOLabelForContent release], QUALIFYDOCNOLabelForContent = nil;
    [ISFEELabelForContent release], ISFEELabelForContent = nil;
    [CONTACTMOBILELabelForContent release], CONTACTMOBILELabelForContent = nil;
    [CONTACTPHONELabelForContent release], CONTACTPHONELabelForContent = nil;
    [CONTACTPERSONLabelForContent release], CONTACTPERSONLabelForContent = nil;
    [ADDRESSLabelForContent release], ADDRESSLabelForContent = nil;
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        
        // Initialization code
        CUS_NAMELabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, self.frame.size.width, 40)];
        CUS_NAMELabel.backgroundColor = [UIColor clearColor];
        CUS_NAMELabel.numberOfLines = 0;
        CUS_NAMELabel.font = [UIFont systemFontOfSize:14.0f];
        [self addSubview:CUS_NAMELabel];
        
        CUS_NAMELabelForContent = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(CUS_NAMELabel.frame), CGRectGetMinY(CUS_NAMELabel.frame), self.frame.size.width, 40)];
        CUS_NAMELabelForContent.backgroundColor = [UIColor clearColor];
        CUS_NAMELabelForContent.numberOfLines = 0;
        CUS_NAMELabelForContent.font = [UIFont systemFontOfSize:14.0f];
        [self addSubview:CUS_NAMELabelForContent];
        
        EXPIRETIMELabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(CUS_NAMELabel.frame) + 6, self.frame.size.width, 40)];
        EXPIRETIMELabel.backgroundColor = [UIColor clearColor];
        EXPIRETIMELabel.numberOfLines = 0;
        EXPIRETIMELabel.font = [UIFont systemFontOfSize:14.0f];
        [self addSubview:EXPIRETIMELabel];
        
        EXPIRETIMELabelForContent = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(EXPIRETIMELabel.frame), CGRectGetMaxY(CUS_NAMELabel.frame) + 6, self.frame.size.width, 40)];
        EXPIRETIMELabelForContent.backgroundColor = [UIColor clearColor];
        EXPIRETIMELabelForContent.numberOfLines = 0;
        EXPIRETIMELabelForContent.font = [UIFont systemFontOfSize:14.0f];
        [self addSubview:EXPIRETIMELabelForContent];
        
        PUSAGELabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(EXPIRETIMELabel.frame) + 6, self.frame.size.width, 40)];
        PUSAGELabel.backgroundColor = [UIColor clearColor];
        PUSAGELabel.numberOfLines = 0;
        PUSAGELabel.font = [UIFont systemFontOfSize:14.0f];
        [self addSubview:PUSAGELabel];
        
        PUSAGELabelForContent = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(PUSAGELabel.frame), CGRectGetMaxY(EXPIRETIMELabel.frame) + 6, self.frame.size.width, 40)];
        PUSAGELabelForContent.backgroundColor = [UIColor clearColor];
        PUSAGELabelForContent.numberOfLines = 0;
        PUSAGELabelForContent.font = [UIFont systemFontOfSize:14.0f];
        [self addSubview:PUSAGELabelForContent];
        
        LOC_NAMELabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(PUSAGELabel.frame) + 6, self.frame.size.width, 40)];
        LOC_NAMELabel.backgroundColor = [UIColor clearColor];
        LOC_NAMELabel.numberOfLines = 0;
        LOC_NAMELabel.font = [UIFont systemFontOfSize:14.0f];
        [self addSubview:LOC_NAMELabel];
        
        LOC_NAMELabelForContent = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(LOC_NAMELabel.frame), CGRectGetMaxY(PUSAGELabel.frame) + 6, self.frame.size.width, 40)];
        LOC_NAMELabelForContent.backgroundColor = [UIColor clearColor];
        LOC_NAMELabelForContent.numberOfLines = 0;
        LOC_NAMELabelForContent.font = [UIFont systemFontOfSize:14.0f];
        [self addSubview:LOC_NAMELabelForContent];
        
        QUALIFYDOCNOLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(LOC_NAMELabel.frame) + 6, self.frame.size.width, 40)];
        QUALIFYDOCNOLabel.backgroundColor = [UIColor clearColor];
        QUALIFYDOCNOLabel.numberOfLines = 0;
        QUALIFYDOCNOLabel.font = [UIFont systemFontOfSize:14.0f];
        [self addSubview:QUALIFYDOCNOLabel];
        
        QUALIFYDOCNOLabelForContent = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(QUALIFYDOCNOLabel.frame), CGRectGetMaxY(LOC_NAMELabel.frame) + 6, self.frame.size.width, 40)];
        QUALIFYDOCNOLabelForContent.backgroundColor = [UIColor clearColor];
        QUALIFYDOCNOLabelForContent.numberOfLines = 0;
        QUALIFYDOCNOLabelForContent.font = [UIFont systemFontOfSize:14.0f];
        [self addSubview:QUALIFYDOCNOLabelForContent];
        
        ISFEELabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(QUALIFYDOCNOLabel.frame) + 6, self.frame.size.width, 40)];
        ISFEELabel.backgroundColor = [UIColor clearColor];
        ISFEELabel.numberOfLines = 0;
        ISFEELabel.font = [UIFont systemFontOfSize:14.0f];
        [self addSubview:ISFEELabel];
        
        ISFEELabelForContent = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(ISFEELabel.frame), CGRectGetMaxY(QUALIFYDOCNOLabel.frame) + 6, self.frame.size.width, 40)];
        ISFEELabelForContent.backgroundColor = [UIColor clearColor];
        ISFEELabelForContent.numberOfLines = 0;
        ISFEELabelForContent.font = [UIFont systemFontOfSize:14.0f];
        [self addSubview:ISFEELabelForContent];
        
        CONTACTPERSONLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(ISFEELabel.frame) + 6, self.frame.size.width, 40)];
        CONTACTPERSONLabel.backgroundColor = [UIColor clearColor];
        CONTACTPERSONLabel.numberOfLines = 0;
        CONTACTPERSONLabel.font = [UIFont systemFontOfSize:14.0f];
        [self addSubview:CONTACTPERSONLabel];
        
        CONTACTPERSONLabelForContent = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(CONTACTPERSONLabel.frame), CGRectGetMaxY(ISFEELabel.frame) + 6, self.frame.size.width, 40)];
        CONTACTPERSONLabelForContent.backgroundColor = [UIColor clearColor];
        CONTACTPERSONLabelForContent.numberOfLines = 0;
        CONTACTPERSONLabelForContent.font = [UIFont systemFontOfSize:14.0f];
        [self addSubview:CONTACTPERSONLabelForContent];
        
        CONTACTPHONELabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(CONTACTPERSONLabel.frame) + 6, self.frame.size.width, 40)];
        CONTACTPHONELabel.backgroundColor = [UIColor clearColor];
        CONTACTPHONELabel.numberOfLines = 0;
        CONTACTPHONELabel.userInteractionEnabled = YES;
        CONTACTPHONELabel.font = [UIFont systemFontOfSize:14.0f];
        [self addSubview:CONTACTPHONELabel];
        
        CONTACTPHONELabelForContent = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(CONTACTPHONELabel.frame), CGRectGetMaxY(CONTACTPERSONLabel.frame) + 6, self.frame.size.width, 40)];
        CONTACTPHONELabelForContent.backgroundColor = [UIColor clearColor];
        CONTACTPHONELabelForContent.numberOfLines = 0;
        CONTACTPHONELabelForContent.userInteractionEnabled = YES;
        CONTACTPHONELabelForContent.font = [UIFont systemFontOfSize:14.0f];
        [self addSubview:CONTACTPHONELabelForContent];
        UITapGestureRecognizer *phoneTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(phoneTap:)];
        phoneTap.numberOfTapsRequired = 1;
        [CONTACTPHONELabelForContent addGestureRecognizer:phoneTap];
        [phoneTap release];
        
        CONTACTMOBILELabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(CONTACTPHONELabel.frame) + 6, self.frame.size.width, 40)];
        CONTACTMOBILELabel.backgroundColor = [UIColor clearColor];
        CONTACTMOBILELabel.numberOfLines = 0;
        CONTACTMOBILELabel.userInteractionEnabled = YES;
        CONTACTMOBILELabel.font = [UIFont systemFontOfSize:14.0f];
        [self addSubview:CONTACTMOBILELabel];
        
        CONTACTMOBILELabelForContent = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(CONTACTMOBILELabel.frame), CGRectGetMaxY(CONTACTPHONELabel.frame) + 6, self.frame.size.width, 40)];
        CONTACTMOBILELabelForContent.backgroundColor = [UIColor clearColor];
        CONTACTMOBILELabelForContent.numberOfLines = 0;
        CONTACTMOBILELabelForContent.userInteractionEnabled = YES;
        CONTACTMOBILELabelForContent.font = [UIFont systemFontOfSize:14.0f];
        [self addSubview:CONTACTMOBILELabelForContent];
        UITapGestureRecognizer *mobileTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(mobileTap:)];
        mobileTap.numberOfTapsRequired = 1;
        [CONTACTMOBILELabelForContent addGestureRecognizer:mobileTap];
        [mobileTap release];
        
        ADDRESSLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(CONTACTMOBILELabel.frame) + 6, self.frame.size.width, 40)];
        ADDRESSLabel.backgroundColor = [UIColor clearColor];
        ADDRESSLabel.numberOfLines = 0;
        ADDRESSLabel.font = [UIFont systemFontOfSize:14.0f];
        [self addSubview:ADDRESSLabel];
        
        ADDRESSLabelForContent = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(ADDRESSLabel.frame), CGRectGetMaxY(CONTACTMOBILELabel.frame) + 6, self.frame.size.width, 40)];
        ADDRESSLabelForContent.backgroundColor = [UIColor clearColor];
        ADDRESSLabelForContent.numberOfLines = 0;
        ADDRESSLabelForContent.font = [UIFont systemFontOfSize:14.0f];
        [self addSubview:ADDRESSLabelForContent];
    }
    return self;
}

- (void)content:(NSArray *)content
{
    //使用单位
    CUS_NAMELabel.text = [NSString stringWithFormat:@"使用单位："];
    CUS_NAMELabel.frame = CGRectMake(10, 0, [self widthForString:CUS_NAMELabel.text fontSize:14.0 width:0 view:CUS_NAMELabel], 14.0);
    
    CUS_NAMELabelForContent.text = [NSString stringWithFormat:@"%@", [content objectAtIndex:1]];
    CUS_NAMELabelForContent.frame = CGRectMake(CGRectGetMaxX(CUS_NAMELabel.frame), CGRectGetMinY(CUS_NAMELabel.frame), self.frame.size.width - 20 - CUS_NAMELabel.frame.size.width, [self heightForString:CUS_NAMELabelForContent.text fontSize:14.0f width:self.frame.size.width - 20 - CUS_NAMELabel.frame.size.width]);
    
    //使用期限
    EXPIRETIMELabel.text = [NSString stringWithFormat:@"使用期限："];
    EXPIRETIMELabel.frame = CGRectMake(CGRectGetMinX(CUS_NAMELabel.frame), CGRectGetMaxY(CUS_NAMELabelForContent.frame) + 6, [self widthForString:CUS_NAMELabel.text fontSize:14.0 width:0 view:EXPIRETIMELabel], 14.0);
    
    EXPIRETIMELabelForContent.text = [NSString stringWithFormat:@"%@", [content objectAtIndex:2]];
    EXPIRETIMELabelForContent.frame = CGRectMake(CGRectGetMaxX(EXPIRETIMELabel.frame), CGRectGetMinY(EXPIRETIMELabel.frame), self.frame.size.width - 20 - EXPIRETIMELabel.frame.size.width, [self heightForString:EXPIRETIMELabelForContent.text fontSize:14.0f width:self.frame.size.width - 20 - EXPIRETIMELabel.frame.size.width]);

    //用途
    PUSAGELabel.text = [NSString stringWithFormat:@"用       途："];
    PUSAGELabel.frame = CGRectMake(CGRectGetMinX(CUS_NAMELabel.frame), CGRectGetMaxY(EXPIRETIMELabelForContent.frame) + 6, [self widthForString:PUSAGELabel.text fontSize:14.0 width:0 view:PUSAGELabel], 14.0);
    
    PUSAGELabelForContent.text = [NSString stringWithFormat:@"%@", [content objectAtIndex:4]];
    PUSAGELabelForContent.frame = CGRectMake(CGRectGetMaxX(PUSAGELabel.frame), CGRectGetMinY(PUSAGELabel.frame),self.frame.size.width - 20 - PUSAGELabel.frame.size.width, [self heightForString:PUSAGELabelForContent.text fontSize:14.0f width:self.frame.size.width - 20 - PUSAGELabel.frame.size.width]);
    
    //开通地域
    LOC_NAMELabel.text = [NSString stringWithFormat:@"开通地域："];
    LOC_NAMELabel.frame = CGRectMake(CGRectGetMinX(CUS_NAMELabel.frame), CGRectGetMaxY(PUSAGELabelForContent.frame) + 6, [self widthForString:LOC_NAMELabel.text fontSize:14.0 width:0 view:LOC_NAMELabel], 14.0);
    
    LOC_NAMELabelForContent.text = [NSString stringWithFormat:@"%@", [content objectAtIndex:5]];
    LOC_NAMELabelForContent.frame = CGRectMake(CGRectGetMaxX(LOC_NAMELabel.frame), CGRectGetMinY(LOC_NAMELabel.frame), self.frame.size.width - 20 - LOC_NAMELabel.frame.size.width, [self heightForString:LOC_NAMELabelForContent.text fontSize:14.0f width:self.frame.size.width - 20 - LOC_NAMELabel.frame.size.width]);
    
    
    //批准文号
    QUALIFYDOCNOLabel.text = [NSString stringWithFormat:@"批准文号："];
    QUALIFYDOCNOLabel.frame = CGRectMake(CGRectGetMinX(CUS_NAMELabel.frame), CGRectGetMaxY(LOC_NAMELabelForContent.frame) + 6, [self widthForString:QUALIFYDOCNOLabel.text fontSize:14.0 width:0 view:QUALIFYDOCNOLabel], 14.0);
    
    QUALIFYDOCNOLabelForContent.text = [NSString stringWithFormat:@"%@", [content objectAtIndex:7]];
    QUALIFYDOCNOLabelForContent.frame = CGRectMake(CGRectGetMaxX(QUALIFYDOCNOLabel.frame), CGRectGetMinY(QUALIFYDOCNOLabel.frame),self.frame.size.width - 20 - QUALIFYDOCNOLabel.frame.size.width, [self heightForString:QUALIFYDOCNOLabelForContent.text fontSize:14.0f width:self.frame.size.width - 20 - QUALIFYDOCNOLabel.frame.size.width]);
    
    //是否缴费
    ISFEELabel.text = @"是否缴费：";
    ISFEELabel.frame = CGRectMake(CGRectGetMinX(CUS_NAMELabel.frame), CGRectGetMaxY(QUALIFYDOCNOLabelForContent.frame) + 6, [self widthForString:ISFEELabel.text fontSize:14.0 width:0 view:ISFEELabel], 14.0);
    
    if ([[content objectAtIndex:6]intValue] == 0) {
        ISFEELabelForContent.text = @"是";
    } else if ([[content objectAtIndex:6]intValue] == 1) {
        ISFEELabelForContent.text = @"否";
    } else {
        ISFEELabelForContent.text = @"未知";
    }
    ISFEELabelForContent.frame = CGRectMake(CGRectGetMaxX(ISFEELabel.frame), CGRectGetMinY(ISFEELabel.frame), self.frame.size.width - 20 - ISFEELabel.frame.size.width, [self heightForString:ISFEELabelForContent.text fontSize:14.0f width:self.frame.size.width - 20 - ISFEELabel.frame.size.width]);
    
    //联系人
    CONTACTPERSONLabel.text = [NSString stringWithFormat:@"联  系  人："];
    CONTACTPERSONLabel.frame = CGRectMake(CGRectGetMinX(CUS_NAMELabel.frame), CGRectGetMaxY(ISFEELabelForContent.frame) + 6, [self widthForString:CONTACTPERSONLabel.text fontSize:14.0 width:0 view:CONTACTPERSONLabel], 14.0);
    
    CONTACTPERSONLabelForContent.text = [NSString stringWithFormat:@"%@", [content objectAtIndex:9]];
    CONTACTPERSONLabelForContent.frame = CGRectMake(CGRectGetMaxX(CONTACTPERSONLabel.frame), CGRectGetMinY(CONTACTPERSONLabel.frame), self.frame.size.width - 20 - CONTACTPERSONLabel.frame.size.width, [self heightForString:CONTACTPERSONLabelForContent.text fontSize:14.0f width:self.frame.size.width - 20 - CONTACTPERSONLabel.frame.size.width]);
    

    //固定电话
    CONTACTPHONELabel.text = [NSString stringWithFormat:@"固定电话："];
    CONTACTPHONELabel.frame = CGRectMake(CGRectGetMinX(CUS_NAMELabel.frame), CGRectGetMaxY(CONTACTPERSONLabelForContent.frame) + 6, [self widthForString:CONTACTPHONELabel.text fontSize:14.0 width:0 view:CONTACTPHONELabel], 14.0);
    
    CONTACTPHONELabelForContent.text = [NSString stringWithFormat:@"%@", [content objectAtIndex:10]];
    CONTACTPHONELabelForContent.textColor = [UIColor colorWithRed:0.0 / 255 green:0.0 / 255 blue:139.0 / 255 alpha:1.0f];
    CONTACTPHONELabelForContent.frame = CGRectMake(CGRectGetMaxX(CONTACTPHONELabel.frame), CGRectGetMinY(CONTACTPHONELabel.frame), self.frame.size.width - 20 - CONTACTPHONELabel.frame.size.width, [self heightForString:CONTACTPHONELabelForContent.text fontSize:14.0f width:self.frame.size.width - 20 - CONTACTPHONELabel.frame.size.width]);
    
    //手机
    CONTACTMOBILELabel.text = [NSString stringWithFormat:@"手       机："];
    
    CONTACTMOBILELabel.frame = CGRectMake(CGRectGetMinX(CUS_NAMELabel.frame), CGRectGetMaxY(CONTACTPHONELabelForContent.frame) + 6, [self widthForString:CONTACTMOBILELabel.text fontSize:14.0 width:0 view:CONTACTMOBILELabel], 14.0);
    
    CONTACTMOBILELabelForContent.text = [NSString stringWithFormat:@"%@", [content objectAtIndex:11]];
    CONTACTMOBILELabelForContent.textColor = [UIColor colorWithRed:0.0 / 255 green:0.0 / 255 blue:139.0 / 255 alpha:1.0f];
    CONTACTMOBILELabelForContent.frame = CGRectMake(CGRectGetMaxX(CONTACTMOBILELabel.frame), CGRectGetMinY(CONTACTMOBILELabel.frame), self.frame.size.width - 20 - CONTACTMOBILELabel.frame.size.width, [self heightForString:CONTACTMOBILELabelForContent.text fontSize:14.0f width:self.frame.size.width - 20 - CONTACTMOBILELabel.frame.size.width]);
    
    //联系地址
    ADDRESSLabel.text = [NSString stringWithFormat:@"联系地址："];
    ADDRESSLabel.frame = CGRectMake(CGRectGetMinX(CUS_NAMELabel.frame), CGRectGetMaxY(CONTACTMOBILELabelForContent.frame) + 6, [self widthForString:ADDRESSLabel.text fontSize:14.0 width:0 view:ADDRESSLabel], 14.0);
    
    ADDRESSLabelForContent.text = [NSString stringWithFormat:@"%@", [content objectAtIndex:12]];
    ADDRESSLabelForContent.frame = CGRectMake(CGRectGetMaxX(ADDRESSLabel.frame), CGRectGetMinY(ADDRESSLabel.frame), self.frame.size.width - 20 - ADDRESSLabel.frame.size.width, [self heightForString:ADDRESSLabelForContent.text fontSize:14.0f width:self.frame.size.width - 20 - ADDRESSLabel.frame.size.width]);
}

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

#pragma mark - UITapGestureRecognizer
- (void)phoneTap:(UIGestureRecognizer *)gesture
{
    NSString *phoneString = [NSString stringWithFormat:@"telprompt://%@", CONTACTPHONELabelForContent.text];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneString]];
}
- (void)mobileTap:(UIGestureRecognizer *)gesture
{

    NSString *mobileString = [NSString stringWithFormat:@"telprompt://%@", CONTACTMOBILELabelForContent.text];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:mobileString]];
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
