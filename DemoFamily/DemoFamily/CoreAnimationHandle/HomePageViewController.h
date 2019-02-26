//
//  HomePageViewController.h
//  DemoFamily
//
//  Created by Kevin on 2019/2/18.
//  Copyright © 2019年 Kevin. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomePageViewController : BaseViewController<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate,UIViewControllerTransitioningDelegate>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, assign) NSInteger selectIndex;
@end

NS_ASSUME_NONNULL_END
