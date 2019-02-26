//
//  HoverViewFlowLayout.h
//  DemoFamily
//
//  Created by Kevin on 2019/2/20.
//  Copyright © 2019年 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HoverViewFlowLayout : UICollectionViewFlowLayout
@property (nonatomic, assign) CGFloat topHeight;
- (instancetype)initWithTopHeight:(CGFloat)height;
@end

NS_ASSUME_NONNULL_END
