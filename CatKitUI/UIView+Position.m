//
//  UIView+Position.m
//  CatKit
//
//  Created by Andrew Smith on 9/9/11.
//  Copyright 2011 Andrew B. Smith. All rights reserved.
//

#import "UIView+Position.h"

@implementation UIView (Position)

- (CGFloat)left {
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)top {
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (void)setLeftAligned:(CGFloat)val {
	self.left = round(val);
}

- (CGFloat)leftAligned {
    return round(self.left);
}

- (void)setRightAligned:(CGFloat)val {
	self.right = round(val);
}

- (CGFloat)rightAligned {
    return round(self.right);
}

- (void)setTopAligned:(CGFloat)val {
	self.top = round(val);
}

- (CGFloat)topAligned {
    return round(self.top);
}

- (void)setBottomAligned:(CGFloat)val {
	self.bottom = round(val);
}

- (CGFloat)bottomAligned {
    return round(self.bottom);
}

- (void)setCenterXAligned:(CGFloat)val {
    self.leftAligned = val - self.width / 2.0;
}

- (CGFloat)centerXAligned {
    return round(self.center.x);
}

- (void)setCenterYAligned:(CGFloat)val {
    self.topAligned = val - self.height / 2.0;
}

- (CGFloat)centerYAligned {
    return round(self.center.y);
}

- (void)setCenterAligned:(CGPoint)centerAligned {
    self.centerXAligned = centerAligned.x;
    self.centerYAligned = centerAligned.y;
}

- (CGPoint)centerAligned {
    return CGPointMake(round(self.center.x), round(self.center.y));
}

- (CGRect)absoluteFrame {
    return [self convertRect:self.frame toView:nil];
}

- (CGRect)absoluteBounds {
    return [self convertRect:self.bounds toView:nil];
}

@end
