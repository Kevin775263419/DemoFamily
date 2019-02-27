//
//  NetworkHelper.h
//  DemoFamily
//
//  Created by Kevin on 2019/2/22.
//  Copyright © 2019年 Kevin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"


NS_ASSUME_NONNULL_BEGIN

//network state notification
extern NSString *const NetworkStatesChangeNotification;

extern NSString *const NetworkDomain;

//请求地址
extern NSString *const BaseUrl;

//创建访客用户接口
extern NSString *const CreateVisitorPath;


//根据用户id获取用户信息
extern NSString *const FindUserByUidPath;


//获取用户发布的短视频列表数据
extern NSString *const FindAwemePostByPagePath;
//获取用户喜欢的短视频列表数据
extern NSString *const FindAwemeFavoriteByPagePath;


//发送文本类型群聊消息
extern NSString *const PostGroupChatTextPath;
//发送单张图片类型群聊消息
extern NSString *const PostGroupChatImagePath;
//发送多张图片类型群聊消息
extern NSString *const PostGroupChatImagesPath;
//根据id获取指定图片
extern NSString *const FindImageByIdPath;
//获取群聊列表数据
extern NSString *const FindGroupChatByPagePath;
//根据id删除指定群聊消息
extern NSString *const DeleteGroupChatByIdPath;


//根据视频id发送评论
extern NSString *const PostComentPath;
//根据id删除评论
extern NSString *const DeleteComentByIdPath;
////获取评论列表
extern NSString *const FindComentByPagePath;

typedef enum {
    HttpResquestFailed = -1000,
    UrlResourceFailed = -2000
} NetworkError;

typedef void (^UploadProgress)(CGFloat percent);
typedef void (^HttpSuccess)(id data);
typedef void (^HttpFailure)(NSError *error);

@interface NetworkHelper : NSObject

+(AFHTTPSessionManager *)sharedManager;

+(NSURLSessionDataTask *)getWithUrlPath:(NSString *)urlPath request:(id )request success:(HttpSuccess)success failure:(HttpFailure)failure;

+(NSURLSessionDataTask *)deleteWithUrlPath:(NSString *)urlPath request:(id)request success:(HttpSuccess)success failure:(HttpFailure)failure;

+(NSURLSessionDataTask *)postWithUrlPath:(NSString *)urlPath request:(id)request success:(HttpSuccess)success failure:(HttpFailure)failure;

+(NSURLSessionDataTask *)uploadWithUrlPath:(NSString *)urlPath data:(NSData *)data request:(id )request progress:(UploadProgress)progress success:(HttpSuccess)success failure:(HttpFailure)failure;

+(NSURLSessionDataTask *)uploadWithUrlPath:(NSString *)urlPath dataArray:(NSArray<NSData *> *)dataArray request:(id )request progress:(UploadProgress)progress success:(HttpSuccess)success failure:(HttpFailure)failure;

//Reachability
+ (AFNetworkReachabilityManager *)shareReachabilityManager;

+ (void)startListening;

+ (AFNetworkReachabilityStatus)networkStatus;

+ (BOOL)isWifiStatus;

+ (BOOL)isNotReachableStatus:(AFNetworkReachabilityStatus)status;

@end

NS_ASSUME_NONNULL_END