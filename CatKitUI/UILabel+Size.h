//
//  UILabel+Size.h
//  CatKit
//
//  Created by Andrew Smith on 1/11/12.
//  Copyright (c) 2012 Andrew B. Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Size)

- (void)sizeToFitMaxWidth:(NSInteger)maxWidth;

- (void)sizeToFitMaxSize:(CGSize)maxSize;

@end
