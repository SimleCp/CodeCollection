//
//  PPTextField.m
//  PPTextField
//
//  Created by pengpeng on 16/8/11.
//  Copyright © 2016年 pengpeng. All rights reserved.
//

#import "PPTextField.h"

@interface PPTextField ()

/** 是否已经添加了点击事件 */
@property (nonatomic, assign, getter=isAddTarget) BOOL addTarget;

@end

@implementation PPTextField

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setUp];
}

- (void)setUp
{
//    self.enterCount = 0;
    self.textColor = [UIColor whiteColor];
#warning 颜色自定义, 请根据需求赋值
//    self.placeholderTextColor = PPColorHex(PPThemeContentSubColor);
    
    self.borderStyle = UITextBorderStyleLine;
    self.borderStyle = UITextBorderStyleNone;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    // 修复, 如果文本框里面已经有中文内容, 再次编辑文字会下移
    for (UIScrollView *view in self.subviews) {
        if ([view isKindOfClass:[UIScrollView class]]) {
            CGPoint offset = view.contentOffset;
            if (offset.y != 0) {
                offset.y = 0;
                view.contentOffset = offset;
            }
            break;
        }
    }
    
    if ((!self.addTarget && self.enterCount) || self.textFieldEditingChangedCallBack) {
        
        [self setUpEnterCount];
        self.addTarget = YES;
    }

}

- (void)setUpEnterCount
{
    [self addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
}

- (void)textFieldDidChange:(UITextField *)textField
{
    //    if (textField == self.textField) {
    PPTextField *tf = (PPTextField *)textField;
    if (self.enterCount) {
        NSInteger lenght = self.enterCount;
        if (tf.text.length > lenght) {
            tf.text = [tf.text substringToIndex:lenght];
        }
    }
    
    if (self.textFieldEditingChangedCallBack) {
        self.textFieldEditingChangedCallBack(tf);
    }
    //    }
}

- (void)setFont:(UIFont *)font
{
    [super setFont:font];
    self.placeholderTextFont = font;
}

- (void)customWithPlaceholder:(NSString *)placeholder color:(UIColor *)color
{
    [self customWithPlaceholder:placeholder color:color font:self.font];
}

- (void)customWithPlaceholder:(NSString *)placeholder color:(UIColor *)color font:(UIFont *)font {
    
    self.placeholder = placeholder;
    [self setValue:color forKeyPath:@"_placeholderLabel.color"];
    [self setValue:font forKeyPath:@"_placeholderLabel.font"];
}

- (void)setPlaceholderTextFont:(UIFont *)placeholderTextFont
{
    _placeholderTextFont = placeholderTextFont;
    [self setValue:placeholderTextFont forKeyPath:@"_placeholderLabel.font"];
}

- (void)setPlaceholderTextColor:(UIColor *)placeholderTextColor
{
    _placeholderTextColor = placeholderTextColor;
    [self setValue:placeholderTextColor forKeyPath:@"_placeholderLabel.color"];
}

- (void)drawPlaceholderInRect:(CGRect)rect {
//    PPLog(@"%f", self.pp_height)
//    [super drawPlaceholderInRect:CGRectMake(0, self.pp_height * 0.5 - 1, 0, 0)];
    [super drawPlaceholderInRect:CGRectMake(0, self.frame.size.height * 0.5, 0, 0)];
}

- (void)setCleanButtonColor:(UIColor *)cleanButtonColor
{
    _cleanButtonColor = cleanButtonColor;
    
    UIButton *btnClear = [self valueForKey:@"_clearButton"];
    UIImage *imageNormal = [btnClear imageForState:UIControlStateNormal];
    UIGraphicsBeginImageContextWithOptions(imageNormal.size, NO, 0.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGRect rect = (CGRect){ CGPointZero, imageNormal.size };
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    [imageNormal drawInRect:rect];
    
    CGContextSetBlendMode(context, kCGBlendModeSourceIn);
    [cleanButtonColor setFill];
    CGContextFillRect(context, rect);
    
    UIImage *imageTinted  = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    imageTinted = [imageTinted imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [btnClear setImage:imageTinted forState:UIControlStateNormal];
    [btnClear setImage:imageTinted forState:UIControlStateHighlighted];
}


@end
