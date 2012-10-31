//
//  UIView+Nib.m
//  CatKit
//
//  Created by Andrew Smith on 8/21/12.
//  Copyright (c) 2012 Andrew B. Smith. All rights reserved.
//

#import "UIView+Nib.h"

@implementation UIView (Nib)

+ (UIView *)newViewFromNibInBundle:(NSBundle *)bundle
{
    NSArray *views = [bundle loadNibNamed:[self description]
                                    owner:nil
                                  options:nil];
   
    if (views.count == 0) return nil;
    
    return [views objectAtIndex:0];
}

@end
