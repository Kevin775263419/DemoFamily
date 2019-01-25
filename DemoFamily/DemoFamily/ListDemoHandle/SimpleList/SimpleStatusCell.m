//
//  SimpleStatusCell.m
//  DemoFamily
//
//  Created by Kevin on 2019/1/13.
//  Copyright © 2019年 Kevin. All rights reserved.
//

#import "SimpleStatusCell.h"

@implementation SimpleStatusCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.backgroundColor = [UIColor whiteColor];
    self.contentView.backgroundColor = [UIColor whiteColor];
    [self handelDefaultData];
    return self;
}
- (void )handelDefaultData {
    _titleLabel = [YYLabel new];
    _titleLabel.size = CGSizeMake(kScreenWidth - 100, kWBCellTitleHeight + 80);
    _titleLabel.left = kWBCellPadding;
    _titleLabel.displaysAsynchronously = YES;
    _titleLabel.ignoreCommonProperties = YES;
    _titleLabel.fadeOnHighlight = NO;
    _titleLabel.fadeOnAsynchronouslyDisplay = NO;
    _titleLabel.numberOfLines = 0 ;
    [self addSubview:_titleLabel];
    
    _uiLabel = [UILabel new];
    _uiLabel.textColor = _titleLabel.textColor;
    _uiLabel.size = CGSizeMake(kScreenWidth -100, kWBCellTitleHeight + 80);
    _uiLabel.left = kWBCellPadding + 30;
    _uiLabel.numberOfLines = 0;
    _uiLabel.font = [UIFont systemFontOfSize:18];
    [self addSubview:_uiLabel];
    _uiLabel.hidden = YES;
    
    CALayer *line = [CALayer layer];
    line.size = CGSizeMake(kScreenSize.width, CGFloatFromPixel(1));
    line.bottom = kWBCellTitleHeight + 80;
    line.backgroundColor = [UIColor lightGrayColor].CGColor;
    [self.layer addSublayer:line];
    
}
- (void)setLayout:(SimpleStatusLayout *)layout {
    self.height = layout.height;
    self.contentView.height = layout.height;
    
    if (layout.isRefresh) {
        _titleLabel.hidden = YES;
        _uiLabel.hidden = NO;
        _uiLabel.text = layout.statusTitle.text;
    }
    else {
        _titleLabel.hidden = NO;
        _uiLabel.hidden = YES;
        _titleLabel.textLayout = layout.titleTextLayout;
    }

}

@end
