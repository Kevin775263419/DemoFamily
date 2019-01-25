//
//  AttributeAsyncShowExample.m
//  DemoFamily
//
//  Created by Kevin on 2019/1/11.
//  Copyright © 2019年 Kevin. All rights reserved.
//

#import "AttributeAsyncShowExample.h"
#import "TextAsyncCell.h"
#import "YYFPSLabel.h"

@interface AttributeAsyncShowExample ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, assign) BOOL async;
@property (nonatomic, strong) NSArray *strings;
@property (nonatomic, strong) NSArray *layouts;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) YYFPSLabel *fpsLabel;
@property (nonatomic, strong) UISwitch *onSwitch;

@end

@implementation AttributeAsyncShowExample

- (void)viewDidLoad {
    [super viewDidLoad];
    self.async = NO;
    self.tableView = [UITableView new];
    self.tableView.frame = self.view.bounds;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[TextAsyncCell class] forCellReuseIdentifier:@"id"];
    [self.view addSubview:self.tableView];
    self.tableView.tableFooterView = [UIView new];
    
    _fpsLabel = [YYFPSLabel new];
    [_fpsLabel sizeToFit];
    _fpsLabel.bottom = self.view.height - 12;
    _fpsLabel.left = 12;
    _fpsLabel.alpha = 0;
    [self.view addSubview:_fpsLabel];
    if (kSystemVersion < 7) {
        _fpsLabel.top -= 44;
        _tableView.top -= 64;
        _tableView.height += 20;
    }
    
    self.onSwitch = [UISwitch new];
    self.onSwitch.size = CGSizeMake(40, 20);
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:self.onSwitch];
    self.navigationItem.rightBarButtonItem = item;
    @weakify(self);
    [self.onSwitch addBlockForControlEvents:UIControlEventValueChanged block:^(UISwitch *switchs) {
        @strongify(self);
        if (!self) return;
        [self setAsync:switchs.isOn];
    }];
    
    
    NSMutableArray *strings = @[].mutableCopy;
    NSMutableArray *layouts = @[].mutableCopy;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (int i = 0; i < 300; i++) {
            NSString *str = [NSString stringWithFormat:@"Yet %d Async Display Test ✺◟(∗❛ัᴗ❛ั∗)◞✺ ✺◟(∗❛ัᴗ❛ั∗)◞✺ 😀😖😐😣😡🚖🚌🚋🎊💖💗💛💙🏨🏦🏫 Async Display Test ✺◟(∗❛ัᴗ❛ั∗)◞✺ ✺◟(∗❛ัᴗ❛ั∗)◞✺ 😀😖😐😣😡🚖🚌🚋🎊💖💗💛💙🏨🏦🏫",i];
            
            NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:str];
            text.font = [UIFont systemFontOfSize:14];
            text.lineSpacing = 5;
            text.strokeWidth = @(-3);
            text.strokeColor = [UIColor redColor];
            text.lineHeightMultiple = 1;
            text.maximumLineHeight = 12;
            text.minimumLineHeight = 12;
            
            NSShadow *shadow = [NSShadow new];
            shadow.shadowBlurRadius = 1;
            shadow.shadowColor = [UIColor redColor];
            shadow.shadowOffset = CGSizeMake(0, 1);
            [strings addObject:text];
            
            YYTextContainer *container = [YYTextContainer containerWithSize:CGSizeMake(kScreenWidth, kCellHeight)];
            YYTextLayout *layout = [YYTextLayout layoutWithContainer:container text:text];
            [layouts addObject:layout];
            
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            self.strings = strings;
            self.layouts = layouts;
            [self.tableView reloadData];
        });
    });
    

    
    
    
}

- (void)setAsync:(BOOL)async {
    _async = async;
    @weakify(self);
    [self.tableView.visibleCells enumerateObjectsUsingBlock:^(TextAsyncCell *cell, NSUInteger idx, BOOL *stop) {
        @strongify(self);
        cell.async = async;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        if (self.async) {
            [cell setAyncText:self.layouts[indexPath.row]];
        } else {
            [cell setAyncText:self.strings[indexPath.row]];
        }
    }];
}
#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _strings.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kCellHeight;
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TextAsyncCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id" forIndexPath:indexPath];
    
    //是否隐藏UILabel
    cell.async = _async;
    
    ///刷新界面
    if (_async) {
        [cell setAyncText:_layouts[indexPath.row]];
    } else {
        [cell setAyncText:_strings[indexPath.row]];
    }
    
    return cell;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    if (_fpsLabel.alpha == 0) {
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
            self.fpsLabel.alpha = 1;
        } completion:NULL];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (!decelerate) {
        if (_fpsLabel.alpha != 0) {
            [UIView animateWithDuration:1 delay:2 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
                self.fpsLabel.alpha = 0;
            } completion:NULL];
        }
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (_fpsLabel.alpha != 0) {
        [UIView animateWithDuration:1 delay:2 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
            self.fpsLabel.alpha = 0;
        } completion:NULL];
    }
}

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView {
    if (_fpsLabel.alpha == 0) {
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
            self.fpsLabel.alpha = 1;
        } completion:^(BOOL finished) {
        }];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
