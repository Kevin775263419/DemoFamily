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

@interface BaseViewController : UIViewController<UIScrollViewDelegate>
@property (nonatomic,strong) UIScrollView *fpsScrollviewObserver;
@property (nonatomic, strong) YYFPSLabel *fpsLabel;
@end

NS_ASSUME_NONNULL_END
