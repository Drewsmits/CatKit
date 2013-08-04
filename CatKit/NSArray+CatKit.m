//
//  NSArray+CatKit.m
//  CatKit
//
//  Created by Andrew Smith on 8/2/13.
//  Copyright (c) 2013 Andrew B. Smith. All rights reserved.
//

#import "NSArray+CatKit.h"

@implementation NSArray (CatKit)

- (NSArray *)splitAtIndex:(NSInteger)index
{
    if (index < 0) {
        return @[[NSArray array], [NSArray arrayWithArray:self]];
    }
    
    if (index > self.count) {
        return @[[NSArray arrayWithArray:self], [NSArray array]];
    }
    
    NSArray *first = [self subarrayWithRange:NSMakeRange(0, index)];
    NSArray *second = [self subarrayWithRange:NSMakeRange(index, self.count - index)];
    
    return @[first, second];
}

@end
