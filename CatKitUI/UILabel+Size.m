//
//  UILabel+Size.m
//  CatKit
//
//  Created by Andrew Smith on 1/11/12.
//  Copyright (c) 2012 Andrew B. Smith. All rights reserved.
//

#import "UILabel+Size.h"
#import "UIView+Position.h"

@implementation UILabel (Size)

- (void)sizeToFitMaxWidth:(NSInteger)maxWidth {
    CGSize maxSize = CGSizeMake(maxWidth, 99999);
    [self sizeToFitMaxSize:maxSize];
}

- (void)sizeToFitMaxSize:(CGSize)maxSize {
    CGSize calculatedSize = [self.text sizeWithFont:self.font 
                                  constrainedToSize:maxSize 
                                      lineBreakMode:self.lineBreakMode];
    
    self.width = calculatedSize.width;
    self.height = calculatedSize.height;
}

@end
