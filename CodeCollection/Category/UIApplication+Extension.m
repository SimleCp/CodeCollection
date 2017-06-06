//
//  UIApplication+Extension.m
//  UIApplication+Extension
//
//  Created by peng on 2017/6/6.
//  Copyright © 2017年 peng All rights reserved.
//

#import "UIApplication+Extension.h"

@implementation UIApplication (Extension)

- (NSString *)getAppVersion
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

- (NSString *)getAppBuildVersion
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
}

@end
