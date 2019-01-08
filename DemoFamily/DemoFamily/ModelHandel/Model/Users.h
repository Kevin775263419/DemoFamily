//
//  Users.h
//  DemoFamily
//
//  Created by Kevin on 2019/1/7.
//  Copyright © 2019年 Kevin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Owner :NSObject
@property (assign, nonatomic) NSInteger uid;
@property (copy, nonatomic)   NSString *name;

@end

@interface Users :NSObject
@property (assign, nonatomic) NSInteger rid;
@property (copy, nonatomic)   NSString *createTime;
@property (strong, nonatomic) Owner *owner;
@property (copy, nonatomic)   NSString *name;

@end
