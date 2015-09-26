//
//  UIImage+Tint.h
//  v2ex
//
//  Created by sixleaves on 15/9/23.
//  Copyright © 2015年 sixleaves. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Tint)

- (UIImage *) imageWithTintColor:(UIColor *)tintColor;
- (UIImage *) imageWithGradientTintColor:(UIColor *)tintColor;

@end
