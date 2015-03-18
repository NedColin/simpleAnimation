//
//  UIView+UIView_SimpleAnimate.h
//  SimpleAnimate
//
//  Created by Ned on 3/18/15.
//  Copyright (c) 2015 orvibo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (UIView_SimpleAnimate)

- (void)easeInWithScale;

- (void)easeInWithPop;

- (void)xRotateTransformIn;

- (void)popFromButtonWithHeight;

- (void)groundBounceAnimationWithHeight:(CGFloat)height;

@end
