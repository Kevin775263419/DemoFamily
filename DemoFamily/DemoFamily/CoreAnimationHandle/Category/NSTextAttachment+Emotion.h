//
//  NSTextAttachment+Emotion.h
//  Douyin
//
//  Created by Kevin on 2018/7/30.
//  Copyright © 2018年 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>

static char emotionKey;

@interface NSTextAttachment (Emotion)

- (void)setEmotionKey:(NSString *)key;

- (NSString *)emotionKey;

@end
