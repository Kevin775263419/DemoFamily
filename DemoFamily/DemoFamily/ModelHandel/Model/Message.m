//
//  Message.m
//  DemoFamily
//
//  Created by Kevin on 2019/1/8.
//  Copyright © 2019年 Kevin. All rights reserved.
//

#import "Message.h"

@implementation Message
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"messageId":@"i",
             @"content":@"c",
             @"time":@"t"};
}
//- (void)modelCustomTransformFromDictionary:(NSDictionary *)dic {
//    uint64_t timestamp = [dic unsignedLongLongValueForKey:@"t" default:0];
//    self.time = [NSDate dateWithTimeIntervalSince1970:timestamp / 1000.0];
//}
//- (void)modelCustomTransformToDictionary:(NSMutableDictionary *)dic {
//    dic[@"t"] = @([self.time timeIntervalSince1970] * 1000).description;
//}


@end
