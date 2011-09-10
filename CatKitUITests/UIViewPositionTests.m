//
//  UIViewPositionTests.m
//  CatKit
//
//  Created by Andrew Smith on 9/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UIViewPositionTests.h"
#import "UIView+Position.h"

static NSInteger kViewLeft   = 5;
static NSInteger kViewRight  = 5;
static NSInteger kViewWidth  = 100;
static NSInteger kViewHeight = 100;


@implementation UIViewPositionTests


- (void)setUp {
    [super setUp];
    
    view = [[UIView alloc] initWithFrame:CGRectMake(0, 
                                                   0, 
                                                   kViewWidth, 
                                                   kViewHeight)];
}

- (void)tearDown {
    // Tear-down code here.
    [view release];
    
    [super tearDown];
}

- (void)testLeft {
    
    view.left = kViewLeft;
    
    STAssertEquals(view.frame.origin.x, kViewLeft, @"View left should be set correctly");
}

@end
