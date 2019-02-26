//
//  HoverTextView.h
//  Douyin
//
//  Created by Kevin on 2018/7/30.
//  Copyright © 2018年 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SendTextDelegate

@required
-(void)onSendText:(NSString *)text;

@end



@protocol HoverTextViewDelegate

@required
-(void) hoverTextViewStateChange:(BOOL)isHover;

@end



@interface HoverTextView : UIView

@property (nonatomic, strong) UITextView                     *textView;
@property (nonatomic, weak) id<SendTextDelegate>             delegate;
@property (nonatomic, weak) id<HoverTextViewDelegate>        hoverDelegate;

@end

