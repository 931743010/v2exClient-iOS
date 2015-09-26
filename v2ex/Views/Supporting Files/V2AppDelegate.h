//
//  V2AppDelegate.h
//  v2ex
//
//  Created by sixleaves on 15/9/21.
//  Copyright © 2015年 sixleaves. All rights reserved.
//

#import <UIKit/UIKit.h>
@class V2RootViewController;
@class SWPNavigationController;
@interface V2AppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) UIWindow * window;

// 为什么一处用strong, 一处用assign
@property (nonatomic, strong) V2RootViewController * rootViewController;
@property (nonatomic, assign) SWPNavigationController * currentNavigationController;

@end
