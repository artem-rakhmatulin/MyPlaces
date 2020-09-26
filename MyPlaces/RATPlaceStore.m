//
//  RATItemStore.m
//  Homepwner
//
//  Created by Artem Rakhmatulin on 16/09/2020.
//  Copyright © 2020 Rakhmatulin Artem Timurovich IP. All rights reserved.
//

#import "RATPlace.h"
#import "RATPlaceStore.h"
#import "RATImageStore.h"

@interface RATPlaceStore ()

@property (nonatomic) NSMutableArray *privatePlaces;

@end

@implementation RATPlaceStore

#pragma mark - Singleton
+ (instancetype)sharedStore
{
    static RATPlaceStore *sharedStore; // = nil;
    if (!sharedStore) {
        sharedStore = [[RATPlaceStore alloc] initPrivate];
    }
    return sharedStore;
} //sharedStore

#pragma mark - Initializers
- (instancetype)init
{
    NSException *singletonExeption = [[NSException alloc] initWithName:@"Singleton"
                                                                reason:@"Use +[RATItemStore sharedStore]"
                                                              userInfo:nil];
    @throw singletonExeption;
    return nil;
} //init

- (instancetype)initPrivate
{
    self = [super init];
    if (self) {
        self->_privatePlaces = [[NSMutableArray alloc] init];
    }
    return self;
} //initPrivate

#pragma mark - Other instance methods
- (NSArray *)allPlaces
{
    return [self.privatePlaces copy];
} //allPlaces

- (RATPlace *)createPlace
{
    RATPlace *newPlace = [[RATPlace alloc] init];
    [self.privatePlaces addObject:newPlace];
    return newPlace;
} //createPlace

- (void)removePlace:(RATPlace *)place
{
    [self.privatePlaces removeObjectIdenticalTo:place];
    [[RATImageStore sharedStore] removeImageForKey:place.uuid];
} //removePlace:

- (void)movePlaceAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex
{
    if (fromIndex == toIndex) return;
    
    RATPlace *itemToMove = self.privatePlaces[fromIndex];
    [self.privatePlaces removeObjectAtIndex:fromIndex];
    [self.privatePlaces insertObject:itemToMove atIndex:toIndex];
} //movePlaceAtIndex:toIndex:

@end
