//
//  Album.h
//  DemoFamily
//
//  Created by Kevin on 2019/1/8.
//  Copyright © 2019年 Kevin. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Photos :NSObject
@property (copy, nonatomic)   NSString *url;
@property (copy, nonatomic)   NSString *desc;
@property (copy, nonatomic)   NSString *transUrl;


@end
@interface Album :NSObject
@property (copy, nonatomic)   NSArray<Photos *> *photos;
@property (strong, nonatomic) NSDictionary *likedUsers;
@property (copy, nonatomic)   NSString *name;
@property (copy, nonatomic)   NSSet<NSNumber *> *likedUserIds;

@end

