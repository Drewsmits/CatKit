//
//  CKCommonMacros.h
//  CatKit
//
//  Created by Andrew Smith on 11/17/11.
//  Copyright (c) 2011 Andrew B. Smith. All rights reserved.
//

#ifndef CatKit_CKCommonMacros_h
#define CatKit_CKCommonMacros_h

/**
 Checks to see if the target is empty
 
 @see http://www.wilshipley.com/blog/2005/10/pimp-my-code-interlude-free-code.html
*/
static inline BOOL IsEmpty(id thing) {
    return thing == nil
    || ([thing respondsToSelector:@selector(length)]
        && [(NSData *)thing length] == 0)
    || ([thing respondsToSelector:@selector(count)]
        && [(NSArray *)thing count] == 0);
}

#define DEFINE_SHARED_INSTANCE_USING_BLOCK(block) \
static dispatch_once_t pred = 0; \
__strong static id _sharedObject = nil; \
dispatch_once(&pred, ^{ \
_sharedObject = block(); \
}); \
return _sharedObject; \

#endif

#define DegreesToRadians(x) (M_PI * x / 180.0)
