//
//  UIViewInsertTests.m
//  CatKit
//
//  Created by Andrew Smith on 9/10/11.
//  Copyright 2011 Andrew B. Smith. All rights reserved.
//

#import "UIViewInsertTests.h"
#import "UIView+Insert.h"

@implementation UIViewInsertTests


- (void)setUp {
    [super setUp];
    
    view = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)tearDown {
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testInsertSubviewAtBack {
    
    UIView *container = [[UIView alloc] initWithFrame:CGRectZero];
    UIView *view1     = [[UIView alloc] initWithFrame:CGRectZero];
    UIView *view2     = [[UIView alloc] initWithFrame:CGRectZero];
    
    [container addSubview:view1];
    [container addSubview:view2];

    [container insertSubviewAtBack:view];
    
    BOOL pass = ([container.subviews indexOfObject:view] == 0);
     
     XCTAssertTrue(pass, @"insertSubviewAtBack should put subview last");
    
}

@end
