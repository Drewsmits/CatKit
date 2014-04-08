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

    XCTAssertTrue([example1 isEmailAddress], @"String should be an email");
    XCTAssertFalse([example2 isEmailAddress], @"String should not be an email");
    XCTAssertFalse([example3 isEmailAddress], @"String should not be an email");
    XCTAssertTrue([example4 isEmailAddress], @"String should be an email");
    XCTAssertTrue([example5 isEmailAddress], @"String should be an email");
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
    
    XCTAssertTrue([bOfa1 isBankRoutingTransitNumber], @"Real routing number should pass");
    XCTAssertTrue([bOfa2 isBankRoutingTransitNumber], @"Real routing number should pass");
    XCTAssertTrue([chase1 isBankRoutingTransitNumber], @"Real routing number should pass");
    XCTAssertTrue([chase2 isBankRoutingTransitNumber], @"Real routing number should pass");
    
    XCTAssertFalse([fail1 isBankRoutingTransitNumber], @"Fake routing number should fail");
    XCTAssertFalse([fail2 isBankRoutingTransitNumber], @"Fake routing number should fail");
    XCTAssertFalse([fail3 isBankRoutingTransitNumber], @"Fake routing number should fail");
    XCTAssertFalse([fail4 isBankRoutingTransitNumber], @"Fake routing number should fail");
    XCTAssertFalse([fail5 isBankRoutingTransitNumber], @"Fake routing number should fail");
}

- (void)testLowercaseFirstLetterOnlyString {
    
    NSString *example1 = @"SomethingWeird";
    NSString *answer1 = @"somethingWeird";
    
    NSString *example2 = @"OMGLOLBBQ";
    NSString *answer2 = @"oMGLOLBBQ";
    
    XCTAssertTrue((example1 != answer1), @"Strings should not be equal");
    XCTAssertTrue((example2 != answer2), @"Strings should not be equal");

    XCTAssertEqualObjects([example1 lowercaseFirstLetterOnlyString], answer1, @"String should have lowercase first letter");
    XCTAssertEqualObjects([example2 lowercaseFirstLetterOnlyString], answer2, @"String should have lowercase first letter");

}

#pragma mark - Macros

- (void)testIsEmpty {
    
    NSString *notEmpty = @"abcdefg";
    NSString *empty = @"";
    NSString *nilString = nil;
    
    NSArray *emptyArray = [NSArray array];
    NSArray *notEmptyArray = [NSArray arrayWithObject:@"object"];
    
    XCTAssertFalse(IsEmpty(notEmpty), @"Should not be empty");
    XCTAssertTrue(IsEmpty(empty), @"Should be empty");
    XCTAssertTrue(IsEmpty(nilString), @"Should be empty");
    XCTAssertTrue(IsEmpty(emptyArray), @"Should be empty");
    XCTAssertFalse(IsEmpty(notEmptyArray), @"Should not be empty");
}

#pragma mark - NSFileManager

- (void)testNSFileManagerSaveFileAndCreateSubDirs
{    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *tempDir = [documentsDirectory stringByAppendingString:@"/temp"];
    
    NSString *filePath = [tempDir stringByAppendingString:@"/folder1/folder2/temp.txt"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];

    BOOL fileCreated = [fileManager createFileAtPath:filePath 
                         withIntermediateDirectories:YES 
                                            contents:nil 
                                          attributes:nil];
    
    // cleanup temp dir
    [fileManager removeItemAtPath:tempDir error:nil];
    
    XCTAssertTrue(fileCreated, @"Should save file");
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
    
    XCTAssertFalse(fileCreated, @"Should save file");
}

#pragma mark - NSArray

- (void)testSplitAtIndex
{
    NSArray *array = @[@"A", @"B", @"C", @"D", @"E", @"F", @"G"];
    
    NSArray *result = [array splitAtIndex:0];
    NSArray *first = result[0];
    NSArray *second = result[1];
    
    XCTAssertEqual(first.count, 0U, @"Array split at index 0 should have an empty first array");
    XCTAssertEqualObjects(second, array, @"Array split at index 0 should have return the same second array");
 
    result = [array splitAtIndex:-1];
    first = result[0];
    second = result[1];
    
    XCTAssertEqual(first.count, 0U, @"Array split at index 0 should have an empty first array");
    XCTAssertEqualObjects(second, array, @"Array split at index 0 should have return the same second array");
    
    result = [array splitAtIndex:8];
    first = result[0];
    second = result[1];
    
    XCTAssertEqualObjects(first, array, @"Array split at index 0 should have return the same first array");
    XCTAssertEqual(second.count, 0U, @"Array split at index 0 should have an empty second array");
    
    result = [array splitAtIndex:3];
    first = result[0];
    second = result[1];
    
    NSArray *shouldBeFirst  = @[@"A", @"B", @"C"];
    NSArray *shouldBeSecond = @[@"D", @"E", @"F", @"G"];
    
    XCTAssertEqualObjects(first, shouldBeFirst, @"Array split should have correct parts");
    XCTAssertEqualObjects(second, shouldBeSecond, @"Array split should have correct parts");
}

@end
