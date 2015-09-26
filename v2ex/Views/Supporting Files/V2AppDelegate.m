//
//  V2AppDelegate.m
//  v2ex
//
//  Created by sixleaves on 15/9/21.
//  Copyright © 2015年 sixleaves. All rights reserved.
//

#import "V2AppDelegate.h"
#import "V2RootViewController.h"
@implementation V2AppDelegate


- (BOOL)application:(nonnull UIApplication *)application didFinishLaunchingWithOptions:(nullable NSDictionary *)launchOptions {
    
    
    // v2ex的程序入口.入口控制器为V2RootViewController
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    self.rootViewController = [[V2RootViewController alloc] init];
    self.window.rootViewController = self.rootViewController;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
