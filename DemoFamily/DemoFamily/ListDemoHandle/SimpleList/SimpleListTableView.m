//
//  SimpleListTableView.m
//  DemoFamily
//
//  Created by Kevin on 2019/1/13.
//  Copyright © 2019年 Kevin. All rights reserved.
//

#import "SimpleListTableView.h"
#import "SimpleModel.h"
#import "SimpleStatusCell.h"
#import "SimpleStatusLayout.h"


@interface SimpleListTableView () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *layouts;
@property (nonatomic, strong) UISwitch *onSwitch;
@property (nonatomic, assign) BOOL isCanChange;



@end
@implementation SimpleListTableView
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
    // Do any additional setup after loading the view.
    
    self.onSwitch = [UISwitch new];
    self.onSwitch.size = CGSizeMake(40, 20);
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:self.onSwitch];
    self.navigationItem.rightBarButtonItem = item;
    @weakify(self);
    [self.onSwitch addBlockForControlEvents:UIControlEventValueChanged block:^(UISwitch *switchs) {
        @strongify(self);
        if (!self) return;
        self.isCanChange = switchs.isOn;
        [self changeTextString];
    }];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    _tableView.frame = self.view.bounds;
    _tableView.scrollIndicatorInsets = _tableView.contentInset;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.backgroundView.backgroundColor = [UIColor clearColor];
    _tableView.separatorColor = [UIColor clearColor];
    [self.view addSubview:_tableView];
    [self.tableView registerClass:[SimpleStatusCell class] forCellReuseIdentifier:@"cell"];
    [self changeTextString];
    self.fpsScrollviewObserver = self.tableView;

    
    
}
- (void )changeTextString {
    [self.layouts removeAllObjects];
    NSString *text = @"人类学家之研究🏡🚴💻📱🌹😁🤣☺️😘😉😌😍😚😙😗😋😛😝😜🤓🧐🤨🤪😎🤩😏😒😕😟😔😞😫😩😢😭🤬😡😠😤🤯😳😱😨🤗😓😥😰🤥🤫🤭🤔";
    NSMutableDictionary *dict = @{}.mutableCopy;
    dict[@"baseColor"] = @123;
    dict[@"text"] = text;
    @weakify(self);
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        @strongify(self);
        for (int i = 0; i <= 3000; i++) {
            SimpleModel *textModel  = [SimpleModel modelWithJSON:dict];
            SimpleStatusLayout *layout = [[SimpleStatusLayout alloc] initWithStatus:textModel];
            layout.isRefresh = self.isCanChange;
            [self.layouts addObject:layout];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    });
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _layouts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellID = @"cell";
    SimpleStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[SimpleStatusCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    [cell setLayout:_layouts[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return ((SimpleStatusLayout *)_layouts[indexPath.row]).height;
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}


@end
