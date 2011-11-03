//
//  UITouch+OpenGL.m
//  CatKit
//
//  Created by Andrew Smith on 11/3/11.
//  Copyright (c) 2011 Andrew B. Smith. All rights reserved.
//

#import "UITouch+OpenGL.h"

@implementation UITouch (OpenGL)

- (CGPoint)invertedLocationInView:(UIView *)view {
    CGPoint p = [self locationInView:view];
	p.y = view.bounds.size.height - p.y;
    
    return p;
}

@end
