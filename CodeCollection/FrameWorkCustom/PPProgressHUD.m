//
//  PPProgressHUD.m
//  PPProgressHUD
//
//  Created by pengpeng on 16/2/29.
//  Copyright © 2016年 pengpeng. All rights reserved.
//

#import "PPProgressHUD.h"

@implementation PPProgressHUD

static BOOL const PPProgressHUDAnimated = YES;

//static NSTimeInterval const delayTime = 1.7;
static NSTimeInterval const delayTime = 0.95;

//#define Color [UIColor blackColor]

+ (instancetype)showHUDAddedTo:(UIView *)view
{
    PPProgressHUD *hud = [self showHUDAddedTo:view text:@"加载中..."];
    return hud;
}

+ (instancetype)showHUDAddedTo:(UIView *)view text:(NSString *)text
{
    PPProgressHUD *hud = [self showHUDAddedTo:view animated:PPProgressHUDAnimated];
    hud.offset = CGPointMake(0, -20);
    hud.label.text = text;
    hud.bezelView.color = [UIColor colorWithWhite:0 / 255.0 alpha:0.2];
    hud.bezelView.layer.cornerRadius = 5;
    return hud;
}

+ (instancetype)showTextHUDAddedTo:(UIView *)view text:(NSString *)text
{
    return [self showTextHUDAddedTo:view text:text afterDelay:delayTime completion:nil];
}

+ (instancetype)showTextHUDAddedTo:(UIView *)view text:(NSString *)text afterDelay:(NSTimeInterval)afterDelay
{
    return [self showTextHUDAddedTo:view text:text afterDelay:afterDelay completion:nil];
}

+ (instancetype)showTextHUDAddedTo:(UIView *)view text:(NSString *)text completion:(PPProgressHUDCompletionBlock)completion
{
    return [self showTextHUDAddedTo:view text:text afterDelay:delayTime completion:completion];
}

+ (instancetype)showTextHUDAddedTo:(UIView *)view text:(NSString *)text afterDelay:(NSTimeInterval)afterDelay completion:(PPProgressHUDCompletionBlock)completion
{
    //    BBLog(@"%f", afterDelay)
    PPProgressHUD *hud = [self showHUDAddedTo:view];
    hud.mode = PPProgressHUDModeText;
    hud.label.text = text;
    hud.label.numberOfLines = 0;
    //    hud.label.textColor = Color;
    [hud hideHUDWithAfterDelay:afterDelay];
    hud.completionBlock = completion;
    return hud;
}

+ (instancetype)showSuccessHUDAddedTo:(UIView *)view text:(NSString *)text
{
    return [self showCustomViewHUDAddedTo:view text:text imageStr:@"success"];
}

+ (instancetype)showErrorHUDAddedTo:(UIView *)view text:(NSString *)text
{
    return [self showCustomViewHUDAddedTo:view text:text imageStr:@"error"];
}

+ (instancetype)showCustomViewHUDAddedTo:(UIView *)view text:(NSString *)text imageStr:(NSString *)imageStr
{
    PPProgressHUD *hud = [self showHUDAddedTo:view];
    hud.mode = PPProgressHUDModeCustomView;
    hud.label.text = text;
    //    hud.label.textColor = Color;
    //    hud.labelColor = [UIColor redColor];
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageStr]];
    [hud hideHUDWithAfterDelay:delayTime];
    return hud;
}

+ (BOOL)hideHUDForView:(UIView *)view
{
    //    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    BOOL bo = [self hideHUDForView:view animated:PPProgressHUDAnimated];
    return bo;
}

- (void)hideHUDWithAfterDelay:(NSTimeInterval)delay
{
    //    [self hide:PPProgressHUDAnimated afterDelay:delay];
    [self hideAnimated:PPProgressHUDAnimated afterDelay:delay];
}

//+ (NSUInteger)hideAllHUDsForView:(UIView *)view
//{
//    return [self hideAllHUDsForView:view animated:PPProgressHUDAnimated];
////    return [self hideAllHUDsForView:<#(nonnull UIView *)#> animated:<#(BOOL)#>]
//}

@end
