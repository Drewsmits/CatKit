//
//  NSManagedObject+CatKit.h
//  CatKit
//
//  Created by Andrew Smith on 7/19/12.
//  Copyright (c) 2012 Andrew B. Smith. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObject (CatKit)

+ (id)createInContext:(NSManagedObjectContext *)context;

@end
