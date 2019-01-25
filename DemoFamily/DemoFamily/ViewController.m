//
//  ViewController.m
//  DemoFamily
//
//  Created by Kevin on 2019/1/7.
//  Copyright © 2019年 Kevin. All rights reserved.
//

#import "ViewController.h"
#import "YYKit.h"


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) NSMutableArray *titleArray;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    self.dataArray = @[@"Model",@"AnimatiedImage",@"WebImageLoad",@"ProgressiveImage",@"AttributeTextExample",@"AttributeTagTextExample",@"AttributeAttachmentExample",@"AttributeBindingExample",@"AttributeAsyncShowExample",@"SimpleListTableView",@"StatusTimeLineViewController",@"SimpleDemoTotal",@"SimpleCodeThreadOrCache"].mutableCopy;
    self.titleArray = @[@"ModelHandleMain",@"AnimatiedImage",@"WebImageViewLoad",@"ProgressiveImage",@"AttributeTextExample",@"AttributeTagTextExample",@"AttributeAttachmentExample",@"AttributeBindingExample",@"AttributeAsyncShowExample",@"SimpleListTableView",@"StatusTimeLineViewController",@"SimpleDemoTotal",@"SimpleCodeThread"].mutableCopy;
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"kcell1"];
    self.tableView.tableFooterView = [[UIView alloc] init];
    [self.view addSubview:self.tableView];
}

- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"kcell1"];
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}
- (void )tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *className = self.titleArray[indexPath.row];
    Class class = NSClassFromString(className);
    if (class) {
        UIViewController *vc = class.new;
        vc.title = self.dataArray[indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
    }
}



@end
