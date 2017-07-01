//
//  PPProgressHUD.h
//  PPProgressHUD
//
//  Created by pengpeng on 16/2/29.
//  Copyright © 2016年 pengpeng. All rights reserved.
//

#import <MBProgressHUD.h>

typedef NS_ENUM(NSInteger, PPProgressHUDMode) {
    PPProgressHUDModeIndeterminate,
    PPProgressHUDModeDeterminate,
    PPProgressHUDModeDeterminateHorizontalBar,
    PPProgressHUDModeAnnularDeterminate,
    PPProgressHUDModeCustomView,
    PPProgressHUDModeText
};

typedef void (^PPProgressHUDCompletionBlock)();

@interface PPProgressHUD : MBProgressHUD
/**
 *  添加HUD到视图上
 */
+ (instancetype)showHUDAddedTo:(UIView *)view;

/**
 传入文本内容, 显示加载中的菊花....
 */
+ (instancetype)showHUDAddedTo:(UIView *)view text:(NSString *)text;

/**
 *  显示文本HUD到视图上, 并且延迟 2秒 消失
 */
+ (instancetype)showTextHUDAddedTo:(UIView *)view text:(NSString *)text;
/**
 *  显示文本HUD到视图上, 并且延迟 2秒 消失
 *
 *  @param completion HUD消失后需要回调的Block
 */
+ (instancetype)showTextHUDAddedTo:(UIView *)view text:(NSString *)text completion:(PPProgressHUDCompletionBlock)completion;
/**
 *  显示文本HUD到视图上
 *
 *  @param afterDelay 指定HUD隐藏的时间
 *  @param completion HUD消失后需要回调的Block
 */
+ (instancetype)showTextHUDAddedTo:(UIView *)view text:(NSString *)text afterDelay:(NSTimeInterval)afterDelay completion:(PPProgressHUDCompletionBlock)completion;
/**
 *  显示文本HUD到视图上, 指定HUD隐藏的时间
 */
+ (instancetype)showTextHUDAddedTo:(UIView *)view text:(NSString *)text afterDelay:(NSTimeInterval)afterDelay;

/**
 *  显示成功的HUD到视图上
 */
+ (instancetype)showSuccessHUDAddedTo:(UIView *)view text:(NSString *)text;

/**
 *  显示失败的HUD到视图上
 */
+ (instancetype)showErrorHUDAddedTo:(UIView *)view text:(NSString *)text;

/**
 *  把HUD从视图上移除
 */
+ (BOOL)hideHUDForView:(UIView *)view;
/**
 *  把HUD从视图上移除, 并延迟
 */
- (void)hideHUDWithAfterDelay:(NSTimeInterval)delay;
/**
 *  移除指定view上所有的HUD
 */
//+ (NSUInteger)hideAllHUDsForView:(UIView *)view;


@end
