//
//  NSTextAttachment+Emotion.m
//  Douyin
//
//  Created by Kevin on 2018/7/30.
//  Copyright © 2018年 Kevin. All rights reserved.
//
#import "NSTextAttachment+Emotion.h"
#import "objc/runtime.h"

@implementation NSTextAttachment (Emotion)

- (void)setEmotionKey:(NSString *)key {
    objc_setAssociatedObject(self, &emotionKey, key, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)emotionKey {
    return objc_getAssociatedObject(self, &emotionKey);
}

@end
