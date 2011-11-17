//
//  NSString+CatKit.m
//  CatKit
//
//  Created by Andrew Smith on 10/19/11.
//  Copyright (c) 2011 Andrew B. Smith. All rights reserved.
//

#import "NSString+CatKit.h"

@implementation NSString (CatKit)

- (NSString*)urlEncodedString { 
	return [self urlEncodedStringWithEncoding:NSUTF8StringEncoding];
}

// See http://github.com/pokeb/asi-http-request/raw/master/Classes/ASIFormDataRequest.m
- (NSString *)urlEncodedStringWithEncoding:(NSStringEncoding)encoding { 
	NSString *urlEncodedString = [(NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)self, NULL, (CFStringRef)@":/?#[]@!$ &'()*+,;=\"<>%{}|\\^~`", CFStringConvertNSStringEncodingToEncoding(encoding)) autorelease];
	
    return urlEncodedString ? urlEncodedString : @"";
}

- (BOOL)isEmailAddress {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"; 
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex]; 
    
    return [emailTest evaluateWithObject:self];
}

@end
