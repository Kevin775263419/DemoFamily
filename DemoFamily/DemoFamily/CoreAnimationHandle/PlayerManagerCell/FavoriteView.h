//
//  FavoriteView.h
//  Douyin
//
//  Created by Kevin on 2018/7/30.
//  Copyright © 2018年 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FavoriteView : UIView

@property (nonatomic, strong) UIImageView      *favoriteBefore;
@property (nonatomic, strong) UIImageView      *favoriteAfter;

- (void)resetView;

@end
