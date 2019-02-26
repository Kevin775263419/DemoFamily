//
//  AwemeCollectionCell.h
//  DemoFamily
//
//  Created by Kevin on 2019/2/20.
//  Copyright © 2019年 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class Aweme;
@interface AwemeCollectionCell : UICollectionViewCell
@property (nonatomic, strong) UIButton *favoriteNum;
@property (nonatomic, strong) CAShapeLayer *progressLayer;
@property (nonatomic, strong) YYAnimatedImageView *imageView;

- (void)initData:(Aweme *)aweme;
@end

NS_ASSUME_NONNULL_END
