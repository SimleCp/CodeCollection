//
//  PPEdgeButton.m
//  PPEdgeButton
//
//  Created by pengpeng on 16/8/4.
//  Copyright © 2016年 swift520. All rights reserved.
//

#import "PPEdgeButton.h"

@implementation PPEdgeButton

- (CGSize)intrinsicContentSize
{
    CGSize size = [super intrinsicContentSize];
//    CGSize tempSize = self.whEdge;
    size = CGSizeMake(size.width + self.whEdge.width, size.height + self.whEdge.height);
    return size;
}

@end
