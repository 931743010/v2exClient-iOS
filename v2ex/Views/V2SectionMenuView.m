//
//  V2SectionMenuView.m
//  v2ex
//
//  Created by sixleaves on 15/9/23.
//  Copyright © 2015年 sixleaves. All rights reserved.
//
#import <objc/runtime.h>
#import "V2SectionMenuView.h"
#import "V2SectionMenuCell.h"
#import <BlocksKit.h>
#import <UIView+BlocksKit.h>



static CGFloat const kAvatarHeight = 70.0f;
@interface V2SectionMenuView () <UITableViewDataSource, UITableViewDelegate>


@property (nonatomic, strong) UIImageView *avatorImageView;

@property (nonatomic, strong) UIButton *avatorButton;

@property (nonatomic, strong) UIImageView *divideLine;

/** menuView下半部分对应的是一个tableView */
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) NSArray *sectionImages;

@property (nonatomic, strong) UIAlertController * alertVC;




@end

@implementation V2SectionMenuView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.sectionImages = @[@"section_latest", @"section_categories", @"section_nodes", @"section_fav", @"section_notification", @"section_profile"];
        self.titles = @[@"最新", @"分类", @"节点", @"收藏", @"提醒", @"个人"];
        
        [self setup];
    
    }
    
    return self;
}
static NSString * const contentCellID = @"contentCell";
- (void)setup {
    
    [self setupTableView];
    
    [self setupProfileView];
    
    [self setupAlertController];
}


- (void)setupAlertController {
    
    self.alertVC = [UIAlertController alertControllerWithTitle:@"是否注销" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction * logout = [UIAlertAction actionWithTitle:@"注销" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [self.alertVC addAction: logout];
    [self.alertVC addAction: cancel];
    

    
    
}


- (void)setupTableView {
    
    // 内容
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[V2SectionMenuCell class] forCellReuseIdentifier: contentCellID];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.contentInsetTop = 140;
    [self addSubview: self.tableView];
    
}


- (void)setupProfileView {
    
    self.avatorButton = [UIButton buttonWithType: UIButtonTypeCustom];
    self.avatorButton.layer.borderColor = RGB(0x8a8a8a, 1.0).CGColor;
    self.avatorButton.layer.borderWidth = .5;
    [self.avatorButton setBackgroundImage:[UIImage imageNamed:@"avatar_default"] forState:UIControlStateNormal];
    
    // 弹出注销
    [self.avatorButton bk_whenTapped:^{
        UIViewController * vc = [UIApplication sharedApplication].keyWindow.rootViewController;
        
        [vc presentViewController:self.alertVC animated: YES completion: nil];
    }];
    
    [self addSubview: self.avatorButton];
    
    // 分割线
    self.divideLine = [[UIImageView alloc] init];
    self.divideLine.contentMode = UIViewContentModeScaleAspectFill;
    self.divideLine.image = [UIImage imageNamed: @"section_divide"];
    [self addSubview: self.divideLine];
    
    // test
    //self.avatorButton.backgroundColor = UIColor.redColor;
    
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    self.avatorImageView.frame = (CGRect){30, 30, 70, 70};
    self.avatorButton.frame = (CGRect){30, 30, 70, 70};//self.avatorImageView.frame;
    self.divideLine.frame = (CGRect){-self.width, CGRectGetMaxY(self.avatorButton.frame) + 20, self.width * 2, 0.5};
    self.tableView.frame = (CGRect){0, 0, self.width, self.height};
    self.tableView.rowHeight = (self.height - 120 - 100) / self.titles.count;
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.titles.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    V2SectionMenuCell * cell = [tableView dequeueReusableCellWithIdentifier:contentCellID];
    
    cell.imageName = self.sectionImages[indexPath.row];
    cell.title = self.titles[indexPath.row];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    !self.didSelectedIndex? : self.didSelectedIndex(indexPath.row);

}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    
    CGFloat offsetY = -scrollView.contentOffsetY;
    
    CGFloat dragDis = offsetY - scrollView.contentInsetTop;
    
    CGFloat avatorY = 30 + dragDis / [self factor: dragDis];
    
    CGFloat divdY = CGRectGetMaxY(self.avatorButton.frame);
    
    if (dragDis >= 0) {
        
        divdY += 20 * [self factor: dragDis];
        
    }else {
        
        divdY += 20;
    }
    
   // V2Log(@"%f", self.avatorButton.y);

    self.avatorButton.y = avatorY;
    
    self.divideLine.y = divdY;
    
}

- (CGFloat)factor:(CGFloat)sign{
    
    if (sign >= 0) return 1.7;
    if (sign < 0) return 0.7;
    return 1;

}

@end
