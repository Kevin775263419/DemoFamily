//
//  AVPlayerManager.h
//  Douyin
//
//  Created by Kevin on 2018/7/30.
//  Copyright © 2018年 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface AVPlayerManager:NSObject
@property (nonatomic, strong) NSMutableArray<AVPlayer *>   *playerArray;  //用于存储AVPlayer的数组

+ (AVPlayerManager *)shareManager;
+ (void)setAudioMode;
- (void)play:(AVPlayer *)player;
- (void)pause:(AVPlayer *)player;
- (void)pauseAll;
- (void)replay:(AVPlayer *)player;
- (void)removeAllPlayers;

@end
