//
//  SimpleStatusCell.h
//  DemoFamily
//
//  Created by Kevin on 2019/1/13.
//  Copyright © 2019年 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SimpleStatusLayout.h"
NS_ASSUME_NONNULL_BEGIN

@interface SimpleStatusCell : UITableViewCell
@property (nonatomic, strong) YYLabel *titleLabel;
@property (nonatomic, strong) UILabel *uiLabel;

@property (nonatomic, strong) UIButton *arrowButton;

- (void)setLayout:(SimpleStatusLayout *)layout;



@end

NS_ASSUME_NONNULL_END
