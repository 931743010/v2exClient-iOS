//
//  V2CategoriesViewController.m
//  v2ex
//
//  Created by sixleaves on 15/9/22.
//  Copyright © 2015年 sixleaves. All rights reserved.
//

#import "V2CategoriesViewController.h"

@interface V2CategoriesViewController ()

@end

@implementation V2CategoriesViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    //self.view.backgroundColor = UIColor.redColor;
    self.navigationItem.title = @"分类";
    
    self.navigationController.navigationBar.translucent = NO;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"navi_menu_2"] style:UIBarButtonItemStylePlain target:self action:@selector(didClicked) ];
    
}


- (void)didClicked {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kShowMenuNotification object: nil];
    
}

- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver: self];
    
}

@end
