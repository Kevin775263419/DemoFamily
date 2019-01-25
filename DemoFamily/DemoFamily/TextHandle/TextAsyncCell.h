//
//  TextAsyncCell.h
//  DemoFamily
//
//  Created by Kevin on 2019/1/11.
//  Copyright © 2019年 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kCellHeight 120

NS_ASSUME_NONNULL_BEGIN

@interface TextAsyncCell : UITableViewCell
@property (nonatomic, assign) BOOL async;
- (void)setAyncText:(NSAttributedString *)text;

@end

NS_ASSUME_NONNULL_END
