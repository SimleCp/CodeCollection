//
//  PPDataConvert.m
//  PPDataConvert
//
//  Created by pengpeng on 16/7/11.
//  Copyright © 2016年 pengpeng. All rights reserved.
//

#import "DataConvert.h"

@implementation DataConvert

+ (id)dataConvertWithJsonFileName:(NSString *)jsonFileName
{
    NSString *path = [[NSBundle mainBundle] pathForResource:jsonFileName ofType:@"json"];
    
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    return [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
}

+ (NSArray *)dataConvertWithPlistFileName:(NSString *)plistFileName
{
    NSString *path = [[NSBundle mainBundle] pathForResource:plistFileName ofType:@"plist"];
    
    return [NSArray arrayWithContentsOfFile:path];
}

@end
