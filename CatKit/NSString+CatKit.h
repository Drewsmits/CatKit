//
//  NSString+CatKit.h
//  CatKit
//
//  Created by Andrew Smith on 10/19/11.
//  Copyright (c) 2011 Andrew B. Smith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CatKit)

- (NSString*)urlEncodedString;

/**
See http://github.com/pokeb/asi-http-request/raw/master/Classes/ASIFormDataRequest.m
 */
- (NSString *)urlEncodedStringWithEncoding:(NSStringEncoding)encoding;

/**
 Uses regex to check and see if string is an email address.
 */
- (BOOL)isEmailAddress;

/**
 Lowercase the first letter of the string
 */
- (NSString *)lowercaseFirstLetterOnlyString;

/**
 Capitalize the first letter of the string
 */
- (NSString *)uppercaseFirstLetterOnlyString;

@end
