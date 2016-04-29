//
//  UIButton+GOUIHelper.m
//  Golfie
//
//  Created by Hayden Young on 21/12/2015.
//  Copyright © 2015 Nimbletank. All rights reserved.
//

#import "UIButton+SCUIHelper.h"

@implementation UIButton (SCUIHelper)

#pragma mark - Blank Buttons
+ (instancetype)buttonWithTarget:(id)target action:(SEL)action
{
	UIButton *button = [[UIButton alloc] init];
	
	[button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
	
	return button;
}

#pragma mark - Buttons With Titles
+ (instancetype)buttonWithTitle:(NSString *)title touchUpInsideTarget:(id)target action:(SEL)action
{
	return [UIButton buttonWithTitle:title font:nil titleColor:[UIColor blackColor] touchUpInsideTarget:target action:action];
}

+ (instancetype)buttonWithTitle:(NSString *)title font:(UIFont *)font titleColor:(UIColor *)titleColor touchUpInsideTarget:(id)target action:(SEL)action
{
	UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
	
	[button setTitle:title forState:UIControlStateNormal];
	
	if(font)
		button.titleLabel.font = font;
	
	if(titleColor)
	{
		[button setTitleColor:titleColor forState:UIControlStateNormal];
		[button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
	}
	
	[button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
	
	[button sizeToFit];
	
	return button;
}

#pragma mark - Buttons With Images

+ (instancetype)buttonWithNormalImage:(UIImage *)image touchUpInsideTarget:(id)target action:(SEL)action
{
	UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
	
	[button setImage:image forState:UIControlStateNormal];
	
	[button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
	
	[button sizeToFit];
	
	return button;
}

@end
