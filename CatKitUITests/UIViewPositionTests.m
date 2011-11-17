//
//  UIViewPositionTests.m
//  CatKit
//
//  Created by Andrew Smith on 9/9/11.
//  Copyright 2011 Andrew B. Smith. All rights reserved.
//

#import "UIViewPositionTests.h"
#import "UIView+Position.h"

static CGFloat kViewLeft   = 5;
static CGFloat kViewRight  = 6;
static CGFloat kViewTop    = 7;
static CGFloat kViewBottom = 8;

static CGFloat kViewCenterX = 10;
static CGFloat kViewCenterY = 11;

static CGFloat kViewWidth  = 100;
static CGFloat kViewHeight = 101;

static CGFloat kViewAltWidth  = 102;
static CGFloat kViewAltHeight = 103;

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

#pragma mark -
#pragma mark Position

- (void)testLeft {
    view.left = kViewLeft;
    STAssertEquals(view.frame.origin.x, 
                   kViewLeft, 
                   @"View left should be set correctly");
}

- (void)testRight {
    view.right = kViewRight;
    STAssertEquals(view.frame.origin.x + view.frame.size.width, 
                   kViewRight, 
                   @"View right should be set correctly");
}

- (void)testTop {
    view.top = kViewTop;
    STAssertEquals(view.frame.origin.y, 
                   kViewTop, 
                   @"View top should be set correctly");
}

- (void)testBottom {
    view.bottom = kViewBottom;
    STAssertEquals(view.frame.origin.y + view.frame.size.height, 
                   kViewBottom, 
                   @"View bottom should be set correctly");
}

- (void)testCenterX {
    view.centerX = kViewCenterX;
    STAssertEquals(view.center.x, 
                   kViewCenterX, 
                   @"View center x should be set correctly");
}

- (void)testCenterY {
    view.centerY = kViewCenterY;
    STAssertEquals(view.center.y, 
                   kViewCenterY, 
                   @"View center y should be set correctly");
}

#pragma mark -
#pragma mark Size

- (void)testWidth {
    view.width = kViewAltWidth;
    STAssertEquals(view.frame.size.width, 
                   kViewAltWidth, 
                   @"View width should be set correctly");
}

- (void)testHeight {
    view.height = kViewAltHeight;
    STAssertEquals(view.frame.size.height, 
                   kViewAltHeight, 
                   @"View height should be set correctly");
}

#pragma mark
#pragma mark Alignment

- (void)testLeftAligned {
    
    CGFloat leftish = kViewLeft + 0.2;
    view.leftAligned = leftish;
    
    STAssertEquals(view.frame.origin.x, 
                   kViewLeft, 
                   @"View left aligned should be set correctly");
}

- (void)testRightAligned {
    
    CGFloat rightish = kViewRight + 0.4;
    view.rightAligned = rightish;
    
    STAssertEquals(view.frame.origin.x + view.frame.size.width, 
                   kViewRight, 
                   @"View right aligned should be set correctly");
}

- (void)testTopAligned {
    
    CGFloat topish = kViewTop + 0.1;
    view.topAligned = topish;
    
    STAssertEquals(view.frame.origin.y, 
                   kViewTop, 
                   @"View top aligned should be set correctly");
}

- (void)testBottomAligned {
    
    CGFloat bottomish = kViewBottom + 0.4;
    view.bottomAligned = bottomish;
    
    STAssertEquals(view.frame.origin.y + view.frame.size.height, 
                   kViewBottom, 
                   @"View bottom aligned should be set correctly");
}

- (void)testCenterXAligned {
    
    CGFloat centerXish = kViewCenterX + 0.2;
    view.centerXAligned = centerXish;
    
    STAssertEquals(view.center.x, 
                   kViewCenterX, 
                   @"View center x aligned should be set correctly");
}

- (void)testCenterYAligned {
    
    CGFloat centerYish = kViewCenterY + 0.4;
    view.centerYAligned = centerYish;
    
    STAssertEquals(view.center.y, 
                   kViewCenterY, 
                   @"View center y aligned should be set correctly");
}

- (void)testCenterAligned {

    CGFloat centerXish = kViewCenterX + 0.2;
    CGFloat centerYish = kViewCenterY + 0.4;
    
    view.centerAligned = CGPointMake(centerXish, centerYish);

    STAssertEquals(view.center.x, 
                   kViewCenterX, 
                   @"View center x aligned should be set correctly");
    
    STAssertEquals(view.center.y, 
                   kViewCenterY, 
                   @"View center y aligned should be set correctly");

}

@end
