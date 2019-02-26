//
//  ScaleDismissAnimation.m
//  Douyin
//
//  Created by Kevin on 2018/7/30.
//  Copyright © 2018年 Kevin. All rights reserved.
//

#import "ScaleDismissAnimation.h"
#import "HomePageViewController.h"
#import "AwemeListController.h"
#import "AwemeCollectionCell.h"

@implementation ScaleDismissAnimation

- (instancetype)init {
    self = [super init];
    if (self) {
        _centerFrame = CGRectMake((ScreenWidth - 5)/2, (ScreenHeight - 5)/2, 5, 5);
    }
    return self;
}

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.25f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    AwemeListController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UINavigationController *toVC = (UINavigationController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    __block HomePageViewController *userHomePageController;
    [toVC.viewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isMemberOfClass:[HomePageViewController class]]) {
            userHomePageController = (HomePageViewController *)obj;
        }
    }];
    UIView *selectCell = (AwemeCollectionCell *)[userHomePageController.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:1]];
    UIView *snapshotView;
    CGFloat scaleRatio;
    CGRect finalFrame;
    if(selectCell) {
        snapshotView = [selectCell snapshotViewAfterScreenUpdates:NO];
        scaleRatio = fromVC.view.frame.size.width/selectCell.frame.size.width;
        snapshotView.layer.zPosition = 20;
        finalFrame = [userHomePageController.collectionView convertRect:selectCell.frame toView:[userHomePageController.collectionView superview]];
    }else {
        snapshotView = [fromVC.view snapshotViewAfterScreenUpdates:NO];
        scaleRatio = fromVC.view.frame.size.width/ScreenWidth;
        finalFrame = _centerFrame;
    }
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:snapshotView];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    fromVC.view.alpha = 0.0f;
    snapshotView.center = fromVC.view.center;
    snapshotView.transform = CGAffineTransformMakeScale(scaleRatio, scaleRatio);
    [UIView animateWithDuration:duration
                          delay:0
         usingSpringWithDamping:0.8
          initialSpringVelocity:0.2
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         snapshotView.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
                         snapshotView.frame = finalFrame;
                     } completion:^(BOOL finished) {
                         [transitionContext finishInteractiveTransition];
                         [transitionContext completeTransition:YES];
                         [snapshotView removeFromSuperview];
                     }];
}

@end
