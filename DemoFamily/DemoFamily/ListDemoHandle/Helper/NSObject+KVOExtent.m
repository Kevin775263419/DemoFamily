//
//  NSObject+KVOExtent.m
//  DemoFamily
//
//  Created by Kevin on 2019/1/31.
//  Copyright © 2019年 Kevin. All rights reserved.
//

#import "NSObject+KVOExtent.h"
#import <objc/objc.h>
#import <objc/runtime.h>
static const int block_key;

@interface _YYNSObjectKVOBlockTargets : NSObject

@property (nonatomic, copy) void (^block)(__weak id obj, id oldVal, id newVal);

- (id)initWithBlock:(void (^)(__weak id obj, id oldVal, id newVal))block;

@end

@implementation _YYNSObjectKVOBlockTargets

- (id)initWithBlock:(void (^)(__weak id obj, id oldVal, id newVal))block {
    self = [super init];
    if (self) {
        self.block = block;
    }
    return self;
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (!self.block) return;
    BOOL isPrior = [[change objectForKey:NSKeyValueChangeNotificationIsPriorKey] boolValue];
    if (isPrior) return;
    NSKeyValueChange changeKind = [[change objectForKey:NSKeyValueChangeKindKey] integerValue];
    if (changeKind != NSKeyValueChangeSetting) return;
    id oldVal = [change objectForKey:NSKeyValueChangeOldKey];
    if (oldVal == [NSNull null]) oldVal = nil;
    id newVal = [change objectForKey:NSKeyValueChangeNewKey];
    if (newVal == [NSNull null]) newVal = nil;
    self.block(object, oldVal, newVal);
}

@end


@implementation NSObject (KVOExtent)

- (void)byObserverBlockForKeyPath:(NSString *)keyPath block:(void (^)(__weak id object,id oldVal, id newVal))block {
    if (!keyPath || !block) return;
    _YYNSObjectKVOBlockTargets *target = [[_YYNSObjectKVOBlockTargets alloc] initWithBlock:block];
    NSMutableDictionary *dic = [self _yy_allNSObjectObserverBlocks];
    NSMutableArray *arr = dic[keyPath];
    if (!arr) {
        arr = [NSMutableArray new];
        dic[keyPath] = arr;
    }
    [arr addObject:target];
    [self addObserver:target forKeyPath:keyPath options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:NULL];
    
}
//动态添加一个属性dict的属性
- (NSMutableDictionary *)_yy_allNSObjectObserverBlocks {
    NSMutableDictionary *targets = objc_getAssociatedObject(self, &block_key);
    if (!targets) {
        targets = [NSMutableDictionary new];
        objc_setAssociatedObject(self, &block_key, targets, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return targets;
}




@end
