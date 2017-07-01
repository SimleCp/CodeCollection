//
//  DataConvert.h
//  DataConvert
//
//  Created by pengpeng on 16/7/11.
//  Copyright © 2016年 pengpeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataConvert : NSObject

/**
 *  JSON转字典或数组
 *
 *  @return id类型对象(字典或数组)
 */
+ (id)dataConvertWithJsonFileName:(NSString *)jsonFileName;

/**
 *  Plist转数组字典
 *
 *  @return 不可变数组
 */
+ (NSArray *)dataConvertWithPlistFileName:(NSString *)plistFileName;

@end
