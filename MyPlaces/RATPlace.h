//
//  RATPlace.h
//  RandomItems
//
//  Created by Artem Rakhmatulin on 16/09/2020.
//  Copyright © 2020 Rakhmatulin Artem Timurovich IP. All rights reserved.
//

@import Foundation;

@interface RATPlace : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *note;
@property (nonatomic, strong, readonly) NSDate *dateCreated;
@property (nonatomic, copy) NSUUID *uuid;

// Designated initializer for BNRItem
- (instancetype)initWithName:(NSString *)name
                        note:(NSString *)note;

@end
