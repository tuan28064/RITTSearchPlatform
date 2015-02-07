//
//  UIDevice+Category.h
//  RITTSearchPlatform
//
//  Created by wangjingtuan on 14-9-28.
//  Copyright (c) 2014年 RITT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (Category)

- (float)floatOfSystemVersion;

- (int)heightForStatusBar;

- (BOOL)isGreaterThanIOS7;

- (int)heightForScreen;

- (int)widthForScreen;

- (BOOL)isFourInchScreen;

@end
