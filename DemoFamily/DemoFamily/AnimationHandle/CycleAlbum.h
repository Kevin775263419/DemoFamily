//
//  CycleAlbum.h
//  DemoFamily
//
//  Created by Kevin on 2019/2/27.
//  Copyright © 2019年 Kevin. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN
@interface CycleAlbumView : UIView

@property (nonatomic, strong) UIImageView *album;

- (void)startAnimation:(CGFloat)rate;
- (void)resetView;

@end


@interface CycleAlbum : BaseViewController

@end

NS_ASSUME_NONNULL_END
