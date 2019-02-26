//
//  NSString+Extension.h
//  Douyin
//
//  Created by Kevin on 2018/7/30.
//  Copyright © 2018年 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (Extension)

- (CGSize)singleLineSizeWithAttributeText:(UIFont *)font;

- (CGSize)multiLineSizeWithAttributeText:(CGFloat)width font:(UIFont *)font;

- (CGSize)singleLineSizeWithText:(UIFont *)font;

- (NSString *)md5;

- (NSURL *)urlScheme:(NSString *)scheme;

+ (NSString *)formatCount:(NSInteger)count;

+(NSDictionary *)readJson2DicWithFileName:(NSString *)fileName;

+ (NSString *)currentTime;

@end
