//
//  UIView+Nib.h
//  CatKit
//
//  Created by Andrew Smith on 8/21/12.
//  Copyright (c) 2012 Andrew B. Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Nib)

+ (UIView *)newViewFromNibInBundle:(NSBundle *)bundle;

@end
