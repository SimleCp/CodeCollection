//
//  PPCheckCodeButton.h
//  PPCheckCodeButton
//
//  Created by peng on 2017/4/10.
//  Copyright © 2017年 peng. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 按钮点击 */
UIKIT_EXTERN NSString * const PPCheckCodeButtonDidClickNotification;
/** 定时器实时更新 */
UIKIT_EXTERN NSString * const PPCheckCodeButtonTimerUpdateNotification;

@interface PPCheckCodeButton : UIButton

/** 宽高边缘距离 */
@property (nonatomic, assign) CGSize whEdge;
/** 总计时间 */
@property (nonatomic, assign) NSTimeInterval time;

- (void)startTimer;

@end
