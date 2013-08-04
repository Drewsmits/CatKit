//
//  NSArray+CatKit.h
//  CatKit
//
//  Created by Andrew Smith on 8/2/13.
//  Copyright (c) 2013 Andrew B. Smith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (CatKit)

/**
 
 Returns two arrays, split around the index. It will always return 2 arrays. Depending on the index,
 one array may be empty.
 
 [A, B, C, D, E, F, G] split at 0 returns [[], [A, B, C, D, E, F, G]]
 [A, B, C, D, E, F, G] split at 7 returns [[A, B, C, D, E, F, G], []]
 [A, B, C, D, E, F, G] split at 3 returns [[A, B, C], [D, E, F, G]]
 etc… 
 
 */
- (NSArray *)splitAtIndex:(NSInteger)index;

@end
