//
//  Message.h
//  DemoFamily
//
//  Created by Kevin on 2019/1/8.
//  Copyright © 2019年 Kevin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YYKit.h"


@interface Message :NSObject
@property (nonatomic, assign) uint64_t messageId;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSDate *time;
@end
/**
 {
 "i" : "2000000001",
 "c" : "Hello",
 "t" : "1437237598000"
 }
 */
