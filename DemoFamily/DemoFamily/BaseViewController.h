//
//  BaseViewController.h
//  DemoFamily
//
//  Created by Kevin on 2019/1/10.
//  Copyright © 2019年 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYFPSLabel.h"


NS_ASSUME_NONNULL_BEGIN
static inline CGFloat GetPromoteParamters(CGFloat degress) {
    return degress *3.0;
}

@interface BaseViewController : UIViewController<UIScrollViewDelegate>
@property (nonatomic,strong) UIScrollView *fpsScrollviewObserver;
@property (nonatomic,strong) UIActivityIndicatorView *indicator;
@property (nonatomic, strong) YYFPSLabel *fpsLabel;
- (void)showLoadingView;
- (void)hiddenLoadingView;

- (void) initNavigationBarTransparent;

- (void) setBackgroundColor:(UIColor *)color;

- (void) setTranslucentCover;

- (void) initLeftBarButton:(NSString *)imageName;

- (void) setStatusBarHidden:(BOOL) hidden;

- (void) setStatusBarBackgroundColor:(UIColor *)color;

- (void) setNavigationBarTitle:(NSString *)title;

- (void) setNavigationBarTitleColor:(UIColor *)color;

- (void) setNavigationBarBackgroundColor:(UIColor *)color;

- (void) setNavigationBarBackgroundImage:(UIImage *)image;

- (void) setStatusBarStyle:(UIStatusBarStyle)style;

- (void) setNavigationBarShadowImage:(UIImage *)image;

- (void) back;

- (CGFloat) navagationBarHeight;

- (void) setLeftButton:(NSString *)imageName;

- (void) setBackgroundImage:(NSString *)imageName;
@end

NS_ASSUME_NONNULL_END
