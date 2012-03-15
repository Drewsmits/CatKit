//
//  NSFileManager+CatKit.m
//  CatKit
//
//  Created by Andrew Smith on 3/14/12.
//  Copyright (c) 2012 Andrew B. Smith. All rights reserved.
//

#import "NSFileManager+CatKit.h"

@implementation NSFileManager (CatKit)

- (BOOL)createFileAtPath:(NSString *)path 
withIntermediateDirectories:(BOOL)createIntermediates 
                contents:(NSData *)contents 
              attributes:(NSDictionary *)attributes {
    
    NSMutableArray *pathComponents = [[path pathComponents] mutableCopy];
    [pathComponents removeLastObject];
    NSString *pathDir = [NSString pathWithComponents:pathComponents];
    
    BOOL isDir;
    if (![self fileExistsAtPath:pathDir isDirectory:&isDir] && isDir) {
        [self createDirectoryAtPath:pathDir 
        withIntermediateDirectories:createIntermediates
                         attributes:nil
                              error:NULL];
    }
    
    return [self createFileAtPath:path 
                         contents:contents 
                       attributes:attributes];
}

@end
