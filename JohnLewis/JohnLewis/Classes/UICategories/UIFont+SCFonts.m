//
//  UIFont+GOFonts.m
//  Golfie
//
//  Created by Hayden Young on 02/02/2016.
//  Copyright © 2016 Nimbletank. All rights reserved.
//

#import "UIFont+SCFonts.h"

@implementation UIFont (SCFonts)

+ (UIFont *)scFontOfSize:(CGFloat)size
{
	return [UIFont systemFontOfSize:size];
}

+ (UIFont *)scBoldFontOfSize:(CGFloat)size
{
	return [UIFont boldSystemFontOfSize:size];
}

@end
