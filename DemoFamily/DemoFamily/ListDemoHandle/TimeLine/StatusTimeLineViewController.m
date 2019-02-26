//
//  StatusTimeLineViewController.m
//  DemoFamily
//
//  Created by Kevin on 2019/1/11.
//  Copyright © 2019年 Kevin. All rights reserved.
//

#import "StatusTimeLineViewController.h"
#import "WBStatusHelper.h"
#import "WBModel.h"
#import "WBStatusLayout.h"
#import "WBStatusCell.h"

@interface StatusTimeLineViewController ()<UITableViewDelegate, UITableViewDataSource,WBStatusCellDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *layouts;

@end

@implementation StatusTimeLineViewController
- (instancetype)init {
    self = [super init];
    _tableView = [UITableView new];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _layouts = [NSMutableArray new];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([self respondsToSelector:@selector( setAutomaticallyAdjustsScrollViewInsets:)]) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    _tableView.frame = self.view.bounds;
//    _tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    _tableView.scrollIndicatorInsets = _tableView.contentInset;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.backgroundView.backgroundColor = [UIColor clearColor];
    _tableView.separatorColor = [UIColor clearColor];
    [self.view addSubview:_tableView];
    self.fpsScrollviewObserver = self.tableView;
    self.view.backgroundColor = kWBCellBackgroundColor;
    

    
    [self showLoadingView];
    @weakify(self);
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        @strongify(self);
        for (int i = 0; i <= 0; i++) {
            NSData *data = [NSData dataNamed:[NSString stringWithFormat:@"weibo_%d.json",i]];
            NSMutableString *string = [[NSMutableString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            if (!string) {
                string = [[NSMutableString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            }
            NSLog(@"数据源的参数为%@",string);

            WBTimelineItem *item = [WBTimelineItem modelWithJSON:data];
            for (WBStatus *status in item.statuses) {
                WBStatusLayout *layout = [[WBStatusLayout alloc] initWithStatus:status style:WBLayoutStyleTimeline];
                [layout layout];
                [self.layouts addObject:layout];
            }
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.title = [NSString stringWithFormat:@"Weibo (loaded:%d)", (int)self.layouts.count];;
            [self hiddenLoadingView];
            [self.tableView reloadData];
        });
    });
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _layouts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellID = @"cell";
    WBStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[WBStatusCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.delegate = self;
    }
    [cell setLayout:_layouts[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return ((WBStatusLayout *)_layouts[indexPath.row]).height;
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}



@end
