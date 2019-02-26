//
//  HomePageViewController.m
//  DemoFamily
//
//  Created by Kevin on 2019/2/18.
//  Copyright © 2019年 Kevin. All rights reserved.
//

#import "HomePageViewController.h"
#import "UserResponse.h"
#import "AwemeListResponse.h"
#import "UserInfoHeader.h"
#import "AwemeCollectionCell.h"
#import "HoverViewFlowLayout.h"
#import "YYPhotoGroupView.h"
#import "SwipeLeftInteractiveTransition.h"
#import "AwemeListController.h"
#import "ScalePresentAnimation.h"
#import "ScaleDismissAnimation.h"


#define kUserInfoHeaderHeight          350 + SafeAreaTopHeight
#define kSlideTabBarHeight             40
NSString * const kUserInfoCell         = @"UserInfoCell";
NSString * const kAwemeCollectionCell  = @"AwemeCollectionCell";
@interface HomePageViewController ()<UserInfoDelegate,OnTabTapActionDelegate>
@property (nonatomic, strong) User *user;
@property (nonatomic, strong) NSMutableArray<Aweme *> *favoriteAwemes;
@property (nonatomic, strong) UserInfoHeader *userInfoHeader;
@property (nonatomic, assign) CGFloat itemWidth;
@property (nonatomic, assign) CGFloat itemHeight;
@property (nonatomic, strong) UILabel *refreshLabel;
@property (nonatomic, strong) SwipeLeftInteractiveTransition   *swipeLeftInteractiveTransition;
@property (nonatomic, strong) ScalePresentAnimation            *scalePresentAnimation;
@property (nonatomic, strong) ScaleDismissAnimation            *scaleDismissAnimation;

@end
@implementation HomePageViewController
- (instancetype)init {
    self = [super init];
    if (self) {
        _scalePresentAnimation = [ScalePresentAnimation new];
        _scaleDismissAnimation = [ScaleDismissAnimation new];
        _swipeLeftInteractiveTransition = [SwipeLeftInteractiveTransition new];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"DouYin";

    self.favoriteAwemes = @[].mutableCopy;
    [self loadUserAdnAweDadaDump];
    [self initCollectionView];

}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    self.navigationController.navigationBar.hidden = YES;
//    [self setNavigationBarTitleColor:ColorClear];
//    [self setNavigationBarBackgroundColor:ColorClear];
//    [self setStatusBarBackgroundColor:ColorClear];
    [self setStatusBarHidden:YES];
}

- (void)initCollectionView {
    _itemWidth = (ScreenWidth - (CGFloat)(((NSInteger)(ScreenWidth)) % 3) ) / 3.0f - 1.0f;
    _itemHeight = _itemWidth * 1.35f;
    HoverViewFlowLayout *layout = [[HoverViewFlowLayout alloc] initWithTopHeight:SafeAreaTopHeight + kSlideTabBarHeight];
    layout.minimumLineSpacing = 1;
    layout.minimumInteritemSpacing = 0;
    _collectionView = [[UICollectionView  alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) collectionViewLayout:layout];
    _collectionView.backgroundColor = ColorClear;
    if (@available(iOS 11.0, *)) {
        _collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    _collectionView.alwaysBounceVertical = YES;
    _collectionView.showsVerticalScrollIndicator = NO;
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [_collectionView registerClass:[UserInfoHeader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kUserInfoCell];
    [_collectionView registerClass:[AwemeCollectionCell class] forCellWithReuseIdentifier:kAwemeCollectionCell];
    [self.view addSubview:_collectionView];
    self.fpsScrollviewObserver = self.collectionView;
    
    _refreshLabel = [UILabel new];
    _refreshLabel.top = 10;
    _refreshLabel.left = self.view.right - 100 -15;
    _refreshLabel.size = CGSizeMake(100, 20);
    _refreshLabel.text = @"Refresh Data";
    _refreshLabel.textColor = [UIColor lightGrayColor];
    [self.view addSubview:_refreshLabel];
}

#pragma mark - CollectionViewDelegate
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0 && kind == UICollectionElementKindSectionHeader) {
        UserInfoHeader *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kUserInfoCell forIndexPath:indexPath];
        _userInfoHeader = header;
        if(_user) {
            [header initData:_user];
            header.delegate = self;
            header.slideTabBar.delegate = self;
        }
        return header;
    }
    return [UICollectionReusableView new];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if(section == 1) {
        return _favoriteAwemes.count;
    }
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    AwemeCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kAwemeCollectionCell forIndexPath:indexPath];
    Aweme *aweme = [_favoriteAwemes objectAtIndex:indexPath.row];
    [cell initData:aweme];
    return cell;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    if(section == 0) {
        return CGSizeMake(ScreenWidth, kUserInfoHeaderHeight);
    }
    return CGSizeZero;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return CGSizeZero;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return  CGSizeMake(_itemWidth, _itemHeight);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    AwemeListController *controller;
    controller = [AwemeListController new];
//    if(_tabIndex == 0) {
//        controller = [[AwemeListController alloc] initWithVideoData:_workAwemes currentIndex:indexPath.row pageIndex:_pageIndex pageSize:_pageSize awemeType:AwemeWork uid:_uid];
//    }else {
    
//    }
    controller = [[AwemeListController alloc] initWithVideoData:_favoriteAwemes currentIndex:indexPath.row pageIndex:1 pageSize:5 awemeType:AwemeFavorite uid:@"97795069353"];
    controller.transitioningDelegate = self;
    controller.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    self.modalPresentationStyle = UIModalPresentationCurrentContext;
    [_swipeLeftInteractiveTransition wireToViewController:controller];
    [self presentViewController:controller animated:YES completion:nil];
}

#pragma mark - UIViewControllerTransitioningDelegate
- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return _scalePresentAnimation;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return _scaleDismissAnimation;
}

-(id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator {
    return _swipeLeftInteractiveTransition.interacting ? _swipeLeftInteractiveTransition : nil;
}
#pragma mark - UserDelegate
- (void)onUserActionTap:(NSInteger)tag {
    switch (tag) {
        case UserInfoHeaderAvatarTag: {
            NSString *url = _user.avatar_medium.url_list.firstObject;
            YYPhotoGroupItem *item = [YYPhotoGroupItem new];
            item.largeImageURL = [NSURL URLWithString:url];
            YYPhotoGroupView *v = [[YYPhotoGroupView alloc] initWithGroupItems:@[item]];
            [v presentFromImageView:self.userInfoHeader.avatar toContainer:self.navigationController.view animated:YES completion:nil];
        }
            break;
        case UserInfoHeaderSendTag:
//            [self.navigationController pushViewController:[[ChatListController alloc] init] animated:YES];
            break;
        case UserInfoHeaderFocusCancelTag:
        case UserInfoHeaderFocusTag:{
            if(_userInfoHeader) {
                [_userInfoHeader startFocusAnimation];
            }
            break;
        }
        case UserInfoHeaderSettingTag:{

            break;
        }
            break;
        case UserInfoHeaderGithubTag:
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/sshiqiao/douyin-ios-objectc"]];
            break;
        default:
            break;
    }

}
- (void)onTabTapAction:(NSInteger)index {
    NSLog(@"w我点击了%ld",(long)index);
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint point = [touch locationInView:self.refreshLabel];
    if (CGRectContainsPoint(self.refreshLabel.bounds, point)) {
        [[YYImageCache sharedCache].memoryCache removeAllObjects];
        [[YYImageCache sharedCache].diskCache removeAllObjectsWithBlock:nil];
        [self.collectionView performSelector:@selector(reloadData) afterDelay:0.1];
    }
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY < 0) {
        [_userInfoHeader overScrollAction:offsetY];
    }else {
        [_userInfoHeader scrollToTopAction:offsetY];
        [self updateNavigationTitle:offsetY];
    }
}
- (void)updateNavigationTitle:(CGFloat)offsetY {
    if (kUserInfoHeaderHeight - [self navagationBarHeight]*2 > offsetY) {
        [self setNavigationBarTitleColor:ColorClear];
    }
    if (kUserInfoHeaderHeight - [self navagationBarHeight]*2 < offsetY && offsetY < kUserInfoHeaderHeight - [self navagationBarHeight]) {
        CGFloat alphaRatio =  1.0f - (kUserInfoHeaderHeight - [self navagationBarHeight] - offsetY)/[self navagationBarHeight];
        [self setNavigationBarTitleColor:[UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:alphaRatio]];
    }
    if (offsetY > kUserInfoHeaderHeight - [self navagationBarHeight]) {
        [self setNavigationBarTitleColor:ColorWhite];
    }
}
- (void)loadUserAdnAweDadaDump {
    [self showLoadingView];
    @weakify(self);
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        @strongify(self);
        NSData *data = [NSData dataNamed:@"user.json"];
        UserResponse *response = [UserResponse modelWithJSON:data];
        self.user = response.data;
        NSData *favData = [NSData dataNamed:@"favorites.json"];
        AwemeListResponse *listResponse = [AwemeListResponse modelWithJSON:favData];
        int i = 0;
        do {
            i ++;
            [self.favoriteAwemes addObjectsFromArray:listResponse.data];
        } while (i<=10);
        dispatch_async(dispatch_get_main_queue(), ^{
            [self hiddenLoadingView];
            [self.collectionView reloadData];
        });
    });
}
@end
