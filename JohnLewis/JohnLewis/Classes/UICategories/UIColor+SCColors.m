//
//  UIColor+GOColors.m
//  Golfie
//
//  Created by Hayden Young on 02/02/2016.
//  Copyright © 2016 Nimbletank. All rights reserved.
//

#import "UIColor+SCColors.h"

@implementation UIColor (SCColors)

+ (UIColor *)scWhiteColor
{
	return [UIColor whiteColor];
}
+ (UIColor *)scTurquoiseColor
{
	return [UIColor colorWithRed:0.0/255.0 green:204.0/255.0 blue:176.0/255.0 alpha:1.0];
}
+ (UIColor *)scReddishPinkColor
{
	return [UIColor colorWithRed:254.0/255.0 green:40.0/255.0 blue:81.0/255.0 alpha:1.0];
}
+ (UIColor *)scTangerineColor
{
	return [UIColor colorWithRed:1 green:150.0/255 blue:0.0 alpha:1.0];
}
+ (UIColor *)scWarmGrayColor
{
	return [UIColor colorWithWhite:135.0/255.0 alpha:1.0];
}
+ (UIColor *)scMidGrayColor
{
	return [UIColor colorWithWhite:96.0/255.0 alpha:1.0];
}
+ (UIColor *)scVeryLightGray
{
	return [UIColor colorWithWhite:0.9 alpha:1.0];
}
@end
