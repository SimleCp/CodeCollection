//
//  PPTextField.h
//  PPTextField
//
//  Created by pengpeng on 16/8/11.
//  Copyright © 2016年 pengpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PPTextField : UITextField

/** 输入字数限制 */
@property (nonatomic, assign) NSUInteger enterCount;

/** 占位文字颜色 */
@property (nonatomic, strong) UIColor *placeholderTextColor;
/** 占位文字字体 */
@property (nonatomic, strong) UIFont *placeholderTextFont;

/** 清除按钮的颜色 */
@property (nonatomic, strong) UIColor *cleanButtonColor;

/** 开启字数限制 text改变的回调 */
@property (nonatomic, copy) void (^textFieldEditingChangedCallBack)(PPTextField *textField);

- (void)customWithPlaceholder:(NSString *)placeholder color:(UIColor *)color font:(UIFont *)font;

- (void)customWithPlaceholder:(NSString *)placeholder color:(UIColor *)color;

@end
