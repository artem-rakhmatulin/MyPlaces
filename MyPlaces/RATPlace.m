//
//  RATItem.m
//  RandomItems
//
//  Created by Artem Rakhmatulin on 16/09/2020.
//  Copyright © 2020 Rakhmatulin Artem Timurovich IP. All rights reserved.
//

#import "RATPlace.h"

@implementation RATPlace

#pragma mark - Initializers
- (instancetype)initWithName:(NSString *)name
                        note:(NSString *)note
{
    self = [super init];

    if (self) {
        self->_name = name;
        self->_note = note;
        self->_dateCreated = [NSDate date];
        self->_uuid = [NSUUID UUID];
    }

    return self;
}  //initWithName:note:

- (instancetype)init
{
    return [self initWithName:@"" note:@""];
} //init

#pragma mark - Other instance methods
- (NSString *)description
{
    NSString *descriptionString = [[NSString alloc] initWithFormat:
                                   @"Name %@, recorded on %@",
                                   self.name,
                                   self.dateCreated];
    return descriptionString;
} //descritpion

@end
