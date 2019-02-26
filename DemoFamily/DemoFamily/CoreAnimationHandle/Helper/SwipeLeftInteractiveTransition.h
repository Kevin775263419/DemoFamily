//
//  SwipeLeftInteractiveTransition.h
//  DemoFamily
//
//  Created by Kevin on 2019/2/21.
//  Copyright © 2019年 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AwemeListController;

NS_ASSUME_NONNULL_BEGIN

@interface SwipeLeftInteractiveTransition : UIPercentDrivenInteractiveTransition
@property (nonatomic, assign) BOOL interacting;
-(void)wireToViewController:(AwemeListController *)viewController;
@end

NS_ASSUME_NONNULL_END
