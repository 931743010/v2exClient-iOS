//
//  V2ProfileViewController.m
//  v2ex
//
//  Created by sixleaves on 15/9/22.
//  Copyright © 2015年 sixleaves. All rights reserved.
//

#import "V2ProfileViewController.h"

@interface V2ProfileViewController ()

@end

@implementation V2ProfileViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    //self.view.backgroundColor = UIColor.redColor;
    self.navigationItem.title = @"个人";
    
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
