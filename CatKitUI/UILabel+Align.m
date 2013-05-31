//
//  UILabel+Align.m
//  CatKit
//
//  Created by Andrew Smith on 10/31/12.
//  Copyright (c) 2012 Andrew B. Smith. All rights reserved.
//

#import "UILabel+Align.h"

@implementation UILabel (Align)

- (void)alignTop
{
    CGSize fontSize = [self.text sizeWithFont:self.font];
    
    double finalHeight = self.frame.size.height;
    double finalWidth = self.frame.size.width;
    
    CGSize theStringSize = [self.text sizeWithFont:self.font
                                 constrainedToSize:CGSizeMake(finalWidth, finalHeight)
                                     lineBreakMode:self.lineBreakMode];
    
    
    int newLinesToPad = (finalHeight  - theStringSize.height) / fontSize.height;
    
    for(int i = 0; i <= newLinesToPad; i++) {
        self.text = [self.text stringByAppendingString:@" \n"];
    }
}

@end
