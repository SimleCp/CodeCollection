//
//  UIBarButtonItem+PPExtension.h
//  PPCategories
//
//  Created by peng on 2017/6/6.
//  Copyright © 2017年 peng All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (PPExtension)

+ (instancetype)itemWithNilItem;

+ (instancetype)itemWithTarget:(id)target action:(SEL)action;

+ (instancetype)itemWithTitle:(NSString *)title target:(id)target action:(SEL)action;

+ (instancetype)itemWithImage:(NSString *)image target:(id)target action:(SEL)action;

+ (instancetype)itemWithNormalImage:(NSString *)normalImage target:(id)target action:(SEL)action title:(NSString *)title;

+ (instancetype)itemWithNormalImage:(NSString *)normalImage highlightedImage:(NSString *)highlightedImage target:(id)target action:(SEL)action title:(NSString *)title;

@end

