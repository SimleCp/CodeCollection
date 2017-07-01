//
//  PPUUIDManager.m
//  PPUUIDManager
//
//  Created by pengpeng on 16/3/10.
//  Copyright © 2016年 pengpeng. All rights reserved.
//

#import "PPUUIDManager.h"

/** app唯一标识 */
#define appIdentifier [NSBundle mainBundle].infoDictionary[@"CFBundleIdentifier"]

@implementation PPUUIDManager

/** UUID账户标识 */
static NSString * const UUIDAccount = @"UUIDAccount";

/**
 *  从当前设备中获取UUID
 */
+ (NSString *)getUUIDFromIdentifierForVendor
{
    return [[[UIDevice currentDevice] identifierForVendor] UUIDString];
}

/**
 *  从钥匙串取出UUID
 */
+ (NSString *)getUUIDFromKeychain
{
    return [SSKeychain passwordForService:appIdentifier account:UUIDAccount];
}

/**
 *  设置UUID到钥匙串
 */
+ (BOOL)setUUIDToKeychain
{
    NSString *UUIDIdentifierFV = [PPUUIDManager getUUIDFromIdentifierForVendor];
    return [SSKeychain setPassword:UUIDIdentifierFV forService:appIdentifier account:UUIDAccount];
}

/**
 *  处理UUID相关
 */
+ (BOOL)processUUID
{
    NSString *UUID = [PPUUIDManager getUUIDFromKeychain];
    if (!UUID.length) {
        BOOL isSuccess = [PPUUIDManager setUUIDToKeychain];
        if (isSuccess) {
//            NSLog(@"UUIDIdentifierFV保存成功 = %@", [PPUUIDManager getUUIDFromKeychain])
            return YES;
        } else {
//            NSLog(@"UUIDIdentifierFV保存失败")
            return NO;
        }
    } else {
//        NSLog(@"成功获取UUIDString = %@", [PPUUIDManager getUUIDFromKeychain])
        return YES;
    }

}



@end
