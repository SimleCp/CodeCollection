//
//  NSString+Extension.m
//  NSString+Extension
//
//  Created by peng on 2017/6/6.
//  Copyright © 2017年 peng. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

- (NSString *)stringFormatWithLimitValueType:(PPStringFormatLimitValue)type
{
    return [self stringFormatWithLimitValueType:type footDesc:nil];
}

- (NSString *)stringFormatWithLimitValueType:(PPStringFormatLimitValue)type footDesc:(NSString *)footDesc
{
    if (type == PPStringFormatLimitValueThousand || type == PPStringFormatLimitValueTenThousand) {
        NSInteger value;
        NSString *str;
        if (type == PPStringFormatLimitValueThousand) {
            value = 1000;
            str = @"千";
        } else {
            value = 10000;
            str = @"万";
        }
        
        NSString *tmp = str;
        if (footDesc.length) {
            [tmp stringByAppendingString:footDesc];
        }
    
        return [self stringFormatWithLimitValue:value footDesc:tmp];
    } else {
        return @"界限type异常";
    }
}

- (NSString *)stringFormatWithLimitValue:(NSInteger)limitValue footDesc:(NSString *)footDesc
{
    CGFloat tmp = (CGFloat)limitValue / (CGFloat)limitValue / (CGFloat)limitValue;
    NSString *resStr;
    NSInteger realValue = [self integerValue];
    if (realValue >= limitValue) {
        resStr = [NSString stringWithFormat:@"%.1f%@", realValue * tmp, footDesc];
    } else {
        resStr = [NSString stringWithFormat:@"%zd", realValue];
    }
    return resStr;
}

@end
