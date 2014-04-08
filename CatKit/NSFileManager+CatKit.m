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
    if (![self fileExistsAtPath:pathDir isDirectory:&isDir]) {
        NSError *error = nil;
        [self createDirectoryAtPath:pathDir
        withIntermediateDirectories:createIntermediates
                         attributes:nil
                              error:&error];
        if (error) {
            NSLog(@"%@", error);
        }
    }
    
    return [self createFileAtPath:path 
                         contents:contents 
                       attributes:attributes];
}

- (NSURL *)applicationDocumentDirectory
{
    NSURL *applicationDocDirectory = [[self URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    return applicationDocDirectory;
}

- (void)deleteFilesInApplicationDocumentDirectory 
{
    // Ensure we are on the main thread
    NSAssert([[NSThread currentThread] isEqual:[NSThread mainThread]], @"Operations must occur on the main thread");
    
    NSURL *applicationDocDirectory = [self applicationDocumentDirectory];
    
    NSError *error = nil;
    NSArray *directoryContents = [self contentsOfDirectoryAtURL:applicationDocDirectory
                                     includingPropertiesForKeys:nil
                                                        options:NSDirectoryEnumerationSkipsHiddenFiles
                                                          error:&error];
    
    if (error == nil) {
        for (NSURL *URL in directoryContents) {
            BOOL removeSuccess = [self removeItemAtURL:URL error:&error];
            if (!removeSuccess) {
                NSLog(@"%@", error);
            }
        }
    } else {
        NSLog(@"%@", error);
    }
}

- (NSURL *)newUniqueDocumentDirectory
{
    NSString *uniqueString = [[NSProcessInfo processInfo] globallyUniqueString];
    return [self.applicationDocumentDirectory URLByAppendingPathComponent:uniqueString];
}

@end
