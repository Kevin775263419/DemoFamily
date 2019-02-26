//
//  UserResponse.h
//  DemoFamily
//
//  Created by Kevin on 2019/2/20.
//  Copyright © 2019年 Kevin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@interface Avatar_larger :NSObject
@property (copy, nonatomic)   NSString *uri;
@property (copy, nonatomic)   NSArray<NSString *> *url_list;

@end

@interface Avatar_medium :NSObject
@property (copy, nonatomic)   NSString *uri;
@property (copy, nonatomic)   NSArray<NSString *> *url_list;

@end

@interface Avatar_thumb :NSObject
@property (copy, nonatomic)   NSString *uri;
@property (copy, nonatomic)   NSArray<NSString *> *url_list;

@end

@interface Url_list :NSObject

@end

@interface Video_icon :NSObject
@property (copy, nonatomic)   NSString *uri;
@property (copy, nonatomic)   NSArray<Url_list *> *url_list;

@end

@interface Geofencing :NSObject

@end

@interface Activity :NSObject
@property (assign, nonatomic) NSInteger digg_count;
@property (assign, nonatomic) NSInteger use_music_count;

@end

@interface User :NSObject
@property (copy, nonatomic)   NSString *weibo_name;
@property (copy, nonatomic)   NSString *google_account;
@property (assign, nonatomic) NSInteger special_lock;
@property (assign, nonatomic) BOOL is_binded_weibo;
@property (assign, nonatomic) NSInteger shield_follow_notice;
@property (assign, nonatomic) BOOL user_canceled;
@property (strong, nonatomic) Avatar_larger *avatar_larger;
@property (assign, nonatomic) BOOL accept_private_policy;
@property (assign, nonatomic) NSInteger follow_status;
@property (assign, nonatomic) BOOL with_commerce_entry;
@property (copy, nonatomic)   NSString *original_music_qrcode;
@property (assign, nonatomic) NSInteger authority_status;
@property (copy, nonatomic)   NSString *youtube_channel_title;
@property (assign, nonatomic) BOOL is_ad_fake;
@property (assign, nonatomic) BOOL prevent_download;
@property (assign, nonatomic) NSInteger verification_type;
@property (assign, nonatomic) BOOL is_gov_media_vip;
@property (copy, nonatomic)   NSString *weibo_url;
@property (copy, nonatomic)   NSString *twitter_id;
@property (assign, nonatomic) NSInteger need_recommend;
@property (assign, nonatomic) NSInteger comment_setting;
@property (assign, nonatomic) NSInteger status;
@property (copy, nonatomic)   NSString *unique_id;
@property (assign, nonatomic) BOOL hide_location;
@property (copy, nonatomic)   NSString *enterprise_verify_reason;
@property (assign, nonatomic) NSInteger aweme_count;
@property (assign, nonatomic) NSInteger story_count;
@property (assign, nonatomic) NSInteger unique_id_modify_time;
@property (assign, nonatomic) NSInteger follower_count;
@property (assign, nonatomic) NSInteger apple_account;
@property (copy, nonatomic)   NSString *short_id;
@property (copy, nonatomic)   NSString *account_region;
@property (copy, nonatomic)   NSString *signature;
@property (copy, nonatomic)   NSString *twitter_name;
@property (strong, nonatomic) Avatar_medium *avatar_medium;
@property (copy, nonatomic)   NSString *verify_info;
@property (assign, nonatomic) NSInteger create_time;
@property (assign, nonatomic) BOOL story_open;
@property (copy, nonatomic)   NSString *region;
@property (assign, nonatomic) BOOL hide_search;
@property (strong, nonatomic) Avatar_thumb *avatar_thumb;
@property (copy, nonatomic)   NSString *school_poi_id;
@property (assign, nonatomic) NSInteger shield_comment_notice;
@property (assign, nonatomic) NSInteger total_favorited;
@property (strong, nonatomic) Video_icon *video_icon;
@property (copy, nonatomic)   NSString *original_music_cover;
@property (assign, nonatomic) NSInteger following_count;
@property (assign, nonatomic) NSInteger shield_digg_notice;
@property (copy, nonatomic)   NSArray<Geofencing *> *geofencing;
@property (copy, nonatomic)   NSString *bind_phone;
@property (assign, nonatomic) BOOL has_email;
@property (assign, nonatomic) NSInteger live_verify;
@property (copy, nonatomic)   NSString *birthday;
@property (assign, nonatomic) NSInteger duet_setting;
@property (copy, nonatomic)   NSString *ins_id;
@property (assign, nonatomic) NSInteger follower_status;
@property (assign, nonatomic) NSInteger live_agreement;
@property (assign, nonatomic) NSInteger neiguang_shield;
@property (copy, nonatomic)   NSString *uid;
@property (assign, nonatomic) NSInteger secret;
@property (assign, nonatomic) BOOL is_phone_binded;
@property (assign, nonatomic) NSInteger live_agreement_time;
@property (copy, nonatomic)   NSString *weibo_schema;
@property (assign, nonatomic) BOOL is_verified;
@property (copy, nonatomic)   NSString *custom_verify;
@property (assign, nonatomic) NSInteger commerce_user_level;
@property (assign, nonatomic) NSInteger gender;
@property (assign, nonatomic) BOOL has_orders;
@property (copy, nonatomic)   NSString *youtube_channel_id;
@property (assign, nonatomic) NSInteger reflow_page_gid;
@property (assign, nonatomic) NSInteger reflow_page_uid;
@property (copy, nonatomic)   NSString *nickname;
@property (assign, nonatomic) NSInteger school_type;
@property (copy, nonatomic)   NSString *avatar_uri;
@property (copy, nonatomic)   NSString *weibo_verify;
@property (assign, nonatomic) NSInteger favoriting_count;
@property (copy, nonatomic)   NSString *share_qrcode_uri;
@property (assign, nonatomic) NSInteger room_id;
@property (assign, nonatomic) NSInteger constellation;
@property (copy, nonatomic)   NSString *school_name;
@property (strong, nonatomic) Activity *activity;
@property (assign, nonatomic) NSInteger user_rate;
@property (copy, nonatomic)   NSString *video_icon_virtual_URI;

@end

@interface UserResponse :NSObject
@property (copy, nonatomic)   NSString *message;
@property (strong, nonatomic) User *data;
@property (assign, nonatomic) NSInteger code;

@end


NS_ASSUME_NONNULL_END
