//
//  AwemeListResponse.h
//  DemoFamily
//
//  Created by Kevin on 2019/2/20.
//  Copyright © 2019年 Kevin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserResponse.h"


NS_ASSUME_NONNULL_BEGIN

@class Avatar_larger;
@class Avatar_medium;
@class Avatar_thumb;
@class Url_list;
@class Video_icon;

@interface Author :NSObject
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
@property (copy, nonatomic)   NSString *activity;
@property (assign, nonatomic) NSInteger user_rate;
@property (copy, nonatomic)   NSString *video_icon_virtual_URI;

@end

@interface Cover_hd :NSObject
@property (copy, nonatomic)   NSString *uri;
@property (copy, nonatomic)   NSArray<NSString *> *url_list;

@end

@interface Cover_large :NSObject
@property (copy, nonatomic)   NSString *uri;
@property (copy, nonatomic)   NSArray<NSString *> *url_list;

@end

@interface Play_url :NSObject
@property (copy, nonatomic)   NSString *uri;
@property (copy, nonatomic)   NSArray<NSString *> *url_list;

@end

@interface Cover_medium :NSObject
@property (copy, nonatomic)   NSString *uri;
@property (copy, nonatomic)   NSArray<NSString *> *url_list;

@end

@interface Cover_thumb :NSObject
@property (copy, nonatomic)   NSString *uri;
@property (copy, nonatomic)   NSArray<NSString *> *url_list;

@end

@interface Music :NSObject
@property (strong, nonatomic) Cover_hd *cover_hd;
@property (strong, nonatomic) Cover_large *cover_large;
@property (assign, nonatomic) NSInteger status;
@property (copy, nonatomic)   NSString *extra;
@property (assign, nonatomic) NSInteger user_count;
@property (copy, nonatomic)   NSString *title;
@property (assign, nonatomic) NSInteger duration;
@property (strong, nonatomic) Play_url *play_url;
@property (copy, nonatomic)   NSString *mid;
@property (assign, nonatomic) BOOL is_restricted;
@property (copy, nonatomic)   NSString *offline_desc;
@property (copy, nonatomic)   NSString *schema_url;
@property (strong, nonatomic) Cover_medium *cover_medium;
@property (assign, nonatomic) BOOL is_original;
@property (copy, nonatomic)   NSString *id;
@property (copy, nonatomic)   NSString *uid;
@property (strong, nonatomic) Cover_thumb *cover_thumb;
@property (assign, nonatomic) NSInteger source_platform;
@property (copy, nonatomic)   NSString *author;
@property (copy, nonatomic)   NSString *id_str;

@end

@interface Risk_infos :NSObject
@property (assign, nonatomic) BOOL warn;
@property (copy, nonatomic)   NSString *content;
@property (assign, nonatomic) BOOL risk_sink;
@property (assign, nonatomic) NSInteger type;

@end

@interface Video_text :NSObject

@end

@interface Cha_list :NSObject
@property (copy, nonatomic)   NSString *schema;
@property (assign, nonatomic) NSInteger user_count;
@property (assign, nonatomic) NSInteger sub_type;
@property (copy, nonatomic)   NSString *desc;
@property (assign, nonatomic) BOOL is_pgcshow;
@property (copy, nonatomic)   NSString *cha_name;
@property (assign, nonatomic) NSInteger type;
@property (copy, nonatomic)   NSString *cid;

@end

@interface Statistics :NSObject
@property (assign, nonatomic) NSInteger digg_count;
@property (copy, nonatomic)   NSString *aweme_id;
@property (assign, nonatomic) NSInteger share_count;
@property (assign, nonatomic) NSInteger play_count;
@property (assign, nonatomic) NSInteger comment_count;

@end

@interface Label_url :NSObject
@property (copy, nonatomic)   NSArray<NSString *> *url_list;
@property (copy, nonatomic)   NSString *uri;

@end

@interface Video_labels :NSObject
@property (assign, nonatomic) NSInteger label_type;
@property (strong, nonatomic) Label_url *label_url;

@end



@interface Status :NSObject
@property (assign, nonatomic) BOOL allow_share;
@property (assign, nonatomic) NSInteger private_status;
@property (assign, nonatomic) BOOL is_delete;
@property (assign, nonatomic) BOOL with_goods;
@property (assign, nonatomic) BOOL is_private;
@property (assign, nonatomic) BOOL with_fusion_goods;
@property (assign, nonatomic) BOOL allow_comment;

@end

@interface Dynamic_cover :NSObject
@property (copy, nonatomic)   NSString *uri;
@property (copy, nonatomic)   NSArray<NSString *> *url_list;

@end

@interface Play_addr_lowbr :NSObject
@property (copy, nonatomic)   NSString *uri;
@property (copy, nonatomic)   NSArray<NSString *> *url_list;

@end

@interface Play_addr :NSObject
@property (copy, nonatomic)   NSString *uri;
@property (copy, nonatomic)   NSArray<NSString *> *url_list;

@end

@interface Cover :NSObject
@property (copy, nonatomic)   NSString *uri;
@property (copy, nonatomic)   NSArray<NSString *> *url_list;

@end

@interface Bit_rate :NSObject
@property (assign, nonatomic) NSInteger bit_rate;
@property (copy, nonatomic)   NSString *gear_name;
@property (assign, nonatomic) NSInteger quality_type;

@end

@interface Origin_cover :NSObject
@property (copy, nonatomic)   NSString *uri;
@property (copy, nonatomic)   NSArray<NSString *> *url_list;

@end

@interface Download_addr :NSObject
@property (copy, nonatomic)   NSString *uri;
@property (copy, nonatomic)   NSArray<NSString *> *url_list;

@end

@interface Video :NSObject
@property (copy, nonatomic)   NSString *id;
@property (strong, nonatomic) Dynamic_cover *dynamic_cover;
@property (strong, nonatomic) Play_addr_lowbr *play_addr_lowbr;
@property (assign, nonatomic) NSInteger width;
@property (copy, nonatomic)   NSString *ratio;
@property (strong, nonatomic) Play_addr *play_addr;
@property (strong, nonatomic) Cover *cover;
@property (assign, nonatomic) NSInteger height;
@property (copy, nonatomic)   NSArray<Bit_rate *> *bit_rate;
@property (strong, nonatomic) Origin_cover *origin_cover;
@property (assign, nonatomic) NSInteger duration;
@property (strong, nonatomic) Download_addr *download_addr;
@property (assign, nonatomic) BOOL has_watermark;

@end

@interface Share_info :NSObject
@property (copy, nonatomic)   NSString *share_weibo_desc;
@property (copy, nonatomic)   NSString *share_title;
@property (copy, nonatomic)   NSString *share_url;
@property (copy, nonatomic)   NSString *share_desc;

@end

@interface Label_top :NSObject
@property (copy, nonatomic)   NSString *uri;
@property (copy, nonatomic)   NSArray<NSString *> *url_list;

@end

@interface Text_extra :NSObject

@end

@interface Aweme :NSObject
@property (strong, nonatomic) Author *author;
@property (strong, nonatomic) Music *music;
@property (assign, nonatomic) BOOL cmt_swt;
@property (assign, nonatomic) NSInteger is_top;
@property (strong, nonatomic) Risk_infos *risk_infos;
@property (copy, nonatomic)   NSString *region;
@property (assign, nonatomic) NSInteger user_digged;
@property (copy, nonatomic)   NSArray<Video_text *> *video_text;
@property (copy, nonatomic)   NSArray<Cha_list *> *cha_list;
@property (assign, nonatomic) BOOL is_ads;
@property (assign, nonatomic) NSInteger bodydance_score;
@property (assign, nonatomic) BOOL law_critical_country;
@property (assign, nonatomic) NSInteger author_user_id;
@property (assign, nonatomic) NSInteger create_time;
@property (strong, nonatomic) Statistics *statistics;
@property (copy, nonatomic)   NSString *sort_label;
@property (copy, nonatomic)   NSString *descendants;
@property (copy, nonatomic)   NSArray<Video_labels *> *video_labels;
@property (assign, nonatomic) BOOL is_relieve;
@property (strong, nonatomic) Status *status;
@property (assign, nonatomic) NSInteger vr_type;
@property (assign, nonatomic) NSInteger aweme_type;
@property (copy, nonatomic)   NSString *aweme_id;
@property (strong, nonatomic) Video *video;
@property (assign, nonatomic) BOOL is_pgcshow;
@property (copy, nonatomic)   NSString *desc;
@property (assign, nonatomic) NSInteger is_hash_tag;
@property (strong, nonatomic) Share_info *share_info;
@property (copy, nonatomic)   NSString *share_url;
@property (assign, nonatomic) NSInteger scenario;
@property (strong, nonatomic) Label_top *label_top;
@property (assign, nonatomic) NSInteger rate;
@property (assign, nonatomic) BOOL can_play;
@property (assign, nonatomic) BOOL is_vr;
@property (copy, nonatomic)   NSArray<Text_extra *> *text_extra;

@end

@interface AwemeListResponse :NSObject
@property (assign, nonatomic) NSInteger code;
@property (copy, nonatomic)   NSString *message;
@property (copy, nonatomic)   NSArray<Aweme *> *data;
@property (assign, nonatomic) NSInteger total_count;
@property (assign, nonatomic) NSInteger has_more;

@end


NS_ASSUME_NONNULL_END
