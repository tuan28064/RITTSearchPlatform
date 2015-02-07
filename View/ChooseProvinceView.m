//
//  ChooseProvinceView.m
//  RITTSearchPlatform
//
//  Created by wangjingtuan on 14-10-12.
//  Copyright (c) 2014年 RITT. All rights reserved.
//

#import "ChooseProvinceView.h"

@implementation ChooseProvinceView

@synthesize chooseRegionLabel;

@synthesize huabeiView;
@synthesize huananView;
@synthesize huadongView;
@synthesize xinanView;
@synthesize dongbeiView;
@synthesize xibeiView;

@synthesize huabeiLabel;
@synthesize huananLabel;
@synthesize huadongLabel;
@synthesize xinanLabel;
@synthesize dongbeiLabel;
@synthesize xibeiLabel;

@synthesize beijingButton;
@synthesize tianjinButton;
@synthesize hebeiButton;
@synthesize shanxiButton;
@synthesize neimengguButton;

@synthesize guangdongButton;
@synthesize guangxiButton;
@synthesize henanButton;
@synthesize hubeiButton;
@synthesize hunanButton;
@synthesize hainanButton;

@synthesize shanghaiButton;
@synthesize jiangsuButton;
@synthesize zhejiangButton;
@synthesize anhuiButton;
@synthesize fujianButton;
@synthesize jiangxiButton;
@synthesize shandongButton;

@synthesize chongqingButton;
@synthesize sichuanButton;
@synthesize guizhouButton;
@synthesize yunnanButton;
@synthesize xizangButton;

@synthesize liaoningButton;
@synthesize jilinButton;
@synthesize heilongjiangButton;

@synthesize shannxiButton;
@synthesize gansuButton;
@synthesize qinghaiButton;
@synthesize ningxiaButton;
@synthesize xinjiangButton;

@synthesize leftLine;
@synthesize rightLine;

@synthesize oneLine;
@synthesize twoLine;
@synthesize threeLine;
@synthesize fourLine;
@synthesize fiveLine;
@synthesize sixLine;
@synthesize sevenLine;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        
        chooseRegionLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 20)];
        chooseRegionLabel.text = @" 请选择查询地区";
        chooseRegionLabel.backgroundColor = [UIColor colorWithRed:24.0 / 255 green:116.0 / 255 blue:205.0 / 255 alpha:1.0f];
        chooseRegionLabel.textColor = [UIColor whiteColor];
        chooseRegionLabel.font = [UIFont systemFontOfSize:12.0f];
        [self addSubview:chooseRegionLabel];
        
        leftLine = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(chooseRegionLabel.frame), CGRectGetMaxY(chooseRegionLabel.frame), 1, 155)];
        leftLine.backgroundColor = LineBgColor;
        [self addSubview:leftLine];
        
        rightLine = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(chooseRegionLabel.frame), CGRectGetMaxY(chooseRegionLabel.frame), 1, 155)];
        rightLine.backgroundColor = LineBgColor;
        [self addSubview:rightLine];
        
        oneLine = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(chooseRegionLabel.frame), CGRectGetMaxY(chooseRegionLabel.frame), self.frame.size.width, 1)];
        oneLine.backgroundColor = LineBgColor;
        [self addSubview:oneLine];
        
        huabeiView = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMinX(chooseRegionLabel.frame), CGRectGetMaxY(oneLine.frame), self.frame.size.width, 25)];
        huabeiLabel.backgroundColor = [UIColor whiteColor];
        [self addSubview:huabeiView];
        
        huabeiLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 40, 25)];
        huabeiLabel.text = @"  华北地区";
        huabeiLabel.backgroundColor = ProvinceBgColor;
        huabeiLabel.textColor = [UIColor whiteColor];
        huabeiLabel.font = [UIFont systemFontOfSize:8.0];
        [huabeiView addSubview:huabeiLabel];
        
        beijingButton = [UIButton buttonWithType:UIButtonTypeSystem];
        beijingButton.frame = CGRectMake(CGRectGetMaxX(huabeiLabel.frame) + 5, 4, 32, 15);
        [beijingButton setTitle:@"北京" forState:UIControlStateNormal];
        beijingButton.tag = kUIButtonTag + 1;
        [huabeiView addSubview:beijingButton];
        tianjinButton = [UIButton buttonWithType:UIButtonTypeSystem];
        tianjinButton.frame = CGRectMake(CGRectGetMaxX(beijingButton.frame) + 5, 4, 32, 15);
        [tianjinButton setTitle:@"天津" forState:UIControlStateNormal];
        tianjinButton.tag = kUIButtonTag + 2;
        [huabeiView addSubview:tianjinButton];
        hebeiButton = [UIButton buttonWithType:UIButtonTypeSystem];
        hebeiButton.frame = CGRectMake(CGRectGetMaxX(tianjinButton.frame) + 5, 4, 32, 15);
        [hebeiButton setTitle:@"河北" forState:UIControlStateNormal];
        hebeiButton.tag = kUIButtonTag + 3;
        [huabeiView addSubview:hebeiButton];
        shanxiButton = [UIButton buttonWithType:UIButtonTypeSystem];
        shanxiButton.frame = CGRectMake(CGRectGetMaxX(hebeiButton.frame) + 5, 4, 32, 15);
        [shanxiButton setTitle:@"山西" forState:UIControlStateNormal];
        shanxiButton.tag = kUIButtonTag + 4;
        [huabeiView addSubview:shanxiButton];
        neimengguButton = [UIButton buttonWithType:UIButtonTypeSystem];
        neimengguButton.frame = CGRectMake(CGRectGetMaxX(shanxiButton.frame) + 5, 4, 45, 15);
        [neimengguButton setTitle:@"内蒙古" forState:UIControlStateNormal];
        neimengguButton.tag = kUIButtonTag + 5;
        [huabeiView addSubview:neimengguButton];
        
        twoLine = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(chooseRegionLabel.frame), CGRectGetMaxY(huabeiView.frame), self.frame.size.width, 1)];
        twoLine.backgroundColor = LineBgColor;
        [self addSubview:twoLine];
        
        huananView = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMinX(chooseRegionLabel.frame), CGRectGetMaxY(twoLine.frame), self.frame.size.width, 25)];
        huananView.backgroundColor = [UIColor whiteColor];
        [self addSubview:huananView];
        
        huananLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 40, 25)];
        huananLabel.text = @"  华南地区";
        huananLabel.textColor = [UIColor whiteColor];
        huananLabel.backgroundColor = ProvinceBgColor;
        huananLabel.font = [UIFont systemFontOfSize:8.0];
        [huananView addSubview:huananLabel];
        
        guangdongButton = [UIButton buttonWithType:UIButtonTypeSystem];
        guangdongButton.frame = CGRectMake(CGRectGetMaxX(huananLabel.frame) + 5, 4, 32, 15);
        [guangdongButton setTitle:@"广东" forState:UIControlStateNormal];
        guangdongButton.tag = kUIButtonTag + 6;
        [huananView addSubview:guangdongButton];
        guangxiButton = [UIButton buttonWithType:UIButtonTypeSystem];
        guangxiButton.frame = CGRectMake(CGRectGetMaxX(guangdongButton.frame) + 5, 4, 32, 15);
        [guangxiButton setTitle:@"广西" forState:UIControlStateNormal];
        guangxiButton.tag = kUIButtonTag + 7;
        [huananView addSubview:guangxiButton];
        henanButton = [UIButton buttonWithType:UIButtonTypeSystem];
        henanButton.frame = CGRectMake(CGRectGetMaxX(guangxiButton.frame) + 5, 4, 32, 15);
        [henanButton setTitle:@"河南" forState:UIControlStateNormal];
        henanButton.tag = kUIButtonTag + 8;
        [huananView addSubview:henanButton];
        hubeiButton = [UIButton buttonWithType:UIButtonTypeSystem];
        hubeiButton.frame = CGRectMake(CGRectGetMaxX(henanButton.frame) + 5, 4, 32, 15);
        [hubeiButton setTitle:@"湖北" forState:UIControlStateNormal];
        hubeiButton.tag = kUIButtonTag + 9;
        [huananView addSubview:hubeiButton];
        hunanButton = [UIButton buttonWithType:UIButtonTypeSystem];
        hunanButton.frame = CGRectMake(CGRectGetMaxX(hubeiButton.frame) + 5, 4, 32, 15);
        [hunanButton setTitle:@"湖南" forState:UIControlStateNormal];
        hunanButton.tag = kUIButtonTag + 10;
        [huananView addSubview:hunanButton];
        hainanButton = [UIButton buttonWithType:UIButtonTypeSystem];
        hainanButton.frame = CGRectMake(CGRectGetMaxX(hunanButton.frame) + 5, 4, 32, 15);
        [hainanButton setTitle:@"海南" forState:UIControlStateNormal];
        hainanButton.tag = kUIButtonTag + 11;
        [huananView addSubview:hainanButton];
        
        threeLine = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(chooseRegionLabel.frame), CGRectGetMaxY(huananView.frame), self.frame.size.width, 1)];
//        threeLine.image = [UIImage imageNamed:@"home_line"];
        threeLine.backgroundColor = LineBgColor;
        [self addSubview:threeLine];
        
        huadongView = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMinX(chooseRegionLabel.frame), CGRectGetMaxY(threeLine.frame), self.frame.size.width, 25)];
        huadongView.backgroundColor = [UIColor whiteColor];
        [self addSubview:huadongView];
        
        huadongLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 40, 25)];
        huadongLabel.text = @"  华东地区";
        huadongLabel.textColor = [UIColor whiteColor];
        huadongLabel.backgroundColor = ProvinceBgColor;
        huadongLabel.font = [UIFont systemFontOfSize:8.0];
        [huadongView addSubview:huadongLabel];
        
        shanghaiButton = [UIButton buttonWithType:UIButtonTypeSystem];
        shanghaiButton.frame = CGRectMake(CGRectGetMaxX(huadongLabel.frame) + 5, 4, 32, 15);
        [shanghaiButton setTitle:@"上海" forState:UIControlStateNormal];
        shanghaiButton.tag = kUIButtonTag + 12;
        [huadongView addSubview:shanghaiButton];
        jiangsuButton = [UIButton buttonWithType:UIButtonTypeSystem];
        jiangsuButton.frame = CGRectMake(CGRectGetMaxX(shanghaiButton.frame) + 5, 4, 32, 15);
        [jiangsuButton setTitle:@"江苏" forState:UIControlStateNormal];
        jiangxiButton.tag = kUIButtonTag + 13;
        [huadongView addSubview:jiangsuButton];
        zhejiangButton = [UIButton buttonWithType:UIButtonTypeSystem];
        zhejiangButton.frame = CGRectMake(CGRectGetMaxX(jiangsuButton.frame) + 5, 4, 32, 15);
        [zhejiangButton setTitle:@"浙江" forState:UIControlStateNormal];
        zhejiangButton.tag = kUIButtonTag + 14;
        [huadongView addSubview:zhejiangButton];
        anhuiButton = [UIButton buttonWithType:UIButtonTypeSystem];
        anhuiButton.frame = CGRectMake(CGRectGetMaxX(zhejiangButton.frame) + 5, 4, 32, 15);
        [anhuiButton setTitle:@"安徽" forState:UIControlStateNormal];
        anhuiButton.tag = kUIButtonTag + 15;
        [huadongView addSubview:anhuiButton];
        fujianButton = [UIButton buttonWithType:UIButtonTypeSystem];
        fujianButton.frame = CGRectMake(CGRectGetMaxX(anhuiButton.frame) + 5, 4, 32, 15);
        [fujianButton setTitle:@"福建" forState:UIControlStateNormal];
        fujianButton.tag = kUIButtonTag + 16;
        [huadongView addSubview:fujianButton];
        jiangxiButton = [UIButton buttonWithType:UIButtonTypeSystem];
        jiangxiButton.frame = CGRectMake(CGRectGetMaxX(fujianButton.frame) + 5, 4, 32, 15);
        [jiangxiButton setTitle:@"江西" forState:UIControlStateNormal];
        jiangxiButton.tag = kUIButtonTag + 17;
        [huadongView addSubview:jiangxiButton];
        shandongButton = [UIButton buttonWithType:UIButtonTypeSystem];
        shandongButton.frame = CGRectMake(CGRectGetMaxX(jiangxiButton.frame) + 5, 4, 32, 15);
        [shandongButton setTitle:@"山东" forState:UIControlStateNormal];
        shandongButton.tag = kUIButtonTag + 18;
        [huadongView addSubview:shandongButton];
        
        fourLine = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(chooseRegionLabel.frame), CGRectGetMaxY(huadongView.frame), self.frame.size.width, 1)];
//        fourLine.image = [UIImage imageNamed:@"home_line"];
        fourLine.backgroundColor = LineBgColor;
        [self addSubview:fourLine];
        
        xinanView = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMinX(chooseRegionLabel.frame), CGRectGetMaxY(fourLine.frame), self.frame.size.width, 25)];
        xinanView.backgroundColor = [UIColor whiteColor];
        [self addSubview:xinanView];
        
        xinanLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 40, 25)];
        xinanLabel.text = @"  西南地区";
        xinanLabel.backgroundColor = ProvinceBgColor;
        xinanLabel.textColor = [UIColor whiteColor];
        xinanLabel.font = [UIFont systemFontOfSize:8.0];
        [xinanView addSubview:xinanLabel];
        
        chongqingButton = [UIButton buttonWithType:UIButtonTypeSystem];
        chongqingButton.frame = CGRectMake(CGRectGetMaxX(xinanLabel.frame) + 5, 4, 32, 15);
        [chongqingButton setTitle:@"重庆" forState:UIControlStateNormal];
        chongqingButton.tag = kUIButtonTag + 19;
        [xinanView addSubview:chongqingButton];
        sichuanButton = [UIButton buttonWithType:UIButtonTypeSystem];
        sichuanButton.frame = CGRectMake(CGRectGetMaxX(chongqingButton.frame) + 5, 4, 32, 15);
        [sichuanButton setTitle:@"四川" forState:UIControlStateNormal];
        sichuanButton.tag = kUIButtonTag + 20;
        [xinanView addSubview:sichuanButton];
        guizhouButton = [UIButton buttonWithType:UIButtonTypeSystem];
        guizhouButton.frame = CGRectMake(CGRectGetMaxX(sichuanButton.frame) + 5, 4, 32, 15);
        [guizhouButton setTitle:@"贵州" forState:UIControlStateNormal];
        guizhouButton.tag = kUIButtonTag + 21;
        [xinanView addSubview:guizhouButton];
        yunnanButton = [UIButton buttonWithType:UIButtonTypeSystem];
        yunnanButton.frame = CGRectMake(CGRectGetMaxX(guizhouButton.frame) + 5, 4, 32, 15);
        [yunnanButton setTitle:@"云南" forState:UIControlStateNormal];
        yunnanButton.tag = kUIButtonTag + 22;
        [xinanView addSubview:yunnanButton];
        xizangButton = [UIButton buttonWithType:UIButtonTypeSystem];
        xizangButton.frame = CGRectMake(CGRectGetMaxX(yunnanButton.frame) + 5, 4, 32, 15);
        [xizangButton setTitle:@"西藏" forState:UIControlStateNormal];
        xizangButton.tag = kUIButtonTag + 23;
        [xinanView addSubview:xizangButton];
        
        fiveLine = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(chooseRegionLabel.frame), CGRectGetMaxY(xinanView.frame), self.frame.size.width, 1)];
//        fiveLine.image = [UIImage imageNamed:@"home_line"];
        fiveLine.backgroundColor = LineBgColor;
        [self addSubview:fiveLine];
        
        dongbeiView = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMinX(chooseRegionLabel.frame), CGRectGetMaxY(fiveLine.frame), self.frame.size.width, 25)];
        dongbeiView.backgroundColor = [UIColor whiteColor];
        [self addSubview:dongbeiView];
        
        dongbeiLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 40, 25)];
        dongbeiLabel.text = @"  东北地区";
        dongbeiLabel.textColor = [UIColor whiteColor];
        dongbeiLabel.backgroundColor = ProvinceBgColor;
        dongbeiLabel.font = [UIFont systemFontOfSize:8.0];
        [dongbeiView addSubview:dongbeiLabel];
        
        liaoningButton = [UIButton buttonWithType:UIButtonTypeSystem];
        liaoningButton.frame = CGRectMake(CGRectGetMaxX(dongbeiLabel.frame) + 5, 4, 32, 15);
        [liaoningButton setTitle:@"辽宁" forState:UIControlStateNormal];
        liaoningButton.tag = kUIButtonTag + 24;
        [dongbeiView addSubview:liaoningButton];
        jilinButton = [UIButton buttonWithType:UIButtonTypeSystem];
        jilinButton.frame = CGRectMake(CGRectGetMaxX(liaoningButton.frame) + 5, 4, 32, 15);
        [jilinButton setTitle:@"吉林" forState:UIControlStateNormal];
        jilinButton.tag = kUIButtonTag + 25;
        [dongbeiView addSubview:jilinButton];
        heilongjiangButton = [UIButton buttonWithType:UIButtonTypeSystem];
        heilongjiangButton.frame = CGRectMake(CGRectGetMaxX(jilinButton.frame) + 5, 4, 45, 15);
        [heilongjiangButton setTitle:@"黑龙江" forState:UIControlStateNormal];
        heilongjiangButton.tag = kUIButtonTag + 26;
        [dongbeiView addSubview:heilongjiangButton];

        sixLine = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(chooseRegionLabel.frame), CGRectGetMaxY(dongbeiView.frame), self.frame.size.width, 1)];
//        sixLine.image = [UIImage imageNamed:@"home_line"];
        sixLine.backgroundColor = LineBgColor;
        [self addSubview:sixLine];
        
        xibeiView = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMinX(chooseRegionLabel.frame), CGRectGetMaxY(sixLine.frame), self.frame.size.width, 25)];
        xibeiView.backgroundColor = [UIColor whiteColor];
        [self addSubview:xibeiView];
        
        xibeiLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 40, 25)];
        xibeiLabel.text = @"  西北地区";
        xibeiLabel.backgroundColor = ProvinceBgColor;
        xibeiLabel.textColor = [UIColor whiteColor];
        xibeiLabel.font = [UIFont systemFontOfSize:8.0];
        [xibeiView addSubview:xibeiLabel];
        
        shannxiButton = [UIButton buttonWithType:UIButtonTypeSystem];
        shannxiButton.frame = CGRectMake(CGRectGetMaxX(xibeiLabel.frame) + 5, 4, 32, 15);
        [shannxiButton setTitle:@"陕西" forState:UIControlStateNormal];
        shannxiButton.tag = kUIButtonTag + 27;
        [xibeiView addSubview:shannxiButton];
        gansuButton = [UIButton buttonWithType:UIButtonTypeSystem];
        gansuButton.frame = CGRectMake(CGRectGetMaxX(shannxiButton.frame) + 5, 4, 32, 15);
        [gansuButton setTitle:@"甘肃" forState:UIControlStateNormal];
        gansuButton.tag = kUIButtonTag + 28;
        [xibeiView addSubview:gansuButton];
        qinghaiButton = [UIButton buttonWithType:UIButtonTypeSystem];
        qinghaiButton.frame = CGRectMake(CGRectGetMaxX(gansuButton.frame) + 5, 4, 32, 15);
        [qinghaiButton setTitle:@"青海" forState:UIControlStateNormal];
        qinghaiButton.tag = kUIButtonTag + 29;
        [xibeiView addSubview:qinghaiButton];
        ningxiaButton = [UIButton buttonWithType:UIButtonTypeSystem];
        ningxiaButton.frame = CGRectMake(CGRectGetMaxX(qinghaiButton.frame) + 5, 4, 32, 15);
        [ningxiaButton setTitle:@"宁夏" forState:UIControlStateNormal];
        ningxiaButton.tag = kUIButtonTag + 30;
        [xibeiView addSubview:ningxiaButton];
        xinjiangButton = [UIButton buttonWithType:UIButtonTypeSystem];
        xinjiangButton.frame = CGRectMake(CGRectGetMaxX(ningxiaButton.frame) + 5, 4, 32, 15);
        [xinjiangButton setTitle:@"新疆" forState:UIControlStateNormal];
        xinjiangButton.tag = kUIButtonTag + 31;
        [xibeiView addSubview:xinjiangButton];
        
        sevenLine = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(chooseRegionLabel.frame), CGRectGetMaxY(xibeiView.frame), self.frame.size.width, 1)];
//        sevenLine.image = [UIImage imageNamed:@"home_line"];
        sevenLine.backgroundColor = LineBgColor;
        [self addSubview:sevenLine];
    }
    return self;
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
