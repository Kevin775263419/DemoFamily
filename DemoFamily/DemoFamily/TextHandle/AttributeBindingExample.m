//
//  AttributeBindingExample.m
//  DemoFamily
//
//  Created by Kevin on 2019/1/11.
//  Copyright © 2019年 Kevin. All rights reserved.
//

#import "AttributeBindingExample.h"
@interface YYTextExampleEmailBindingParser :NSObject <YYTextParser>
@property (nonatomic, strong) NSRegularExpression *regex;
@end

@implementation YYTextExampleEmailBindingParser

- (instancetype)init {
    self = [super init];
    NSString *pattern = @"[-_a-zA-Z@\\.]+[ ,\\n]";
    self.regex = [[NSRegularExpression alloc] initWithPattern:pattern options:kNilOptions error:nil];
    return self;
}
- (BOOL)parseText:(NSMutableAttributedString *)text selectedRange:(NSRangePointer)range {
    __block BOOL changed = NO;
    [_regex enumerateMatchesInString:text.string options:NSMatchingWithoutAnchoringBounds range:text.rangeOfAll usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {
        if (!result) return;
        NSRange range = result.range;
        if (range.location == NSNotFound || range.length < 1) return;
        if ([text attribute:YYTextBindingAttributeName atIndex:range.location effectiveRange:NULL]) return;
        
        NSRange bindlingRange = NSMakeRange(range.location, range.length - 1);
        YYTextBinding *binding = [YYTextBinding bindingWithDeleteConfirm:YES];
        [text setTextBinding:binding range:bindlingRange]; /// Text binding
        [text setColor:[UIColor colorWithRed:0.000 green:0.519 blue:1.000 alpha:1.000] range:bindlingRange];
        changed = YES;
    }];
    return changed;
}

@end


@interface AttributeBindingExample ()<YYTextViewDelegate>
@property (nonatomic, strong) YYTextView *textView;
@property (nonatomic, assign) BOOL isInEdit;

@end

@implementation AttributeBindingExample

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor  whiteColor];
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"sjobs@apple.com, apple@apple.com, banana@banana.com, pear@pear.com "];
    text.font = [UIFont systemFontOfSize:17];
    text.lineSpacing = 5;
    text.color = [UIColor blackColor];
    YYTextView *textView = [YYTextView new];
    textView.attributedText = text;
    textView.textParser = [YYTextExampleEmailBindingParser new];
    textView.size = self.view.size;
    textView.height = self.view.height - 500;
    textView.textContainerInset = UIEdgeInsetsMake(10, 10, 10, 10);
    textView.delegate = self;
    if (kiOS7Later) {
        textView.keyboardDismissMode = UIScrollViewKeyboardDismissModeInteractive;
    }
    textView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    textView.scrollIndicatorInsets = textView.contentInset;
    [self.view addSubview:textView];
    self.textView = textView;
//    [self.textView becomeFirstResponder];
    
    NSMutableAttributedString *text1 = [NSMutableAttributedString new];
    NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@"这是汉语写一段文字啊兄弟"];
    one.font = [UIFont boldSystemFontOfSize:30];
    one.color = [UIColor blueColor];
    
    YYTextRubyAnnotation *ruby;
    ruby = [YYTextRubyAnnotation new];
    ruby.textBefore = @"hàn yŭ";
    [one setTextRubyAnnotation:ruby range:[one.string rangeOfString:@"汉语"]];
    [text1 appendAttributedString:one];
    
    YYLabel *label = [YYLabel new];
    label.attributedText = text1;
    label.width = self.view.width - 60;
    label.centerX = self.view.width / 2;
    label.height = 100;
    label.top = self.textView.bottom + 20;
    label.textAlignment = NSTextAlignmentCenter;
    label.textVerticalAlignment = YYTextVerticalAlignmentCenter;
    label.numberOfLines = 0;
    label.backgroundColor = [UIColor colorWithWhite:0.933 alpha:1.000];
    [self.view addSubview:label];
    
    UILabel *bottom = [UILabel new];
    bottom.backgroundColor = [UIColor colorWithWhite:0.933 alpha:1.000];
    bottom.font = [UIFont systemFontOfSize:20];
    bottom.width = self.view.width - 60;
    bottom.centerX = self.view.width / 2;
    bottom.top = label.bottom + 20;
    bottom.text = @"text check finall in to message system label check";
    bottom.height = [bottom.text heightForFont:bottom.font width:bottom.width];
    bottom.numberOfLines = 0;
    bottom.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:bottom];
    
    
}

- (void)textViewDidChange:(YYTextView *)textView {
    if (textView.text.length == 0) {
        textView.textColor = [UIColor blackColor];
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
