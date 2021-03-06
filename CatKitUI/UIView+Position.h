//
//  UIView+Position.h
//  CatKit
//
//  Created by Andrew Smith on 9/9/11.
//  Copyright 2011 Andrew B. Smith. All rights reserved.
//


@interface UIView (Position)

@property (nonatomic, assign) CGFloat left;
@property (nonatomic, assign) CGFloat right;
@property (nonatomic, assign) CGFloat top;
@property (nonatomic, assign) CGFloat bottom;

@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;

@property (nonatomic, assign) CGFloat leftAligned;
@property (nonatomic, assign) CGFloat rightAligned;
@property (nonatomic, assign) CGFloat topAligned;
@property (nonatomic, assign) CGFloat bottomAligned;

@property (nonatomic, assign) CGFloat centerXAligned;
@property (nonatomic, assign) CGFloat centerYAligned;

@property (nonatomic, assign) CGPoint centerAligned;

@property (nonatomic, readonly) CGRect absoluteFrame;
@property (nonatomic, readonly) CGRect absoluteBounds;


@end
