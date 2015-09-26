//
//  V2RootViewController.m
//  v2ex
//
//  Created by sixleaves on 15/9/21.
//  Copyright © 2015年 sixleaves. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "V2RootViewController.h"
#import "V2MenuView.h"

#import "V2LatestViewController.h"
#import "V2CategoriesViewController.h"
#import "V2NodesViewController.h"
#import "V2FavoriteViewController.h"
#import "V2NotificationViewController.h"
#import "V2ProfileViewController.h"

#import "SWPNavigationController.h"

#import <BlocksKit.h>
#import <BlocksKit+UIKit.h>

@interface V2RootViewController ()

// menuView
@property (nonatomic, strong) V2MenuView * menuView;

// 控制器
@property (nonatomic, strong) V2LatestViewController * latestVC;

@property (nonatomic, strong) V2CategoriesViewController * categoriesVC;

@property (nonatomic, strong) V2NodesViewController * nodesVC;

@property (nonatomic, strong) V2FavoriteViewController * favoriteVC;

@property (nonatomic, strong) V2NotificationViewController * notificationVC;

@property (nonatomic, strong) V2ProfileViewController * profileVC;


// 导航控制器
@property (nonatomic, strong) SWPNavigationController * lastestNavigationVC;

@property (nonatomic, strong) SWPNavigationController * categoriesNavigationVC;

@property (nonatomic, strong) SWPNavigationController * nodesNavigationVC;

@property (nonatomic, strong) SWPNavigationController * favoriteNavigationVC;

@property (nonatomic, strong) SWPNavigationController * notificationNavigationVC;

@property (nonatomic, strong) SWPNavigationController * profileNavigationVC;


// 在自定义一个容器, 包装住
@property (nonatomic, strong) UIView * viewControllerContainView;


// 记录上一个控制器
@property (nonatomic, assign) NSInteger currentIndex;


@property (nonatomic, strong) UIButton * rootBackgroundButton;

@end

@implementation V2RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    [self setupViewControllers];
    
    [self setupViews];
    
    [self setupNotifications];
    
}

- (void)setupViewControllers {

    self.viewControllerContainView = [[UIView alloc] initWithFrame: (CGRect){0, 0, kScreenWidth, kScreenHeight }];
    //self.viewControllerContainView.backgroundColor = UIColor.redColor;
    [self.view addSubview: self.viewControllerContainView];
    

    self.latestVC = [[V2LatestViewController alloc] init];
    self.lastestNavigationVC = [[SWPNavigationController alloc] initWithRootViewController: self.latestVC];
    
    self.categoriesVC = [[V2CategoriesViewController alloc] init];
    self.categoriesNavigationVC = [[SWPNavigationController alloc] initWithRootViewController: self.categoriesVC];
    
    self.nodesVC = [[V2NodesViewController alloc] init];
    self.nodesNavigationVC = [[SWPNavigationController alloc] initWithRootViewController:self.nodesVC];
    
    self.favoriteVC = [[V2FavoriteViewController alloc] init];
    self.favoriteNavigationVC = [[SWPNavigationController alloc] initWithRootViewController:self.favoriteVC];
    
    self.notificationVC = [[V2NotificationViewController alloc] init];
    self.notificationNavigationVC = [[SWPNavigationController alloc] initWithRootViewController:self.notificationVC];
    
    self.profileVC = [[V2ProfileViewController alloc] init];
    self.profileNavigationVC = [[SWPNavigationController alloc] initWithRootViewController:self.profileVC];
    
    
    [self.viewControllerContainView addSubview: self.lastestNavigationVC.view ];
    
}

- (void)hideWithAnimation {
    
    [UIView animateWithDuration:0.3 animations:^{

        
    }];
    
    
}


- (void)setupViews {
    
    self.menuView = [[V2MenuView alloc] init];
    self.menuView.frame = (CGRect){0, 0, kMenuViewWidth, kMenuViewHeight};
    [self.view addSubview:self.menuView];
    
    __weak __typeof(self) weakSelf = self;
    [self.menuView setDidSelectedIndex:^(NSInteger index) {
        
        SWPNavigationController * nav = (SWPNavigationController *)[weakSelf viewControllerForIndex: index];
        
        SWPNavigationController * currentNav = (SWPNavigationController *)[weakSelf viewControllerForIndex:weakSelf.currentIndex];
        
        [weakSelf.lastestNavigationVC.view removeFromSuperview];
        
        [weakSelf.viewControllerContainView addSubview: nav.view];
        
        weakSelf.lastestNavigationVC = nav;
        
        [weakSelf.menuView hideWithAnimation];
    }];
    
}

- (UIViewController *)viewControllerForIndex:(NSInteger) index{
    
    switch (index) {
        case 0:
            return self.lastestNavigationVC;
            break;
        case 1:
            return self.categoriesNavigationVC;
            break;
        case 2:
            return self.nodesNavigationVC;
            break;
        case 3:
            return self.favoriteNavigationVC;
            break;
        case 4:
            return self.notificationNavigationVC;
            break;
        case 5:
            return self.profileNavigationVC;
            break;
        default:
            return nil;
            break;
    }
    
}



- (void)setupNotifications {
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showMenuView) name:kShowMenuNotification object: nil];
    
}

- (void)showMenuView {
    
    [self.menuView showWithAnimation];
    
}

- (void)viewWillLayoutSubviews {
    
    self.rootBackgroundButton.frame = self.view.frame;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
    
}



@end
