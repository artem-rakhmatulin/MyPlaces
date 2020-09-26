//
//  RATItemStore.h
//  Homepwner
//
//  Created by Artem Rakhmatulin on 16/09/2020.
//  Copyright © 2020 Rakhmatulin Artem Timurovich IP. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RATPlace;

NS_ASSUME_NONNULL_BEGIN

@interface RATPlaceStore : NSObject

@property (nonatomic, readonly) NSArray *allPlaces;

+ (instancetype)sharedStore;

- (RATPlace *)createPlace;
- (void)removePlace:(RATPlace *)item;
- (void)movePlaceAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;

@end

NS_ASSUME_NONNULL_END
