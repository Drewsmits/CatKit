//
//  UIView+Insert.m
//  CatKit
//
//  Created by Andrew Smith on 9/9/11.
//  Copyright 2011 Andrew B. Smith. All rights reserved.
//

#import "UIView+Insert.h"

@implementation UIView (Insert)


- (void)insertSubviewAtBack:(UIView *)view {
    [self addSubview:view];
    [self sendSubviewToBack:view];
}

@end
