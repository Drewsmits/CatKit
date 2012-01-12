//
//  UILabelSizeTests.m
//  CatKit
//
//  Created by Andrew Smith on 1/11/12.
//  Copyright (c) 2012 Andrew B. Smith. All rights reserved.
//

#import "UILabelSizeTests.h"
#import "UIView+Position.h"
#import "UILabel+Size.h"

@implementation UILabelSizeTests

- (void)setUp {
    [super setUp];
    
    NSString *text = @"Raw denim high life incididunt DIY. Sapiente sustainable exercitation, dreamcatcher dolor viral anim vero keffiyeh elit consequat american apparel minim. Sint ad viral 3 wolf moon, in veniam bicycle rights odio sartorial. Qui DIY synth before they sold out art party, wolf lo-fi 3 wolf moon veniam wes anderson eu. American apparel tumblr scenester, jean shorts in mlkshk ad sustainable mustache +1 cupidatat cliche aliqua. Aliquip photo booth shoreditch wolf american apparel, PBR 3 wolf moon mollit cred veniam gentrify leggings single-origin coffee terry richardson irony. Incididunt laborum magna, keffiyeh lo-fi tempor dreamcatcher single-origin coffee letterpress assumenda chambray.";
    
    label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.font = [UIFont fontWithName:@"Courier" size:12];
    label.lineBreakMode = UILineBreakModeClip;
    label.text = text;
}

- (void)tearDown {
    // Tear-down code here.
    [label release];
    
    [super tearDown];
}

- (void)testSizeToFitMaxWidthSingleLine {
        
    NSInteger maxWidth = 50;
    
    [label sizeToFitMaxWidth:maxWidth];
    
    BOOL lessThan = (label.width <= 50);
    
    STAssertTrue(lessThan, @"UILabel should not be wider than max width");
}

- (void)testSizeToFitMaxWidthManyLines {
    
    label.numberOfLines = 0;

    NSInteger maxWidth = 50;

    [label sizeToFitMaxWidth:maxWidth];
    
    BOOL lessThan = (label.width <= maxWidth);
    
    STAssertTrue(lessThan, @"UILabel should not be wider than max width");
}

- (void)testSizeToFitMaxSize {
    label.numberOfLines = 0;
    
    CGSize maxSize = CGSizeMake(100, 100);
    
    [label sizeToFitMaxSize:maxSize];
    
    BOOL widthLessThan = (label.width <= maxSize.width);
    BOOL heightLessThan = (label.height <= maxSize.height);
    
    STAssertTrue(widthLessThan, @"UILabel should not be wider than max width");
    STAssertTrue(heightLessThan, @"UILabel should not be taller than max height");
}

@end
