//
//  V2MenuView.m
//  v2ex
//
//  Created by sixleaves on 15/9/22.
//  Copyright © 2015年 sixleaves. All rights reserved.
//

#import "V2MenuView.h"
#import "V2SectionMenuView.h"
@interface V2MenuView ()

@property (nonatomic, strong) V2SectionMenuView *menuView;

@property (nonatomic, strong) UIButton *backgroundView;

@property (nonatomic, assign) CGRect menuViewFrame;


@end


@implementation V2MenuView


- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:[UIScreen mainScreen].bounds]) {
        
        [self setup];
        
    }
    
    return self;
}

- (void)setFrame:(CGRect)frame {
    
    self.menuViewFrame = frame;
    [super setFrame:[UIScreen mainScreen].bounds];
    
}



- (void)setup {
    
    self.backgroundView = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.backgroundView addTarget:self action:@selector(hideWithAnimation) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview: self.backgroundView];
    
    self.contentView = [[UIView alloc] init];
    [self addSubview: self.contentView];
    
    self.menuView = [[V2SectionMenuView alloc] init];
    [self.contentView addSubview: self.menuView];
    
    
    __weak __typeof(self) weakSelf = self;
    [self.menuView setDidSelectedIndex:^(NSInteger index) {
        
        !weakSelf.didSelectedIndex? : weakSelf.didSelectedIndex(index);
        
    }];
    
    
}



- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.backgroundView.frame = [UIScreen mainScreen].bounds;
    
    self.contentView.frame = self.menuViewFrame;
    self.menuView.frame = self.menuViewFrame;
    
    
    self.contentView.layer.shadowColor = UIColor.blackColor.CGColor;
    self.contentView.layer.shadowOffset = (CGSize){5, 0};
    self.contentView.layer.shadowOpacity = 0.5;
    
    self.backgroundView.alpha = 0.5;
    self.backgroundView.backgroundColor = [UIColor blackColor];

    
    // test
    self.menuView.backgroundColor = UIColor.greenColor;
}


- (void)hideWithAnimation {


    [UIView animateWithDuration:0.3 animations:^{
        
        
        self.contentView.x = -self.menuView.bounds.size.width;
        self.backgroundView.alpha = 0.0;
        
    } completion:^(BOOL finished) {
        self.hidden = finished;
    }];
    

}

- (void)showWithAnimation {
    
    self.hidden = NO;
    
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.85 initialSpringVelocity:3 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        self.contentView.x = 0;
        self.backgroundView.alpha = 0.5;
        
    } completion:^(BOOL finished) {
        
    }];

}


@end
