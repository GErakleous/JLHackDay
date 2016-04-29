//
//  UIView+GOLayout.h
//  Golfie
//
//  Created by Hayden Young on 02/02/2016.
//  Copyright © 2016 Nimbletank. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SCLayout)

- (NSLayoutConstraint *)alignTopFromSubview:(UIView *)fromView toSubview:(UIView *)toView;
- (NSLayoutConstraint *)alignBottomFromSubview:(UIView *)fromView toSubview:(UIView *)toView;
- (NSLayoutConstraint *)alignLeftFromSubview:(UIView *)fromView toSubview:(UIView *)toView;
- (NSLayoutConstraint *)alignRightFromSubview:(UIView *)fromView toSubview:(UIView *)toView;

- (NSLayoutConstraint *)alignWidthFromSubview:(UIView *)fromView toSubview:(UIView *)toView;

- (NSLayoutConstraint *)alignHeightFromSubview:(UIView *)fromView toSubview:(UIView *)toView;
- (NSLayoutConstraint *)alignHeightOfSubview:(UIView *)fromView toHeight:(CGFloat)height;

- (NSLayoutConstraint *)alignCenterXFromSubview:(UIView *)fromView toSubview:(UIView *)toView;
- (NSLayoutConstraint *)alignCenterYFromSubview:(UIView *)fromView toSubview:(UIView *)toView;

@end
