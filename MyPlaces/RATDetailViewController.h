//
//  RATDetailViewController.h
//  Homepwner
//
//  Created by Artem Rakhmatulin on 21/09/2020.
//  Copyright © 2020 Rakhmatulin Artem Timurovich IP. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RATPlace;

NS_ASSUME_NONNULL_BEGIN

@interface RATDetailViewController : UIViewController

@property (nonatomic,strong) RATPlace *place;

@end

NS_ASSUME_NONNULL_END
