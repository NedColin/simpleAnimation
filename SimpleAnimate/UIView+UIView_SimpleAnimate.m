//
//  UIView+UIView_SimpleAnimate.m
//  SimpleAnimate
//
//  Created by Ned on 3/18/15.
//  Copyright (c) 2015 orvibo. All rights reserved.
//

#import "UIView+UIView_SimpleAnimate.h"

@implementation UIView (UIView_SimpleAnimate)

- (void)easeInWithScale
{
    CABasicAnimation *scaleAnim = [CABasicAnimation animationWithKeyPath:@"transform"];
    scaleAnim.duration = .3;
    scaleAnim.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 1, 1)];
    scaleAnim.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.5, 0.5, 0.5)];
    
    scaleAnim.removedOnCompletion = YES;
    [self.layer addAnimation:scaleAnim forKey:@"Sjhg"];
}

- (void)easeInWithPop
{
    CAAnimationGroup * group = [[CAAnimationGroup alloc] init];
    CAKeyframeAnimation * scaleAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    CATransform3D rotateTransform = CATransform3DIdentity;
    rotateTransform.m34 = 1.0/500.0;
    rotateTransform = CATransform3DRotate(rotateTransform, 0.6, 1.0, 0.0, 0.0);
    self.layer.anchorPoint = CGPointMake(.5, .5);
    
    
    CATransform3D scaleTransform1 = CATransform3DIdentity;
    scaleTransform1 = CATransform3DScale(scaleTransform1, .2, .2, .2);
    
    CATransform3D scaleTransform2 = CATransform3DIdentity;
    scaleTransform2 = CATransform3DScale(scaleTransform2, 1.2, 1.2, 1.2);
    
    CATransform3D contactTransform = CATransform3DConcat(rotateTransform, scaleTransform2);
    
    
    scaleAnimation.values = @[[NSValue valueWithCATransform3D:scaleTransform1],
                              [NSValue valueWithCATransform3D:contactTransform],
                              [NSValue valueWithCATransform3D:CATransform3DIdentity]];
    scaleAnimation.keyTimes = @[@0.1f,@0.4f, @.9f];
    scaleAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
                                       [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
                                       [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    
    CGFloat duration = .8;
    scaleAnimation.duration = duration;
    scaleAnimation.autoreverses = YES;
    
    group.animations = [NSArray arrayWithObjects:scaleAnimation, nil];
    group.duration = duration;
    
    [self.layer addAnimation:group forKey:@"POP"];
}

- (void)xRotateTransformIn
{
    CATransform3D rotateTransform = CATransform3DIdentity;
    rotateTransform.m34 = 1.0/100.0;
    rotateTransform = CATransform3DRotate(rotateTransform, 0.6, 1.0, 0.0, 0.0);
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.fromValue = [NSValue valueWithCATransform3D:rotateTransform];
    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    animation.duration = .5;
    [self.layer addAnimation:animation forKey:@"transform"];
}

- (void)popFromButtonWithHeight
{
    
    
    
    CGFloat centerX = self.frame.size.width / 2;
    CGFloat centerY = self.frame.size.height / 2;
    centerY = [UIScreen mainScreen].bounds.size.height - self.frame.size.height;
    CGFloat startY = [UIScreen mainScreen].bounds.size.height - self.frame.size.height;
    
    CAKeyframeAnimation *keyFrame = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    keyFrame.values = @[[NSValue valueWithCGPoint:CGPointMake(centerX, startY)],
                        
                        [NSValue valueWithCGPoint:CGPointMake(centerX, centerY + 20)],
                        
                        [NSValue valueWithCGPoint:CGPointMake(centerX, centerY - 20)],
                        
                        [NSValue valueWithCGPoint:CGPointMake(centerX, centerY + 15)],
                        
                        [NSValue valueWithCGPoint:CGPointMake(centerX, centerY - 15)],
                        
                        [NSValue valueWithCGPoint:CGPointMake(centerX, centerY - 10)],
                        
                        [NSValue valueWithCGPoint:CGPointMake(centerX, centerY + 5)],
                        
                        [NSValue valueWithCGPoint:CGPointMake(centerX, centerY)]];
    
    
    keyFrame.keyTimes = @[@0.1f,@0.22f,@0.34f,@.47f,@0.88f, @.9f];
    keyFrame.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];    keyFrame.duration = 1;
    
    
    
    
    [self.layer addAnimation:keyFrame forKey:@"keyFrame"];
    
    return;
    CGFloat    height = 0;
    CAAnimationGroup * group = [[CAAnimationGroup alloc] init];
    
    CAKeyframeAnimation * positionAnimation = [CAKeyframeAnimation animationWithKeyPath:@"translation"];
    
    CATransform3D translation1 = CATransform3DMakeTranslation( 10, height + 20, 10);
    
    
    CATransform3D translation2 = CATransform3DMakeTranslation( 20, height - 15, 20);
    
    
    CATransform3D translation3 = CATransform3DMakeTranslation( 30, height + 10, 30);
    
    
    CATransform3D translation4 = CATransform3DMakeTranslation( 40, height - 5, 40);;
    
    
    
    positionAnimation.values = @[[NSValue valueWithCATransform3D:translation1],
                                 [NSValue valueWithCATransform3D:translation2],
                                 [NSValue valueWithCATransform3D:translation3],
                                 [NSValue valueWithCATransform3D:translation4],
                                 [NSValue valueWithCATransform3D:CATransform3DIdentity]];
    positionAnimation.keyTimes = @[@0.1f,@0.2f,@0.4f,@0.7f,@0.8f, @.9f];
    positionAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
                                          [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
                                          [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
                                          [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
                                          [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
                                          [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    
    CGFloat duration = 5;
    positionAnimation.duration = duration;
    positionAnimation.autoreverses = YES;
    
    positionAnimation.fillMode = kCAFillModeForwards;
    [self.layer addAnimation:positionAnimation forKey:@"PopFromButton"];
    return;
    
    group.animations = [NSArray arrayWithObjects:positionAnimation, nil];
    group.duration = duration;
    
    [self.layer addAnimation:group forKey:@"POP"];
}

- (void)groundBounceAnimationWithHeight:(CGFloat)height
{
    if ([self.layer animationForKey:@"bounceUp"]) {
        [self.layer removeAnimationForKey:@"bounceUp"];
    }
    
   	CGFloat factors[32] = {0, 32, 60, 83, 100, 114, 124, 128, 128, 124, 114, 100, 83, 60, 32,
        0, 24, 42, 54, 62, 64, 62, 54, 42, 24, 0, 18, 28, 32, 28, 18, 0};
    
    NSMutableArray *values = [NSMutableArray array];
    
    for (int i=0; i<10; i++)
    {
        CGFloat positionOffset =(height + (-i * 35));
        CATransform3D transform = CATransform3DMakeTranslation(0, -positionOffset, 0);
        [values addObject:[NSValue valueWithCATransform3D:transform]];
    }
    
    for (int i=0; i<32; i++)
    {
        CGFloat positionOffset = factors[i]/128.0f * 30;
        
        CATransform3D transform = CATransform3DMakeTranslation(0, -positionOffset, 0);
        [values addObject:[NSValue valueWithCATransform3D:transform]];
    }
    
    
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.repeatCount = 1;
    animation.duration = 20.0f/30.0f;
    animation.fillMode = kCAFillModeForwards;
    animation.values = values;
    animation.removedOnCompletion = YES;
    animation.autoreverses = NO;
    
    [self.layer addAnimation:animation forKey:@"bounceUp"];
}

@end
