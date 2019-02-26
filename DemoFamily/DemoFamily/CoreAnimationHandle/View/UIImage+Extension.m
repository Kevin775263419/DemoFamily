//
//  UIImage+Extension.m
//  DemoFamily
//
//  Created by Kevin on 2019/2/20.
//  Copyright © 2019年 Kevin. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)

- (UIImage *)drawRoundedRectImage:(CGFloat)cornerRadius width:(CGFloat)width height:(CGFloat)height {
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(width, height), NO, 1.0f);
    CGContextAddPath(UIGraphicsGetCurrentContext(),
                     [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, width, height) cornerRadius:cornerRadius].CGPath);
    CGContextClip(UIGraphicsGetCurrentContext());
    [self drawInRect:CGRectMake(0, 0, width, height)];
    CGContextDrawPath(UIGraphicsGetCurrentContext(), kCGPathFillStroke);
    UIImage *output = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return output;
}

- (UIImage *)drawCircleImage {
    CGFloat side = MIN(self.size.width, self.size.height);
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(side, side), NO, 1.0f);
    CGContextSetShouldAntialias(UIGraphicsGetCurrentContext(), YES);
    CGContextAddPath(UIGraphicsGetCurrentContext(), [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, side, side)].CGPath);
    CGContextClip(UIGraphicsGetCurrentContext());
    CGFloat originX = -(self.size.width - side) / 2.f;
    CGFloat originY = -(self.size.height - side) / 2.f;
    [self drawInRect:CGRectMake(originX, originY, self.size.width, self.size.height)];
    CGContextDrawPath(UIGraphicsGetCurrentContext(), kCGPathFillStroke);
    UIImage *output = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return output;
}
@end
