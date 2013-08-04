//
//  CatKitTests.m
//  CatKitTests
//
//  Created by Andrew Smith on 9/9/11.
//  Copyright 2011 Andrew B. Smith. All rights reserved.
//

#import "CatKitTests.h"
#import "NSString+CatKit.h"
#import "NSFileManager+CatKit.h"
#import "CKCommonMacros.h"
#import "NSArray+CatKit.h"


@implementation CatKitTests

- (void)setUp {
    [super setUp];
    // Set-up code here.
}

- (void)tearDown{
    // Tear-down code here.
    [super tearDown];
}

#pragma mark - NSString

- (void)testIsStringEmail
{    
    NSString *example1 = @"john@gmail.com";
    NSString *example2 = @"notanemail.com";
    NSString *example3 = @"part.of.email@wha";
    NSString *example4 = @"this.should.pass@something.ly";
    NSString *example5 = @"shouldSupportUpperCase@gmail.com";

    STAssertTrue([example1 isEmailAddress], @"String should be an email");
    STAssertFalse([example2 isEmailAddress], @"String should not be an email");
    STAssertFalse([example3 isEmailAddress], @"String should not be an email");
    STAssertTrue([example4 isEmailAddress], @"String should be an email");
    STAssertTrue([example5 isEmailAddress], @"String should be an email");
}

- (void)testIsStringRoutingTransitNumber
{
    //
    // Routing numbers from http://www.routingnumbers.org
    //
    NSString *bOfa1  = @"081211135";
    NSString *bOfa2  = @"114000019";
    NSString *chase1 = @"031100393";
    NSString *chase2 = @"028000011";
    
    //
    // Routing numbers from my brain
    //
    NSString *fail1 = @"1";
    NSString *fail2 = @"123456789";
    NSString *fail3 = @"23985723985";
    NSString *fail4 = @"asdlkf";
    NSString *fail5 = @"";
    
    STAssertTrue([bOfa1 isBankRoutingTransitNumber], @"Real routing number should pass");
    STAssertTrue([bOfa2 isBankRoutingTransitNumber], @"Real routing number should pass");
    STAssertTrue([chase1 isBankRoutingTransitNumber], @"Real routing number should pass");
    STAssertTrue([chase2 isBankRoutingTransitNumber], @"Real routing number should pass");
    
    STAssertFalse([fail1 isBankRoutingTransitNumber], @"Fake routing number should fail");
    STAssertFalse([fail2 isBankRoutingTransitNumber], @"Fake routing number should fail");
    STAssertFalse([fail3 isBankRoutingTransitNumber], @"Fake routing number should fail");
    STAssertFalse([fail4 isBankRoutingTransitNumber], @"Fake routing number should fail");
    STAssertFalse([fail5 isBankRoutingTransitNumber], @"Fake routing number should fail");
}

- (void)testLowercaseFirstLetterOnlyString {
    
    NSString *example1 = @"SomethingWeird";
    NSString *answer1 = @"somethingWeird";
    
    NSString *example2 = @"OMGLOLBBQ";
    NSString *answer2 = @"oMGLOLBBQ";
    
    STAssertTrue((example1 != answer1), @"Strings should not be equal");
    STAssertTrue((example2 != answer2), @"Strings should not be equal");

    STAssertEqualObjects([example1 lowercaseFirstLetterOnlyString], answer1, @"String should have lowercase first letter");
    STAssertEqualObjects([example2 lowercaseFirstLetterOnlyString], answer2, @"String should have lowercase first letter");

}

#pragma mark - Macros

- (void)testIsEmpty {
    
    NSString *notEmpty = @"abcdefg";
    NSString *empty = @"";
    NSString *nilString = nil;
    
    NSArray *emptyArray = [NSArray array];
    NSArray *notEmptyArray = [NSArray arrayWithObject:@"object"];
    
    STAssertFalse(IsEmpty(notEmpty), @"Should not be empty");
    STAssertTrue(IsEmpty(empty), @"Should be empty");
    STAssertTrue(IsEmpty(nilString), @"Should be empty");
    STAssertTrue(IsEmpty(emptyArray), @"Should be empty");
    STAssertFalse(IsEmpty(notEmptyArray), @"Should not be empty");
}

#pragma mark - NSFileManager

- (void)testNSFileManagerSaveFileAndCreateSubDirs {
    
    NSString *homeDir = NSHomeDirectory();
    NSString *tempDir = [homeDir stringByAppendingString:@"/temp"];
    
    NSString *filePath = [tempDir stringByAppendingString:@"/folder1/folder2/temp.txt"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];

    BOOL fileCreated = [fileManager createFileAtPath:filePath 
                         withIntermediateDirectories:YES 
                                            contents:nil 
                                          attributes:nil];
    
    // cleanup temp dir
    [fileManager removeItemAtPath:tempDir error:nil];
    
    STAssertTrue(fileCreated, @"Should save file");
}

- (void)testNSFileManagerSaveFileDontCreateSubDirs {
    
    NSString *homeDir = NSHomeDirectory();
    NSString *tempDir = [homeDir stringByAppendingString:@"/temp"];
    
    NSString *filePath = [tempDir stringByAppendingString:@"/folder1/folder2/temp.txt"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    BOOL fileCreated = [fileManager createFileAtPath:filePath 
                         withIntermediateDirectories:NO 
                                            contents:nil 
                                          attributes:nil];
    
    // cleanup temp dir
    [fileManager removeItemAtPath:tempDir error:nil];
    
    STAssertFalse(fileCreated, @"Should save file");
}

#pragma mark - NSArray

- (void)testSplitAtIndex
{
    NSArray *array = @[@"A", @"B", @"C", @"D", @"E", @"F", @"G"];
    
    NSArray *result = [array splitAtIndex:0];
    NSArray *first = result[0];
    NSArray *second = result[1];
    
    STAssertEquals(first.count, 0U, @"Array split at index 0 should have an empty first array");
    STAssertEqualObjects(second, array, @"Array split at index 0 should have return the same second array");
 
    result = [array splitAtIndex:-1];
    first = result[0];
    second = result[1];
    
    STAssertEquals(first.count, 0U, @"Array split at index 0 should have an empty first array");
    STAssertEqualObjects(second, array, @"Array split at index 0 should have return the same second array");
    
    result = [array splitAtIndex:8];
    first = result[0];
    second = result[1];
    
    STAssertEqualObjects(first, array, @"Array split at index 0 should have return the same first array");
    STAssertEquals(second.count, 0U, @"Array split at index 0 should have an empty second array");
    
    result = [array splitAtIndex:3];
    first = result[0];
    second = result[1];
    
    NSArray *shouldBeFirst  = @[@"A", @"B", @"C"];
    NSArray *shouldBeSecond = @[@"D", @"E", @"F", @"G"];
    
    STAssertEqualObjects(first, shouldBeFirst, @"Array split should have correct parts");
    STAssertEqualObjects(second, shouldBeSecond, @"Array split should have correct parts");
}

@end
