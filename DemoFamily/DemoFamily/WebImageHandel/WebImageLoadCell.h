//
//  WebImageLoadCell.h
//  DemoFamily
//
//  Created by Kevin on 2019/1/9.
//  Copyright © 2019年 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kCellHeight ceil((kScreenWidth) * 3.0 / 7.0)

NS_ASSUME_NONNULL_BEGIN

@interface WebImageLoadCell : UITableViewCell
//YYAnimatedImageView
@property (nonatomic, strong) YYAnimatedImageView *webImageView;
@property (nonatomic, strong) CAShapeLayer *progressLayer;
@property (nonatomic, strong) UILabel *label;
- (void)setImageURL:(NSURL *)url;

@end

NS_ASSUME_NONNULL_END
