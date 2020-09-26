//
//  RATImageStore.h
//  MyPlaces
//
//  Created by Artem Rakhmatulin on 25/09/2020.
//  Copyright © 2020 Rakhmatulin Artem Timurovich IP. All rights reserved.
//

@import UIKit;

NS_ASSUME_NONNULL_BEGIN

@interface RATImageStore : NSObject

+ (instancetype)sharedStore;

- (void)setImage:(UIImage *)image forKey:(NSUUID *)key;
- (UIImage *)imageForKey:(NSUUID *)key;
- (void)removeImageForKey:(NSUUID *)key;

@end

NS_ASSUME_NONNULL_END
