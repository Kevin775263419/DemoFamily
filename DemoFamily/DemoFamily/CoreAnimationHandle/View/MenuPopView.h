//
//  MenuPopView.h
//  Douyin
//
//  Created by Kevin on 2018/7/30.
//  Copyright © 2018年 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^OnAction)(NSInteger index);

@interface MenuPopView:UIView
@property (nonatomic, strong) UIView        *container;
@property (nonatomic, strong) UIButton      *cancel;
@property (nonatomic, strong) OnAction      onAction;

- (instancetype)initWithTitles:(NSArray *)titles;
- (void)show;
- (void)dismiss;

@end
