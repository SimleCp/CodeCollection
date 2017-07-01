//
//  PPCheckCodeButton.m
//  PPCheckCodeButton
//
//  Created by peng on 2017/4/10.
//  Copyright © 2017年 peng. All rights reserved.
//

#import "PPCheckCodeButton.h"

NSString * const PPCheckCodeButtonDidClickNotification = @"PPCheckCodeButtonDidClickNotification";
NSString * const PPCheckCodeButtonTimerUpdateNotification = @"PPCheckCodeButtonTimerUpdateNotification";

@interface PPCheckCodeButton ()

/** 定时器 */
@property (nonatomic, strong) NSTimer *timer;

/** 倒计时间 */
@property (nonatomic, assign) NSTimeInterval currentTime;

@property (nonatomic, strong) UIColor *color;

@end

@implementation PPCheckCodeButton

- (void)setTime:(NSTimeInterval)time
{
    _time = time;
    [self addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self timer];
}

- (NSTimer *)timer
{
    if (!_timer) {
        _timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(changeTime) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
        [_timer setFireDate:[NSDate distantFuture]];
    }
    
    return _timer;
}

- (void)btnClick
{
    [[NSNotificationCenter defaultCenter] postNotificationName:PPCheckCodeButtonDidClickNotification object:self userInfo:@{@"time" : [NSString stringWithFormat:@"%.f", self.currentTime]}];
}

- (void)startTimer
{
    self.color = [UIColor colorWithCGColor:self.layer.borderColor];
    self.enabled = !self.enabled;
    
    self.currentTime = self.time;
    [_timer setFireDate:[NSDate distantPast]];
    
    [self setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
}

- (void)changeTime
{
    if (!self.currentTime) {
        [_timer setFireDate:[NSDate distantFuture]];
        
        [self setTitleColor:self.color forState:UIControlStateNormal];
        self.layer.borderColor = self.color.CGColor;
        
        self.enabled = !self.enabled;
        self.titleLabel.text = @"重发";
        [self setTitle:@"重发" forState:UIControlStateNormal];
    } else {
        [[NSNotificationCenter defaultCenter] postNotificationName:PPCheckCodeButtonTimerUpdateNotification object:self userInfo:@{@"time" : [NSString stringWithFormat:@"%.f", self.currentTime]}];
        
        
        self.titleLabel.text = [NSString stringWithFormat:@"%.f", self.currentTime];
        [self setTitle:[NSString stringWithFormat:@"%.f", self.currentTime] forState:UIControlStateNormal];
        self.currentTime--;
    }
    
}

- (CGSize)intrinsicContentSize
{
    CGSize size = [super intrinsicContentSize];
    size = CGSizeMake(size.width + self.whEdge.width, size.height + self.whEdge.height);
    return size;
}

@end
