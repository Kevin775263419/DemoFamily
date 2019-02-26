//
//  CADisplayLink+Tool.h
//  Douyin
//
//  Created by Kevin on 2018/9/27.
//  Copyright © 2018年 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ExecuteMethodBlock) (CADisplayLink *displayLink);

@interface CADisplayLink (Tool)

@property (nonatomic,copy)ExecuteMethodBlock executeBlock;

+ (CADisplayLink *)displayLinkWithExecuteBlock:(ExecuteMethodBlock)block;

@end
