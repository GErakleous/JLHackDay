//
//  UIButton+GOUIHelper.h
//  Golfie
//
//  Created by Hayden Young on 21/12/2015.
//  Copyright © 2015 Nimbletank. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (SCUIHelper)

#pragma mark - Blank Buttons
+ (instancetype)buttonWithTarget:(id)target action:(SEL)action;

#pragma mark - Buttons With Titles
+ (instancetype)buttonWithTitle:(NSString *)title touchUpInsideTarget:(id)target action:(SEL)action;
+ (instancetype)buttonWithTitle:(NSString *)title font:(UIFont *)font titleColor:(UIColor *)titleColor touchUpInsideTarget:(id)target action:(SEL)action;

#pragma mark - Buttons With Images

+ (instancetype)buttonWithNormalImage:(UIImage *)image touchUpInsideTarget:(id)target action:(SEL)action;

@end
