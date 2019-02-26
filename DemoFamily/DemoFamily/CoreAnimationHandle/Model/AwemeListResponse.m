//
//  AwemeListResponse.m
//  DemoFamily
//
//  Created by Kevin on 2019/2/20.
//  Copyright © 2019年 Kevin. All rights reserved.
//

#import "AwemeListResponse.h"

//@implementation Avatar_larger
//
//@end
//@implementation Avatar_medium
//
//@end
//@implementation Avatar_thumb
//
//@end
//@implementation Url_list
//
//@end
//@implementation Video_icon
//
//@end

@implementation Author

@end
@implementation Cover_hd

@end
@implementation Cover_large

@end
@implementation Play_url

@end
@implementation Cover_medium

@end
@implementation Cover_thumb

@end
@implementation Music

@end
@implementation Risk_infos

@end
@implementation Video_text

@end
@implementation Cha_list

@end
@implementation Statistics

@end
@implementation Label_url

@end
@implementation Video_labels

@end

@implementation Status

@end
@implementation Dynamic_cover

@end
@implementation Play_addr_lowbr

@end
@implementation Play_addr

@end
@implementation Cover

@end
@implementation Bit_rate

@end
@implementation Origin_cover

@end
@implementation Download_addr

@end
@implementation Video
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"bit_rate" : [Bit_rate class]};
}
@end
@implementation Share_info

@end
@implementation Label_top

@end
@implementation Text_extra

@end
@implementation Aweme
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"video_text" : [Video_text class],
             @"cha_list" : [Cha_list class],
             @"video_labels" : [Video_labels class],
             @"text_extra" : [Text_extra class]
             };
}
@end
@implementation AwemeListResponse
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"data" : [Aweme class]};
}

@end

