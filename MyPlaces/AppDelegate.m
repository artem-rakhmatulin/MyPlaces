//
//  AppDelegate.m
//  Homepwner
//
//  Created by Artem Rakhmatulin on 16/09/2020.
//  Copyright © 2020 Rakhmatulin Artem Timurovich IP. All rights reserved.
//

#import "AppDelegate.h"
#import "RATPlacesViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    RATPlacesViewController *itemsViewController = [[RATPlacesViewController alloc] init];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:itemsViewController];
    self.window.rootViewController = navController;
    self.window.backgroundColor = UIColor.whiteColor;
    [self.window makeKeyAndVisible];
    return YES;
}// application:didFinishLaunchingWithOptions:

@end
