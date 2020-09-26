//
//  RATDetailViewController+UITextFieldDelegate.m
//  MyPlaces
//
//  Created by Artem Rakhmatulin on 25/09/2020.
//  Copyright © 2020 Rakhmatulin Artem Timurovich IP. All rights reserved.
//

#import "RATDetailViewController.h"

@interface RATDetailViewController (UITextFieldDelegate) <UITextFieldDelegate>

@end

@implementation RATDetailViewController (UITextFieldDelegate)

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
} //textFieldShouldReturn:

@end
