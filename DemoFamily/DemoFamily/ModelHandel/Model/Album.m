//
//  Album.m
//  DemoFamily
//
//  Created by Kevin on 2019/1/8.
//  Copyright © 2019年 Kevin. All rights reserved.
//

#import "Album.h"
#import "Users.h"

@implementation Photos
- (void)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    self.transUrl = @"1234";
    
}


@end

@implementation Album
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"photos" : Photos.class,
             @"likedUsers" : Owner.class,
             @"likedUserIds" : NSNumber.class
             };
}
@end
