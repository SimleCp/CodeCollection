//
//  PrefixHeader.h
//  PrefixHeader
//
//  Created by pengpeng on 15/12/11.
//  Copyright © 2015年 pengpeng. All rights reserved.
//

#ifndef PrefixHeader_pch
#define PrefixHeader_pch

#ifdef __OBJC__

#pragma mark -
#pragma mark - DEBUG

#ifdef DEBUG

#define PPLog(FORMAT, ...) fprintf(stderr, "<%s>[%d] %s\n", [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#define PPLogFunc fprintf(stderr, "🚀 %s\n", __func__);
#define PPLogErrorFunc fprintf(stderr, "‼️ Error: 此处异常, 请检查 -> [%s 第: %d 行]\n", [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__);

#else

#define PPLog(FORMAT, ...)
#define PPLogFunc
#define PPLogErrorFunc

#endif

#pragma mark -
#pragma mark - Other

#define PPWriteToPlist(obj, filename) [obj writeToFile:[NSString stringWithFormat:@"/Users/xxxx/Desktop/%@.plist", filename] atomically:YES];

#define PPScreenW [UIScreen mainScreen].bounds.size.width
#define PPScreenH [UIScreen mainScreen].bounds.size.height
#define PPScreenBounds [UIScreen mainScreen].bounds

#define PPApplicationKeyWindow [UIApplication sharedApplication].keyWindow


#pragma mark -
#pragma mark - Convert

#define PPIntegerToString(d) [NSString stringWithFormat:@"%zd", d]
#define PPUIntegerToString(d) PPIntegerToString(d)
#define PPFloatToString(d) [NSString stringWithFormat:@"%f", d]
#define PPDoubleToString(d) PPFloatToString(d)
#define PPDoubleToTwoPString(d) [NSString stringWithFormat:@"%.2f", d]

#pragma mark -
#pragma mark - Color

#define PPRandomColor PPColor(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))

#define PPColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define PPColorA(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/1.0]

#define PPColorRGBA(rgb,a) PPColorA(rgb,rgb,rgb,a)

#define PPColorRGB(v) PPColor(v,v,v)

#define PPColorHex(v) [UIColor colorWithHexStr:v]
#define PPColorHexA(v, a) [UIColor colorWithHexStr:v alpha:a]


#define PPCommonBgColor PPGrayColor()
#define PPNavBgColor PPColor(,,)
#define PPViewBgColor PPColorV()
#define PPFontColor PPColorV()
#define PPPSearchColor PPColorV()
#define PPPSearchTextFieldColor PPColorV()


#endif

#endif /* PrefixHeader_pch */
