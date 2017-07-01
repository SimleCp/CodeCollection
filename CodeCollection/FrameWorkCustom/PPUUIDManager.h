//
//  PPUUIDManager.h
//  PPUUIDManager
//
//  Created by pengpeng on 16/3/10.
//  Copyright © 2016年 pengpeng. All rights reserved.
//

#import <SSKeychain/SSKeychain.h>

@interface PPUUIDManager : SSKeychain

/**
 *  从当前设备中获取UUID
 */
+ (NSString *)getUUIDFromIdentifierForVendor;

/**
 *  处理UUID相关
 */
+ (BOOL)processUUID;

/**
 *  从钥匙串取出UUID
 */
+ (NSString *)getUUIDFromKeychain;

@end
