//
//  SlideTabBar.h
//  Douyin
//
//  Created by Kevin on 2018/10/22.
//  Copyright © 2018 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol OnTabTapActionDelegate

@required
- (void)onTabTapAction:(NSInteger)index;

@end

@interface SlideTabBar : UIView

@property (nonatomic, weak) id <OnTabTapActionDelegate> delegate;

- (void)setLabels:(NSArray<NSString *> *)titles tabIndex:(NSInteger)tabIndex;

@end
