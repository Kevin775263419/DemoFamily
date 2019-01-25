//
//  SimpleStatusLayout.h
//  DemoFamily
//
//  Created by Kevin on 2019/1/13.
//  Copyright © 2019年 Kevin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SimpleModel.h"
#define kWBCellTopMargin 8      // cell 顶部灰色留白
#define kWBCellTitleHeight 36   // cell 标题高度 (例如"仅自己可见")
#define kWBCellPadding 12       // cell 内边距
#define kWBCellToolbarTitleColor UIColorHex(929292) // 工具栏文本色
#define kWBCellTitlebarFontSize 14 // 标题栏字体大小
#define kWBCellLineColor [UIColor colorWithWhite:0.000 alpha:0.09] //线条颜色





@interface SimpleStatusLayout : NSObject


- (instancetype)initWithStatus:(SimpleModel *)statusTitle;
@property (nonatomic, assign) BOOL isRefresh;
@property (nonatomic, strong) SimpleModel *statusTitle;
@property (nonatomic, assign) CGFloat marginTop; //顶部灰色留白
// 标题栏
@property (nonatomic, assign) CGFloat titleHeight; //标题栏高度，0为没标题栏
@property (nonatomic, strong) YYTextLayout *titleTextLayout; // 标题栏
// 总高度
@property (nonatomic, assign) CGFloat height;
@end

