//
//  TextAsyncCell.m
//  DemoFamily
//
//  Created by Kevin on 2019/1/11.
//  Copyright © 2019年 Kevin. All rights reserved.
//

#import "TextAsyncCell.h"

@implementation TextAsyncCell{
    UILabel *_uiLabel;
    YYLabel *_yyLabel;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.backgroundColor = [UIColor clearColor];
    self.contentView.backgroundColor = [UIColor clearColor];
    [self handelDefaultData];
    return self;
}
- (void)handelDefaultData {
    _uiLabel = [UILabel new];
    _uiLabel.font = [UIFont systemFontOfSize:8];
    _uiLabel.numberOfLines = 0;
    _uiLabel.size = CGSizeMake(kScreenWidth-40, kCellHeight);
    _uiLabel.left = 20;
    _uiLabel.textAlignment = NSTextAlignmentCenter;
    
    _yyLabel = [YYLabel new];
    _yyLabel.font = _uiLabel.font;
    _yyLabel.numberOfLines = _uiLabel.numberOfLines;
    _yyLabel.size = _uiLabel.size;
    _yyLabel.displaysAsynchronously = YES; /// enable async display
    _yyLabel.hidden = YES;
    _yyLabel.textAlignment = NSTextAlignmentCenter;
    _yyLabel.textVerticalAlignment = YYTextVerticalAlignmentCenter;
    _yyLabel.left = _uiLabel.left;
    
    [self.contentView addSubview:_uiLabel];
    [self.contentView addSubview:_yyLabel];
}
- (void)setAsync:(BOOL)async {
    if (_async == async) return;
    _async = async;
    _uiLabel.hidden = async;
    _yyLabel.hidden = !async;
}

- (void)setAyncText:(id)text {
    if (_async) {
        _yyLabel.layer.contents = nil;
        _yyLabel.textLayout = text;
    } else {
        _uiLabel.attributedText = text;
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
