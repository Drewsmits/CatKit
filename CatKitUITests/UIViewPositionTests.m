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
    
    [super tearDown];
}

#pragma mark -
#pragma mark Position

- (void)testLeft {
    view.left = kViewLeft;
    XCTAssertEqual(view.frame.origin.x, 
                   kViewLeft, 
                   @"View left should be set correctly");
}

- (void)testRight {
    view.right = kViewRight;
    XCTAssertEqual(view.frame.origin.x + view.frame.size.width, 
                   kViewRight, 
                   @"View right should be set correctly");
}

- (void)testTop {
    view.top = kViewTop;
    XCTAssertEqual(view.frame.origin.y, 
                   kViewTop, 
                   @"View top should be set correctly");
}

- (void)testBottom {
    view.bottom = kViewBottom;
    XCTAssertEqual(view.frame.origin.y + view.frame.size.height, 
                   kViewBottom, 
                   @"View bottom should be set correctly");
}

- (void)testCenterX {
    view.centerX = kViewCenterX;
    XCTAssertEqual(view.center.x, 
                   kViewCenterX, 
                   @"View center x should be set correctly");
}

- (void)testCenterY {
    view.centerY = kViewCenterY;
    XCTAssertEqual(view.center.y, 
                   kViewCenterY, 
                   @"View center y should be set correctly");
}

#pragma mark -
#pragma mark Size

- (void)testWidth {
    view.width = kViewAltWidth;
    XCTAssertEqual(view.frame.size.width, 
                   kViewAltWidth, 
                   @"View width should be set correctly");
}

- (void)testHeight {
    view.height = kViewAltHeight;
    XCTAssertEqual(view.frame.size.height, 
                   kViewAltHeight, 
                   @"View height should be set correctly");
}

#pragma mark
#pragma mark Alignment

- (void)testLeftAligned {
    
    CGFloat leftish = kViewLeft + 0.2;
    view.leftAligned = leftish;
    
    XCTAssertEqual(view.frame.origin.x, 
                   kViewLeft, 
                   @"View left aligned should be set correctly");
}

- (void)testRightAligned {
    
    CGFloat rightish = kViewRight + 0.4;
    view.rightAligned = rightish;
    
    XCTAssertEqual(view.frame.origin.x + view.frame.size.width, 
                   kViewRight, 
                   @"View right aligned should be set correctly");
}

- (void)testTopAligned {
    
    CGFloat topish = kViewTop + 0.1;
    view.topAligned = topish;
    
    XCTAssertEqual(view.frame.origin.y, 
                   kViewTop, 
                   @"View top aligned should be set correctly");
}

- (void)testBottomAligned {
    
    CGFloat bottomish = kViewBottom + 0.4;
    view.bottomAligned = bottomish;
    
    XCTAssertEqual(view.frame.origin.y + view.frame.size.height, 
                   kViewBottom, 
                   @"View bottom aligned should be set correctly");
}

- (void)testCenterXAligned {
    
    CGFloat centerXish = kViewCenterX + 0.4;
    view.centerXAligned = centerXish;
    
    double remainder = fabs(fmod(view.leftAligned, view.left));    
    double zero = 0.0;
    
    XCTAssertEqual(remainder, 
                   zero, 
                   @"View center x aligned should be set correctly");
}

- (void)testCenterYAligned {
    
    CGFloat centerYish = kViewCenterY + 0.4;
    view.centerYAligned = centerYish;
    
    double remainder = fabs(fmod(view.topAligned, view.top));    
    double zero = 0.0;
    
    XCTAssertEqual(remainder, 
                   zero, 
                   @"View center Y aligned should be set correctly");
}

- (void)testCenterAligned {

    CGFloat centerXish = kViewCenterX + 0.2;
    CGFloat centerYish = kViewCenterY + 0.4;
    
    view.centerAligned = CGPointMake(centerXish, centerYish);

    double remainderX = fabs(fmod(view.leftAligned, view.left));    
    double zero = 0.0;
    
    XCTAssertEqual(remainderX, 
                   zero, 
                   @"View center x aligned should be set correctly");
    
    double remainderY = fabs(fmod(view.topAligned, view.top));    
    
    XCTAssertEqual(remainderY, 
                   zero, 
                   @"View center Y aligned should be set correctly");

}

@end
