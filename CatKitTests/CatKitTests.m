//
//  CatKitTests.m
//  CatKitTests
//
//  Created by Andrew Smith on 9/9/11.
//  Copyright 2011 Andrew B. Smith. All rights reserved.
//

#import "CatKitTests.h"
#import "NSString+CatKit.h"
#import "CKCommonMacros.h"


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

- (void)testIsStringEmail {
    
    NSString *example1 = @"john@gmail.com";
    NSString *example2 = @"notanemail.com";
    NSString *example3 = @"part.of.email@wha";
    NSString *example4 = @"this.should.pass@something.ly";

    STAssertTrue([example1 isEmailAddress], @"String should be an email");
    STAssertFalse([example2 isEmailAddress], @"String should not be an email");
    STAssertFalse([example3 isEmailAddress], @"String should not be an email");
    STAssertTrue([example4 isEmailAddress], @"String should be an email");
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

@end
