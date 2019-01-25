//
//  SimpleStatusLayout.m
//  DemoFamily
//
//  Created by Kevin on 2019/1/13.
//  Copyright © 2019年 Kevin. All rights reserved.
//

#import "SimpleStatusLayout.h"

@implementation SimpleStatusLayout

- (instancetype)initWithStatus:(SimpleModel *)statusTitle {
    self = [super init];
    if (self) {
        _statusTitle = statusTitle;
        [self layout];
    }
    return self;
}
- (void )layout {
    _marginTop = kWBCellTopMargin;
    _titleHeight = 0;
    //文本布局
    [self layoutTitle];
    
    // 计算高度
    _height = 0;
//    _height += _marginTop;
    _height += _titleHeight;
    
}

- (void )layoutTitle {
    _titleHeight = 0;
    _titleTextLayout = nil;
    NSString *textString = _statusTitle.text;
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:textString];
    text.color = kWBCellToolbarTitleColor;
    text.font = [UIFont systemFontOfSize:kWBCellTitlebarFontSize];
    YYTextContainer *container = [YYTextContainer containerWithSize:CGSizeMake(kScreenWidth - 100, kWBCellTitleHeight + 80)];
    _titleTextLayout = [YYTextLayout layoutWithContainer:container text:text];
    _titleHeight = kWBCellTitleHeight + 80;
    
}

@end
