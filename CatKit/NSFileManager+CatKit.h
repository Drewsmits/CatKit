//
//  NSFileManager+CatKit.h
//  CatKit
//
//  Created by Andrew Smith on 3/14/12.
//  Copyright (c) 2012 Andrew B. Smith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (CatKit)

- (BOOL)createFileAtPath:(NSString *)path 
withIntermediateDirectories:(BOOL)createIntermediates 
                contents:(NSData *)contents 
              attributes:(NSDictionary *)attributes;

@end
