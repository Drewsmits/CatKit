//
//  UITouch+OpenGL.h
//  CatKit
//
//  Created by Andrew Smith on 11/3/11.
//  Copyright (c) 2011 Andrew B. Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITouch (OpenGL)

- (CGPoint)invertedLocationInView:(UIView *)view;

@end
