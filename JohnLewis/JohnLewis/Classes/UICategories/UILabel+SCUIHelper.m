//
//  UILabel+GOUIHelper.m
//  Golfie
//
//  Created by Hayden Young on 23/12/2015.
//  Copyright © 2015 Nimbletank. All rights reserved.
//

#import "UILabel+SCUIHelper.h"

@implementation UILabel (SCUIHelper)

+ (instancetype)labelWithText:(NSString *)text
{
	return [UILabel labelWithText:text font:nil];
}

+ (instancetype)labelWithText:(NSString *)text font:(UIFont *)font
{
	return [UILabel labelWithText:text font:font textColor:[UIColor blackColor]];
}

+ (instancetype)labelWithText:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor
{
	UILabel *label = [[UILabel alloc] init];
	label.text = text;
	
	if(font)
		label.font = font;
	
	if(textColor)
		label.textColor = textColor;
	
	[label sizeToFit];
	
	return label;
}

@end
