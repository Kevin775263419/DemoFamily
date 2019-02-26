//
//  WebImageViewLoad.m
//  DemoFamily
//
//  Created by Kevin on 2019/1/9.
//  Copyright © 2019年 Kevin. All rights reserved.
//

#import "WebImageViewLoad.h"
#import "WebImageLoadCell.h"

@interface WebImageViewLoad ()<UITabBarDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation WebImageViewLoad{
    NSArray *_imageLinks;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.tableView registerClass:[WebImageLoadCell class] forCellReuseIdentifier:@"WebImageLoadCell"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    self.fpsScrollviewObserver = self.tableView;
    
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:@"Reload" style:UIBarButtonItemStylePlain target:self action:@selector(reload)];
    self.navigationItem.rightBarButtonItem = button;
    self.view.backgroundColor = [UIColor colorWithWhite:0.217 alpha:1.000];
//    NSArray *links = @[@"http://i.imgur.com/WXJaqof.gif"];
    
//    NSArray *links = @[
//                       /*
//                        You can add your image url here.
//                        */
//
//                       // progressive jpeg
//                       @"https://s-media-cache-ak0.pinimg.com/1200x/2e/0c/c5/2e0cc5d86e7b7cd42af225c29f21c37f.jpg",
//
//                       //unsplash.com地址的图片 比较大 图片尺寸比较大
//                       @"https://images.unsplash.com/photo-1546872823-4b0686c1908c?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb&dl=oliver-ash-1279414-unsplash.jpg",
//
//                       // animated gif: http://cinemagraphs.com/
//                       @"http://i.imgur.com/uoBwCLj.gif",
//                       @"http://i.imgur.com/8KHKhxI.gif",
//                       @"http://i.imgur.com/WXJaqof.gif",
//
//                       // animated gif: https://dribbble.com/markpear
//                       @"https://d13yacurqjgara.cloudfront.net/users/345826/screenshots/1780193/dots18.gif",
//                       @"https://d13yacurqjgara.cloudfront.net/users/345826/screenshots/1809343/dots17.1.gif",
//                       @"https://d13yacurqjgara.cloudfront.net/users/345826/screenshots/1845612/dots22.gif",
//                       @"https://d13yacurqjgara.cloudfront.net/users/345826/screenshots/1820014/big-hero-6.gif",
//                       @"https://d13yacurqjgara.cloudfront.net/users/345826/screenshots/1819006/dots11.0.gif",
//                       @"https://d13yacurqjgara.cloudfront.net/users/345826/screenshots/1799885/dots21.gif",
//
//                       // animaged gif: https://dribbble.com/jonadinges
//                       @"https://d13yacurqjgara.cloudfront.net/users/288987/screenshots/2025999/batman-beyond-the-rain.gif",
//                       @"https://d13yacurqjgara.cloudfront.net/users/288987/screenshots/1855350/r_nin.gif",
//                       @"https://d13yacurqjgara.cloudfront.net/users/288987/screenshots/1963497/way-back-home.gif",
//                       @"https://d13yacurqjgara.cloudfront.net/users/288987/screenshots/1913272/depressed-slurp-cycle.gif",
//
//                       // jpg: https://dribbble.com/snootyfox
//                       @"https://d13yacurqjgara.cloudfront.net/users/26059/screenshots/2047158/beerhenge.jpg",
//                       @"https://d13yacurqjgara.cloudfront.net/users/26059/screenshots/2016158/avalanche.jpg",
//                       @"https://d13yacurqjgara.cloudfront.net/users/26059/screenshots/1839353/pilsner.jpg",
//                       @"https://d13yacurqjgara.cloudfront.net/users/26059/screenshots/1833469/porter.jpg",
//                       @"https://d13yacurqjgara.cloudfront.net/users/26059/screenshots/1521183/farmers.jpg",
//                       @"https://d13yacurqjgara.cloudfront.net/users/26059/screenshots/1391053/tents.jpg",
//                       @"https://d13yacurqjgara.cloudfront.net/users/26059/screenshots/1399501/imperial_beer.jpg",
//                       @"https://d13yacurqjgara.cloudfront.net/users/26059/screenshots/1488711/fishin.jpg",
//                       @"https://d13yacurqjgara.cloudfront.net/users/26059/screenshots/1466318/getaway.jpg",
//
//                       // animated webp and apng: http://littlesvr.ca/apng/gif_apng_webp.html
//                       @"http://littlesvr.ca/apng/images/BladeRunner.png",
//                       @"http://littlesvr.ca/apng/images/Contact.webp",
//                       ];
    
    NSMutableArray *links = @[
                       @"http://i.imgur.com/uoBwCLj.gif",
                       @"http://i.imgur.com/8KHKhxI.gif",
                       @"http://i.imgur.com/WXJaqof.gif",

                       @"http://littlesvr.ca/apng/images/BladeRunner.png",
                       @"http://littlesvr.ca/apng/images/Contact.webp",
                                              @"https://images.unsplash.com/photo-1546872823-4b0686c1908c?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb&dl=oliver-ash-1279414-unsplash.jpg"
                       ].mutableCopy;
    for (int i=0; i < 10; i++) {
        [links addObjectsFromArray:links];
    }
    
    _imageLinks = links;
    [self.tableView reloadData];
    [self scrollViewDidScroll:self.tableView];
}

- (void)reload {
    [[YYImageCache sharedCache].memoryCache removeAllObjects];
    [[YYImageCache sharedCache].diskCache removeAllObjectsWithBlock:nil];
    [self.tableView performSelector:@selector(reloadData) afterDelay:0.1];
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _imageLinks.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kCellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WebImageLoadCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) cell = [[WebImageLoadCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    NSString *urlString = _imageLinks[indexPath.row];
    NSURL *url = [NSURL URLWithString:urlString];
    [cell setImageURL:url];
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat viewHeight = scrollView.height + scrollView.contentInset.top;
    for (WebImageLoadCell *cell in [self.tableView visibleCells]) {
        CGFloat y = cell.centerY - scrollView.contentOffset.y;
        CGFloat p = y - viewHeight / 2;
        CGFloat scale = cos(p / viewHeight * 0.8) * 0.95;
        if (kiOS8Later) {
            [UIView animateWithDuration:0.15 delay:0 options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionBeginFromCurrentState animations:^{
                cell.webImageView.transform = CGAffineTransformMakeScale(scale, scale);
            } completion:NULL];
        } else {
            cell.webImageView.transform = CGAffineTransformMakeScale(scale, scale);
        }
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
