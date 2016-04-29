//
//  UILabel+GOUIHelper.h
//  Golfie
//
//  Created by Hayden Young on 23/12/2015.
//  Copyright © 2015 Nimbletank. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (SCUIHelper)

+ (instancetype)labelWithText:(NSString *)text;
+ (instancetype)labelWithText:(NSString *)text font:(UIFont *)font;
+ (instancetype)labelWithText:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor;

@end
