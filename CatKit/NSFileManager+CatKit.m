//
//  NSFileManager+CatKit.m
//  CatKit
//
//  Created by Andrew Smith on 3/14/12.
//  Copyright (c) 2012 Andrew B. Smith. All rights reserved.
//

#import "NSFileManager+CatKit.h"

@implementation NSFileManager (CatKit)

- (NSString *)createDirectoryAtPath:(NSString *)path 
        withIntermediateDirectories:(BOOL)createIntermediates
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    BOOL isDir;
    if (![fileManager fileExistsAtPath:path isDirectory:&isDir]) {
        NSError *error = nil;
        [fileManager createDirectoryAtPath:path
               withIntermediateDirectories:createIntermediates 
                                attributes:nil 
                                     error:&error];
        
        if (error) {
            NSLog(@"%@", error);
        }
    }
    
    return path;
}

- (BOOL)createFileAtPath:(NSString *)path 
withIntermediateDirectories:(BOOL)createIntermediates 
                contents:(NSData *)contents 
              attributes:(NSDictionary *)attributes 
{    
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

- (void)deleteFilesInApplicationDocumentDirectory 
{
    // Ensure we are on the main thread
    NSAssert([[NSThread currentThread] isEqual:[NSThread mainThread]], @"Operations must occur on the main thread");
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSURL *applicationDocDirectory = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    
    NSError *error = nil;
    NSArray *directoryContents = [fileManager contentsOfDirectoryAtURL:applicationDocDirectory
                                            includingPropertiesForKeys:nil
                                                               options:NSDirectoryEnumerationSkipsHiddenFiles
                                                                 error:&error];
    
    if (error == nil) {
        for (NSURL *URL in directoryContents) {
            BOOL removeSuccess = [fileManager removeItemAtURL:URL error:&error];
            if (!removeSuccess) {
                NSLog(@"%@", error);
            }
        }
    } else {
        NSLog(@"%@", error);
    }
}


@end
