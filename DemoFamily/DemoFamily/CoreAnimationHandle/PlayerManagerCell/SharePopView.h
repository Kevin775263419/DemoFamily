//
//  SharePopView.h
//  Douyin
//
//  Created by Kevin on 2018/7/30.
//  Copyright © 2018年 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SharePopView:UIView

@property (nonatomic, strong) UIView           *container;
@property (nonatomic, strong) UIButton         *cancel;

- (void)show;
- (void)dismiss;

@end


@interface ShareItem:UIView

@property (nonatomic, strong) UIImageView      *icon;
@property (nonatomic, strong) UILabel          *label;

-(void)startAnimation:(NSTimeInterval)delayTime;

@end
