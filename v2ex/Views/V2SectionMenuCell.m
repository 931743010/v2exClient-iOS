//
//  V2SectionMenuCell.m
//  v2ex
//
//  Created by sixleaves on 15/9/23.
//  Copyright © 2015年 sixleaves. All rights reserved.
//

#import "V2SectionMenuCell.h"
#import "UIImage+Tint.h"

@interface V2SectionMenuCell ()

/** cell的图片*/
@property (nonatomic, strong) UIImageView *iconImage;
/** cell的文字*/
@property (nonatomic, strong) UILabel *titleLable;


@property (nonatomic, strong) UIImage * highlightedImage;
@property (nonatomic, strong) UIImage * normalImage;

@end

@implementation V2SectionMenuCell


- (void)setImageName:(NSString *)imageName {
    
    _imageName = imageName;
    
    self.normalImage = [UIImage imageNamed: self.imageName];
    self.highlightedImage = [self.normalImage imageWithTintColor:RGB(0x3399FF, 1.0)];
    
    self.iconImage.image = self.normalImage;
    
}

- (void)setTitle:(NSString *)title {
    
    _title = title;
    self.titleLable.text = title;

}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        // 取消选中样式
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = UIColor.clearColor;
        
        
        [self setup];
    }
    
    return self;
}

- (void)setup {
    
    
    self.iconImage = [[UIImageView alloc] init];
    self.titleLable = [[UILabel alloc] init];
    
    [self.contentView addSubview: self.iconImage];
    [self.contentView addSubview: self.titleLable];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
    
    if (selected) {
        
        self.iconImage.image = self.highlightedImage;
        self.titleLable.textColor = RGB(0x3399FF, 1.0);
        self.backgroundColor = RGB(0xf5f5f5, 1.0);
    }else {
        
        self.iconImage.image = self.normalImage;
        self.titleLable.textColor = UIColor.blackColor;
        self.backgroundColor = UIColor.clearColor;
        
    }
    
}


- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    self.iconImage.frame = (CGRect){30, self.height / 2 - 9, 18, 18};
    self.titleLable.frame = (CGRect){85, 0, 110, self.height};
}

- (void)awakeFromNib {
    // Initialization code
}


@end
