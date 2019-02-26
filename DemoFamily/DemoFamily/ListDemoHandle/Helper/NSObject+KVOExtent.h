//
//  NSObject+KVOExtent.h
//  DemoFamily
//
//  Created by Kevin on 2019/1/31.
//  Copyright © 2019年 Kevin. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN



@interface NSObject (KVOExtent)
- (void)byObserverBlockForKeyPath:(NSString *)keyPath block:(void (^)(__weak id object,id oldVal, id newVal))block;
@end

NS_ASSUME_NONNULL_END
