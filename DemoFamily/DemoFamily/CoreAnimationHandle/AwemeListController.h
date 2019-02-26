//
//  AwemeListController.h
//  DemoFamily
//
//  Created by Kevin on 2019/2/21.
//  Copyright © 2019年 Kevin. All rights reserved.
//

#import "BaseViewController.h"

typedef NS_ENUM(NSUInteger, AwemeType) {
    AwemeWork        = 0,
    AwemeFavorite    = 1
};
NS_ASSUME_NONNULL_BEGIN
@class Aweme;
@interface AwemeListController : BaseViewController

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) NSInteger currentIndex;

-(instancetype)initWithVideoData:(NSMutableArray<Aweme *> *)data currentIndex:(NSInteger)currentIndex pageIndex:(NSInteger)pageIndex pageSize:(NSInteger)pageSize awemeType:(AwemeType)type uid:(NSString *)uid;
@end

NS_ASSUME_NONNULL_END
