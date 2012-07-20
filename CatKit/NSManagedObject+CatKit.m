//
//  NSManagedObject+CatKit.m
//  CatKit
//
//  Created by Andrew Smith on 7/19/12.
//  Copyright (c) 2012 Andrew B. Smith. All rights reserved.
//

#import "NSManagedObject+CatKit.h"
#import "CKCommonMacros.h"

@implementation NSManagedObject (CatKit)

#pragma mark - Error Handler

+ (void)handleErrors:(NSError *)error
{
    if (error) {
        NSDictionary *userInfo = [error userInfo];
        for (NSArray *detailedError in [userInfo allValues]) {
            if ([detailedError isKindOfClass:[NSArray class]]) {
                for (NSError *e in detailedError) {
                    if ([e respondsToSelector:@selector(userInfo)]) {
                        NSLog(@"Error Details: %@", [e userInfo]);
                    }
                    else {
                        NSLog(@"Error Details: %@", e);
                    }
                }
            }
            else {
                NSLog(@"Error: %@", detailedError);
            }
        }
        NSLog(@"Error Domain: %@", [error domain]);
        NSLog(@"Recovery Suggestion: %@", [error localizedRecoverySuggestion]);
    }
}

#pragma mark - Create

+ (id)createInContext:(NSManagedObjectContext *)context
{            
    NSEntityDescription *entity = [NSEntityDescription entityForName:[self description] 
                                              inManagedObjectContext:context];
    
    id obj = [[self alloc] initWithEntity:entity 
           insertIntoManagedObjectContext:context];
    
    return obj;
}

+ (NSFetchRequest *)fetchRequestInContext:(NSManagedObjectContext *)context
{
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:self.description 
                                                         inManagedObjectContext:context];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDescription];
    return request;
}

#pragma mark - Find

+ (NSArray *)findAllInContext:(NSManagedObjectContext *)context 
{
	return [self findAllInContext:context 
                matchingPredicate:[NSPredicate predicateWithFormat:@"1 = 1"]];
}

+ (NSArray *)findAllInContext:(NSManagedObjectContext *)context 
            matchingPredicate:(NSPredicate *)predicate
{
	return [self findAllInContext:context
                matchingPredicate:predicate 
                             limit:0];
}

+ (NSArray *)findAllInContext:(NSManagedObjectContext *)context 
            matchingPredicate:(NSPredicate *)predicate
                        limit:(NSUInteger)limit 
{
	return [self findAllInContext:context
                matchingPredicate:predicate 
                            limit:0 
                           sortBy:nil];
}

+ (NSArray *)findAllInContext:(NSManagedObjectContext *)context 
            matchingPredicate:(NSPredicate *)predicate
                        limit:(NSUInteger)limit 
                       sortBy:(NSArray *)sortDescriptors 
{
	return [self findAllInContext:context
                matchingPredicate:predicate 
                            limit:0 
                           sortBy:nil
           includesPropertyValues:NO 
              includesSubentities:NO];
}

+ (NSArray *)findAllInContext:(NSManagedObjectContext *)context 
            matchingPredicate:(NSPredicate *)predicate
                        limit:(NSUInteger)limit 
                       sortBy:(NSArray *)sortDescriptors
       includesPropertyValues:(BOOL)propertyValues
          includesSubentities:(BOOL)subentities
{
    NSFetchRequest *request = [self fetchRequestInContext:context];
    [request setPredicate:predicate];
    request.sortDescriptors = sortDescriptors;
    [request setIncludesPropertyValues:propertyValues];
    [request setIncludesSubentities:subentities];
    [request setPredicate:predicate];

    if (limit) {
        request.fetchLimit = limit;
    }
        
    NSError *error = nil;
    NSArray *array = [context executeFetchRequest:request 
                                            error:&error];
    
	return array;
}

#pragma - Save/Delete

- (void)saveInContext:(NSManagedObjectContext *)context
{
    NSError *error = nil;
    if (context != nil) {
        if ([context hasChanges] && ![context save:&error]) {
            /*
             Replace this implementation with code to handle the error appropriately.
             
             abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
             */
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        } 
    }
}

- (void)deleteObjectinContext:(NSManagedObjectContext *)context
                      andSave:(BOOL)save
{
    [context deleteObject:self];
    if (save) [self saveInContext:context];
}

#pragma mark - Fetch

+ (NSArray *)executeFetchRequest:(NSFetchRequest *)request
                inContext:(NSManagedObjectContext *)context
{
    NSError *error = nil;
    NSArray *results = [context executeFetchRequest:request error:&error];
    [self handleErrors:error];
    return results;
}

+ (id)executeFetchRequestAndReturnFirstObject:(NSFetchRequest *)request 
                                    inContext:(NSManagedObjectContext *)context
{
    [request setFetchLimit:1];
    NSArray *results = [self executeFetchRequest:request inContext:context];
    if (IsEmpty(results)) return nil;
    return [results objectAtIndex:0];
}

+ (NSUInteger)numberOfEntitiesForFetchRequest:(NSFetchRequest *)request
                                    inContext:(NSManagedObjectContext *)context 
{
    NSError *error = nil;
    NSUInteger count = [context countForFetchRequest:request error:&error];
    [self handleErrors:error];
    return count;
}

#pragma mark - 

- (NSURL *)objectURI 
{
    return self.objectID.URIRepresentation;
}

+ (NSManagedObject *)objectForURI:(NSURL *)objectURI 
                        inContext:(NSManagedObjectContext *)context
{
    NSManagedObjectID *objectID = [[context persistentStoreCoordinator] managedObjectIDForURIRepresentation:objectURI];
    if (!objectID) return nil;
    
    NSManagedObject *objectForID = [context objectWithID:objectID];
    if (![objectForID isFault]) return objectForID;
    
    NSFetchRequest *request = [self fetchRequestInContext:context];
    
    // Predicate for fetching self.  Code is faster than string predicate equivalent of 
    // [NSPredicate predicateWithFormat:@"SELF = %@", objectForID];
    NSPredicate *predicate = [NSComparisonPredicate predicateWithLeftExpression:[NSExpression expressionForEvaluatedObject] 
                                                                rightExpression:[NSExpression expressionForConstantValue:objectForID]
                                                                       modifier:NSDirectPredicateModifier
                                                                           type:NSEqualToPredicateOperatorType
                                                                        options:0];
    [request setPredicate:predicate];
    
    return [self executeFetchRequest:request 
                           inContext:context];
    
}

- (BOOL)hasBeenDeleted 
{    
    /**
     Sometimes CoreData will fault a particular instance, while there is still
     the same object in the store.  Check to see if there is a clone.
     */
    NSManagedObjectID   *objectID           = [self objectID];
    NSManagedObject     *managedObjectClone = [[self managedObjectContext] existingObjectWithID:objectID 
                                                                                          error:NULL];
    
    if (!managedObjectClone || [self isDeleted]) {
        return YES;
    } else {
        return NO;
    }
}

@end
