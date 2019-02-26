//
//  UIImage+Extension.h
//  DemoFamily
//
//  Created by Kevin on 2019/2/20.
//  Copyright © 2019年 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Extension)
- (UIImage *)drawRoundedRectImage:(CGFloat)cornerRadius width:(CGFloat)width height:(CGFloat)height;
- (UIImage *)drawCircleImage;
@end

NS_ASSUME_NONNULL_END
