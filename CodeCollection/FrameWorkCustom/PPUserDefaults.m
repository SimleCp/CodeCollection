//
//  PPUserDefaults.m
//  PPUserDefaults
//
//  Created by pengpeng on 16/7/8.
//  Copyright © 2016年 pengpeng. All rights reserved.
//

#import "PPUserDefaults.h"

#define UserDefaults [NSUserDefaults standardUserDefaults]

@implementation PPUserDefaults

+ (id)objectForKey:(NSString *)defaultName
{
    return [UserDefaults objectForKey:defaultName];
}

+ (void)setObject:(id)value forKey:(NSString *)defaultName
{
    [UserDefaults setObject:value forKey:defaultName];
}

+ (NSInteger)integerForKey:(NSString *)defaultName
{
    return [UserDefaults integerForKey:defaultName];
}

+ (void)setInteger:(NSInteger)value forKey:(NSString *)defaultName
{
    [UserDefaults setInteger:value forKey:defaultName];
}

+ (BOOL)boolForKey:(NSString *)defaultName
{
    return [UserDefaults boolForKey:defaultName];
}

+ (void)setBool:(BOOL)value forKey:(NSString *)defaultName
{
    [UserDefaults setBool:value forKey:defaultName];
}

+ (BOOL)synchronize
{
    return [UserDefaults synchronize];
}

@end
