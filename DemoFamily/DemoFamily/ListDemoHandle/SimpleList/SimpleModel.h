//
//  SimpleModel.h
//  DemoFamily
//
//  Created by Kevin on 2019/1/13.
//  Copyright © 2019年 Kevin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SimpleModel : NSObject
@property (nonatomic, assign) int32_t baseColor;
@property (nonatomic, strong) NSString *text; ///< 文本，例如"仅自己可见"
@property (nonatomic, strong) NSString *iconURL; ///< 图标URL，需要加Default
@end
