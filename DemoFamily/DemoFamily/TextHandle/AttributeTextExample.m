//
//  AttributeTextExample.m
//  DemoFamily
//
//  Created by Kevin on 2019/1/10.
//  Copyright © 2019年 Kevin. All rights reserved.
//

#import "AttributeTextExample.h"

@interface AttributeTextExample ()

@end

@implementation AttributeTextExample

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    NSMutableAttributedString *text = [NSMutableAttributedString new];
    {
        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@"First Shadow"];
        one.color = [UIColor whiteColor];
        one.font = [UIFont boldSystemFontOfSize:30];
        
        YYTextShadow *shadow = [YYTextShadow new];
        shadow.color = [UIColor colorWithWhite:0.000 alpha:0.490];
//        shadow.color = [UIColor redColor];
        shadow.offset = CGSizeMake(0, -1);
        shadow.radius = 5;
        one.textShadow = shadow;
        [text appendAttributedString:one];
        [text appendAttributedString:[self padding]];
    }
    {
        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@"Multiple Shadows"];
        one.font = [UIFont boldSystemFontOfSize:30];
        one.color = [UIColor colorWithRed:1.000 green:0.795 blue:0.014 alpha:1.000];
        
        YYTextShadow *shadow = [YYTextShadow new];
        shadow.color = [UIColor colorWithWhite:0.000 alpha:0.20];
        shadow.offset = CGSizeMake(0, -1);
        shadow.radius = 1.5;
        YYTextShadow *subShadow = [YYTextShadow new];
        subShadow.color = [UIColor colorWithWhite:1 alpha:0.99];
        subShadow.offset = CGSizeMake(0, 1);
        subShadow.radius = 1.5;
        shadow.subShadow = subShadow;
        one.textShadow = shadow;
        
        YYTextShadow *innerShadow = [YYTextShadow new];
        innerShadow.color = [UIColor colorWithRed:0.851 green:0.311 blue:0.000 alpha:0.780];
        innerShadow.offset = CGSizeMake(0, 1);
        innerShadow.radius = 1;
        one.textInnerShadow = innerShadow;
        
        [text appendAttributedString:one];
        [text appendAttributedString:[self padding]];
    }
    {
        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@"Background Image"];
        one.font = [UIFont boldSystemFontOfSize:30];
        one.color = [UIColor colorWithRed:1.000 green:0.795 blue:0.014 alpha:1.000];
        
        CGSize size = CGSizeMake(20, 20);
        UIImage *background = [UIImage imageWithSize:size drawBlock:^(CGContextRef context) {
            UIColor *c0 = [UIColor colorWithRed:0.054 green:0.879 blue:0.000 alpha:1.000];
            UIColor *c1 = [UIColor colorWithRed:0.869 green:1.000 blue:0.030 alpha:1.000];
            [c0 setFill];
            CGContextFillRect(context, CGRectMake(0, 0, size.width, size.height));
            [c1 setStroke];
            CGContextSetLineWidth(context, 2);
            for (int i = 0; i < size.width * 2; i+= 4) {
                CGContextMoveToPoint(context, i, -2);
                CGContextAddLineToPoint(context, i - size.height, size.height + 2);
            }
            CGContextStrokePath(context);
        }];
        one.color = [UIColor colorWithPatternImage:background];
        
        [text appendAttributedString:one];
        [text appendAttributedString:[self padding]];
    }
    {
        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@"Border"];
        one.font = [UIFont boldSystemFontOfSize:30];
        one.color = [UIColor colorWithRed:1.000 green:0.029 blue:0.651 alpha:1.000];
        
        YYTextBorder *border = [YYTextBorder new];
        border.strokeColor = [UIColor redColor];
        border.strokeWidth = 0.5;
        border.lineStyle = YYTextLineStylePatternDot;
        border.cornerRadius = 3;
        border.insets = UIEdgeInsetsMake(0, -4, 0, -4);
        one.textBackgroundBorder = border;
        
        [text appendAttributedString:[self padding]];
        [text appendAttributedString:one];
        [text appendAttributedString:[self padding]];
        [text appendAttributedString:[self padding]];
        [text appendAttributedString:[self padding]];
        [text appendAttributedString:[self padding]];
    }
    {
        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@"Link"];
        one.font = [UIFont boldSystemFontOfSize:30];
        one.color = [UIColor colorWithRed:0.093 green:0.492 blue:1.000 alpha:1.000];
        one.underlineColor = one.color;
        one.underlineStyle = NSUnderlineStyleSingle;
        
        YYTextBorder *border = [YYTextBorder new];
        border.cornerRadius = 3;
        border.insets = UIEdgeInsetsMake(0, -4, 0, -4);
        border.fillColor = [UIColor colorWithWhite:0.000 alpha:0.220];
        
        YYTextHighlight *highlight = [YYTextHighlight new];
        [highlight setBorder:border];
        @weakify(self);
        highlight.tapAction = ^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
            @strongify(self);
            [self showMessage:[NSString stringWithFormat:@"Tap Click one setTextHighlight:highlight range:one.rangeOfAll one setTextHighlight:highlight range:one.rangeOfAll one setTextHighlight:highlight range:one.rangeOfAll: %@",[text.string substringWithRange:range]]];
        };
        [one setTextHighlight:highlight range:one.rangeOfAll];
        
        [text appendAttributedString:one];
        [text appendAttributedString:[self padding]];
    }
    {
        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@"Yet Another Link"];
        one.font = [UIFont boldSystemFontOfSize:30];
        one.color = [UIColor whiteColor];
        
        YYTextShadow *shadow = [YYTextShadow new];
        shadow.color = [UIColor colorWithWhite:0.000 alpha:0.490];
        shadow.offset = CGSizeMake(0, 1);
        shadow.radius = 5;
        one.textShadow = shadow;
        
        YYTextShadow *shadow0 = [YYTextShadow new];
        shadow0.color = [UIColor colorWithWhite:0.000 alpha:0.20];
        shadow0.offset = CGSizeMake(0, -1);
        shadow0.radius = 1.5;
        YYTextShadow *shadow1 = [YYTextShadow new];
        shadow1.color = [UIColor colorWithWhite:1 alpha:0.99];
        shadow1.offset = CGSizeMake(0, 1);
        shadow1.radius = 1.5;
        shadow0.subShadow = shadow1;
        
        YYTextShadow *innerShadow0 = [YYTextShadow new];
        innerShadow0.color = [UIColor colorWithRed:0.851 green:0.311 blue:0.000 alpha:0.780];
        innerShadow0.offset = CGSizeMake(0, 1);
        innerShadow0.radius = 1;
        
        YYTextHighlight *highlight = [YYTextHighlight new];
        [highlight setColor:[UIColor colorWithRed:1.000 green:0.795 blue:0.014 alpha:1.000]];
        [highlight setShadow:shadow0];
        [highlight setInnerShadow:innerShadow0];
        [one setTextHighlight:highlight range:one.rangeOfAll];
        [text appendAttributedString:one];
    }
    YYLabel *label = [YYLabel new];
    label.attributedText = text;
    label.width = self.view.width;
    label.height = self.view.height - (kiOS7Later ? 64 : 44);
    label.top = (kiOS7Later ? 64 : 0);
    label.textAlignment = NSTextAlignmentCenter;
    label.textVerticalAlignment = YYTextVerticalAlignmentCenter;
    label.numberOfLines = 0;
    label.backgroundColor = [UIColor colorWithWhite:0.933 alpha:1.000];
    [self.view addSubview:label];
}

- (NSAttributedString *)padding {
    NSMutableAttributedString *pad = [[NSMutableAttributedString alloc] initWithString:@"\n\n"];
    pad.font = [UIFont systemFontOfSize:4];
    return pad;
}

- (void )showMessage:(NSString *)text {
    CGFloat padding = 15;
    YYLabel *label = [YYLabel new];
    label.font = [UIFont systemFontOfSize:16];
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor blackColor];
    label.text = text;
    label.textAlignment = NSTextAlignmentCenter;
    label.width = self.view.width;
    label.height = [text heightForFont:label.font width:label.width] + 2*padding;
    label.bottom = 64;
    label.numberOfLines = 0;
    [self.view addSubview:label];
    [UIView animateWithDuration:0.3 animations:^{
        label.top = 64;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 delay:2 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            label.bottom = 64;
        } completion:^(BOOL finished) {
            [label removeFromSuperview];
        }];
        
    }];
    
}


@end
