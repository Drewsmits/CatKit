//
//  CatKitTests.m
//  CatKitTests
//
//  Created by Andrew Smith on 9/9/11.
//  Copyright 2011 Andrew B. Smith. All rights reserved.
//

#import "CatKitTests.h"
#import "NSString+CatKit.h"

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

@end
