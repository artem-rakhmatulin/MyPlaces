//
//  RATImageStore.m
//  MyPlaces
//
//  Created by Artem Rakhmatulin on 25/09/2020.
//  Copyright © 2020 Rakhmatulin Artem Timurovich IP. All rights reserved.
//

#import "RATImageStore.h"

@interface RATImageStore ()

@property (nonatomic, copy) NSMutableDictionary *dictionary;

@end

@implementation RATImageStore

#pragma mark - Singleton
+ (instancetype)sharedStore
{
    static RATImageStore *sharedStore = nil;
    
    if (!sharedStore)
        sharedStore = [[self alloc] initPrivate];
    return sharedStore;
} //sharedStore

#pragma mark - Initializers
- (instancetype)init
{
    NSException *exc = [NSException exceptionWithName:@"Singletone"
                                               reason:@"Use +[RATImageStore sharedStore]"
                                             userInfo:nil];
    [exc raise];
    return nil;
} //init

// Secret designated initializer
- (instancetype)initPrivate
{
    self = [super init];
    
    if (self)
        self->_dictionary = [NSMutableDictionary dictionary];
    
    return self;
} //initPrivate

#pragma mark - Other instance methods
- (void)setImage:(UIImage *)image forKey:(NSUUID *)key
{
    self.dictionary[key] = image;
} //setImage:forKey:

- (UIImage *)imageForKey:(NSUUID *)key
{
    return self.dictionary[key];
} //imageForKey

- (void)removeImageForKey:(NSUUID *)key
{
    if (key)
        [self.dictionary removeObjectForKey:key];
}

@end
