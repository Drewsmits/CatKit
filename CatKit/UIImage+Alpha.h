//
//  UIImage+Alpha.h
//  CatKit
//
//  Created by Andrew Smith on 6/30/12.
//  Copyright (c) 2012 Andrew B. Smith. All rights reserved.

// UIImage+Alpha.h
// Created by Trevor Harmon on 9/20/09.
// Free for personal or commercial use, with or without modification.
// No warranty is expressed or implied.

// Helper methods for adding an alpha layer to an image
@interface UIImage (Alpha)

- (BOOL)hasAlpha;

- (UIImage *)imageWithAlpha;

- (UIImage *)transparentBorderImage:(NSUInteger)borderSize;

@end