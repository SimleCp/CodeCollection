//
//  NSString+Extension.h
//  NSString+Extension
//
//  Created by peng on 2017/6/6.
//  Copyright © 2017年 peng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, PPStringFormatLimitValue) {
    PPStringFormatLimitValueThousand, // 千
    PPStringFormatLimitValueTenThousand // 万
};

@interface NSString (Extension)

/**
 格式化字符串, 把 11000 -> 1.1万
 
 @param type 千或者万
 @return 字符串 如 1.1万
 */
- (NSString *)stringFormatWithLimitValueType:(PPStringFormatLimitValue)type;

/**
 格式化字符串, 把 11000 -> 1.1万人关注

 @param type 千或者万
 @param footDesc 千或者万的字符串已经增加到字符串了, 只需要传入后面的 人关注, 如果不需要, 传nil
 @return 字符串 如 1.1万人关注
 */
- (NSString *)stringFormatWithLimitValueType:(PPStringFormatLimitValue)type footDesc:(NSString *)footDesc;

/**
 格式化字符串, 把 11000 -> 1.1万人关注

 @param limitValue 界限值 如 1000, 10000
 @param footDesc 尾部描述 如 万, 万人关注
 @return 字符串 如 1.1万人关注
 */
- (NSString *)stringFormatWithLimitValue:(NSInteger)limitValue footDesc:(NSString *)footDesc;

@end
