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

+ (NSFetchRequest *)fetchRequestInContext:(NSManagedObjectContext *)context;

+ (NSPropertyDescription *)propertyDescriptionForProperty:(NSString *)propertyName 
                                                inContext:(NSManagedObjectContext *)context;

+ (NSArray *)findAllInContext:(NSManagedObjectContext *)context;

+ (NSArray *)findAllInContext:(NSManagedObjectContext *)context
            matchingPredicate:(NSPredicate *)predicate;

+ (NSArray *)findAllInContext:(NSManagedObjectContext *)context
            matchingPredicate:(NSPredicate *)predicate 
                        limit:(NSUInteger)limit;

+ (NSArray *)findAllInContext:(NSManagedObjectContext *)context
            matchingPredicate:(NSPredicate *)predicate 
                        limit:(NSUInteger)limit
                       sortBy:(NSArray *)sortDescriptors;

+ (NSArray *)findAllInContext:(NSManagedObjectContext *)context
            matchingPredicate:(NSPredicate *)predicate 
                        limit:(NSUInteger)limit
                       sortBy:(NSArray *)sortDescriptors
       includesPropertyValues:(BOOL)propertyValues
          includesSubentities:(BOOL)subentities;

- (void)saveInContext:(NSManagedObjectContext *)context;

- (void)deleteObjectinContext:(NSManagedObjectContext *)context
                      andSave:(BOOL)save;

+ (id)executeFetchRequest:(NSFetchRequest *)request
                inContext:(NSManagedObjectContext *)context;

+ (id)executeFetchRequestAndReturnFirstObject:(NSFetchRequest *)request 
                                    inContext:(NSManagedObjectContext *)context;

+ (NSUInteger)numberOfEntitiesForFetchRequest:(NSFetchRequest *)request
                                    inContext:(NSManagedObjectContext *)context;

- (NSURL *)objectURI;

- (BOOL)hasBeenDeleted;


@end
