//
//  AttributeAttachmentExample.m
//  DemoFamily
//
//  Created by Kevin on 2019/1/10.
//  Copyright © 2019年 Kevin. All rights reserved.
//

#import "AttributeAttachmentExample.h"

@interface AttributeAttachmentExample ()<UIGestureRecognizerDelegate>
@property (nonatomic, strong) YYLabel *label;

@end

@implementation AttributeAttachmentExample

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    NSMutableAttributedString *text = [NSMutableAttributedString new];
    UIFont *font = [UIFont systemFontOfSize:16];
    
    {
        NSString *title = @"This is UIImage attachment:";
        [text appendAttributedString:[[NSAttributedString alloc] initWithString:title attributes:nil]];
        
        UIImage *image = [UIImage imageNamed:@"mew_baseline"];
        image = [UIImage imageWithCGImage:image.CGImage scale:16 orientation:UIImageOrientationUp];
        
        NSMutableAttributedString *attachText = [NSMutableAttributedString attachmentStringWithContent:image contentMode:UIViewContentModeCenter attachmentSize:image.size alignToFont:font alignment:YYTextVerticalAlignmentCenter];
        [text appendAttributedString:attachText];
        [text appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n" attributes:nil]];
    }
    {
        NSAttributedString *pathString = [[NSAttributedString alloc] initWithString:@"NSMutableAttributedString *attachText = [NSMutableAttributedString attachmentStringWithContent:image contentMode:UIViewContentModeCenter attachmentSize:image.size alignToFont:font alignment:YYTextVerticalAlignmentCenter][text appendAttributedString:attachText]"];
        [text appendAttributedString:pathString];
    }
    text.font = font;
    
    _label = [YYLabel new];
    _label.userInteractionEnabled = YES;
    _label.numberOfLines = 0;
    _label.top = 74;
    _label.size = CGSizeMake(self.view.width - 40, 400);
    _label.left = 20;
    _label.contentMode = UIViewContentModeScaleAspectFit;
    
    _label.attributedText = text;
    [self.view addSubview:_label];

    
    _label.layer.borderWidth = CGFloatFromPixel(1);
    _label.layer.borderColor = [UIColor colorWithRed:0.000 green:0.463 blue:1.000 alpha:1.000].CGColor;
    __weak typeof(_label) wlabel = _label;
    UIView *dot = [self newDotView];
    dot.center = CGPointMake(_label.width, _label.height);
    dot.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin;
    [_label addSubview:dot];
    YYGestureRecognizer *gesture = [YYGestureRecognizer new];
    gesture.action = ^(YYGestureRecognizer *gesture, YYGestureRecognizerState state) {
        if (state != YYGestureRecognizerStateMoved) return;
        CGFloat width = gesture.currentPoint.x;
        CGFloat height = gesture.currentPoint.y;
        wlabel.width = width < 30 ? 30 : width;
        wlabel.height = height < 30 ? 30 : height;
    };
    gesture.delegate = self;
    [_label addGestureRecognizer:gesture];
}
- (UIView *)newDotView {
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor blueColor];
    view.size = CGSizeMake(50, 50);
    
    UIView *dot = [UIView new];
    dot.size = CGSizeMake(20, 20);
    dot.backgroundColor = [UIColor redColor];
    dot.clipsToBounds = YES;
    dot.layer.cornerRadius = dot.height / 2;
    dot.center = CGPointMake(view.width / 2, view.height / 2);
    [view addSubview:dot];
    
    return view;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    CGPoint p = [gestureRecognizer locationInView:_label];
    if (p.x < _label.width - 20) return NO;
    if (p.y < _label.height - 20) return NO;
    return YES;
}



@end
