//
//  UIView+GOLayout.m
//  Golfie
//
//  Created by Hayden Young on 02/02/2016.
//  Copyright © 2016 Nimbletank. All rights reserved.
//

#import "UIView+SCLayout.h"

@implementation UIView (SCLayout)


#pragma mark - Align Sides

- (NSLayoutConstraint *)alignTopFromSubview:(UIView *)fromView toSubview:(UIView *)toView
{
	NSLayoutConstraint *constraint;
	constraint = [NSLayoutConstraint constraintWithItem:fromView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:toView attribute:NSLayoutAttributeTop multiplier:1 constant:0];
	[self addConstraint:constraint];
	return constraint;
}
- (NSLayoutConstraint *)alignBottomFromSubview:(UIView *)fromView toSubview:(UIView *)toView
{
	NSLayoutConstraint *constraint;
	constraint = [NSLayoutConstraint constraintWithItem:fromView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:toView attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
	[self addConstraint:constraint];
	return constraint;
}
- (NSLayoutConstraint *)alignLeftFromSubview:(UIView *)fromView toSubview:(UIView *)toView
{
	NSLayoutConstraint *constraint;
	constraint = [NSLayoutConstraint constraintWithItem:fromView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:toView attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
	[self addConstraint:constraint];
	return constraint;
}
- (NSLayoutConstraint *)alignRightFromSubview:(UIView *)fromView toSubview:(UIView *)toView
{
	NSLayoutConstraint *constraint;
	constraint = [NSLayoutConstraint constraintWithItem:fromView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:toView attribute:NSLayoutAttributeRight multiplier:1 constant:0];
	[self addConstraint:constraint];
	return constraint;
}

#pragma mark - Size Views
- (NSLayoutConstraint *)alignWidthFromSubview:(UIView *)fromView toSubview:(UIView *)toView
{
	NSLayoutConstraint *constraint;
	constraint = [NSLayoutConstraint constraintWithItem:fromView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:toView attribute:NSLayoutAttributeWidth multiplier:1 constant:0];
	[self addConstraint:constraint];
	return constraint;
}

- (NSLayoutConstraint *)alignHeightFromSubview:(UIView *)fromView toSubview:(UIView *)toView
{
	NSLayoutConstraint *constraint;
	constraint = [NSLayoutConstraint constraintWithItem:fromView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:toView attribute:NSLayoutAttributeHeight multiplier:1 constant:0];
	[self addConstraint:constraint];
	return constraint;
}

- (NSLayoutConstraint *)alignHeightOfSubview:(UIView *)fromView toHeight:(CGFloat)height
{
	NSLayoutConstraint *constraint;
	constraint = [NSLayoutConstraint constraintWithItem:fromView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:0 constant:height];
	[self addConstraint:constraint];
	return constraint;
}

#pragma mark - Center Views
- (NSLayoutConstraint *)alignCenterXFromSubview:(UIView *)fromView toSubview:(UIView *)toView
{
	NSLayoutConstraint *constraint;
	constraint = [NSLayoutConstraint constraintWithItem:fromView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:toView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
	[self addConstraint:constraint];
	return constraint;
}

- (NSLayoutConstraint *)alignCenterYFromSubview:(UIView *)fromView toSubview:(UIView *)toView
{
	NSLayoutConstraint *constraint;
	constraint = [NSLayoutConstraint constraintWithItem:fromView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:toView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
	[self addConstraint:constraint];
	return constraint;
}

@end
