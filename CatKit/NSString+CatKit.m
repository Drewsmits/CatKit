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
	NSString *urlEncodedString = (__bridge_transfer NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (__bridge CFStringRef)self, NULL, (CFStringRef)@":/?#[]@!$ &'()*+,;=\"<>%{}|\\^~`", CFStringConvertNSStringEncodingToEncoding(encoding));
	
    return urlEncodedString ? urlEncodedString : @"";
}

- (BOOL)isEmailAddress
{
    // http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
    
    BOOL strict = YES;
    NSString *stricterFilterString = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSString *laxString            = @".+@.+\\.[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex           = strict ? stricterFilterString : laxString;
    NSPredicate *emailTest         = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

- (NSString *)lowercaseFirstLetterOnlyString {
    NSString *firstCharacterInString = [[self substringToIndex:1] lowercaseString];
    return [self stringByReplacingCharactersInRange:NSMakeRange(0,1) withString:firstCharacterInString];
}

@end
