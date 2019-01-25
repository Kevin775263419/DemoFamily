//
//  AttributeTagTextExample.m
//  DemoFamily
//
//  Created by Kevin on 2019/1/10.
//  Copyright © 2019年 Kevin. All rights reserved.
//

#import "AttributeTagTextExample.h"

@interface AttributeTagTextExample ()<YYTextViewDelegate>
@property (nonatomic, assign) YYTextView *textView;

@end

@implementation AttributeTagTextExample

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    NSMutableAttributedString *text = [NSMutableAttributedString new];
    NSArray *tags = @[@"红色标签", @"橙色标签", @"黄色标签", @"黄色标签", @"蓝色标签", @"紫色标签", @"灰色标签"];
    NSArray *tagStrokeColors = @[
                                 UIColorHex(fa3f39),
                                 UIColorHex(f48f25),
                                 UIColorHex(f1c02c),
                                 UIColorHex(54bc2e),
                                 UIColorHex(29a9ee),
                                 UIColorHex(c171d8),
                                 UIColorHex(818e91)
                                 ];
    NSArray *tagFillColors = @[
                               UIColorHex(fb6560),
                               UIColorHex(f6a550),
                               UIColorHex(f3cc56),
                               UIColorHex(76c957),
                               UIColorHex(53baf1),
                               UIColorHex(cd8ddf),
                               UIColorHex(a4a4a7)
                               ];
    UIFont *font = [UIFont boldSystemFontOfSize:16];
    for (int i = 0; i < tags.count; i++) {
        NSString *tag = tags[i];
        UIColor *tagStrokeColor = tagStrokeColors[i];
        UIColor *tagFillColor = tagFillColors[i];
        NSMutableAttributedString *tagText = [[NSMutableAttributedString alloc] initWithString:tag];
        [tagText insertString:@"   " atIndex:0];
        [tagText appendString:@"   "];
        tagText.font = font;
        tagText.color = [UIColor whiteColor];
        [tagText setTextBinding:[YYTextBinding bindingWithDeleteConfirm:NO] range:tagText.rangeOfAll];
        
        YYTextBorder *border = [YYTextBorder new];
        border.strokeWidth = 1.5;
        border.strokeColor = tagStrokeColor;
        border.fillColor = tagFillColor;
        border.cornerRadius = 100; // a huge value
        border.insets = UIEdgeInsetsMake(-2, -5.5, -2, -8);
        [tagText setTextBackgroundBorder:border range:[tagText.string rangeOfString:tag]];
        
        [text appendAttributedString:tagText];
    }
    text.lineSpacing = 10;
    text.lineBreakMode = NSLineBreakByWordWrapping;
    
    [text appendString:@"\n"];
    [text appendAttributedString:text]; // repeat for test
    text.color = [UIColor blackColor];
    
    YYTextView *textView = [YYTextView new];
    textView.backgroundColor = [UIColor lightTextColor];
    textView.attributedText = text;
    textView.size = CGSizeMake(self.view.width, 350);
    textView.top = 0;
    
    textView.textContainerInset = UIEdgeInsetsMake(10 + 64, 10, 10, 10);
    textView.allowsCopyAttributedString = YES;
    textView.allowsPasteAttributedString = YES;
    textView.delegate = self;
    if (kiOS7Later) {
        textView.keyboardDismissMode = UIScrollViewKeyboardDismissModeInteractive;
    } else {
        textView.height -= 64;
    }
    textView.scrollIndicatorInsets = textView.contentInset;
    textView.selectedRange = NSMakeRange(text.length, 0);
    [self.view addSubview:textView];
    self.textView = textView;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [textView becomeFirstResponder];
    });
    
    YYTextView *placeHoler = [YYTextView new];
    placeHoler.placeholderText = @"This is TextView's PlaceHolder";
    placeHoler.placeholderFont = [UIFont systemFontOfSize:18];
    placeHoler.size = CGSizeMake(self.view.width, 60);
    placeHoler.top = textView.bottom + 10;
    placeHoler.backgroundColor = [UIColor lightGrayColor];
    placeHoler.font = [UIFont systemFontOfSize:15];
    placeHoler.textColor = [UIColor redColor];
    placeHoler.textContainerInset = UIEdgeInsetsMake(10, 10, 10, 10);
    [self.view addSubview:placeHoler];
    
}

- (void)edit:(UIBarButtonItem *)item {
    if (_textView.isFirstResponder) {
        [_textView resignFirstResponder];
    } else {
        [_textView becomeFirstResponder];
    }
}
#pragma mark text view

- (void)textViewDidBeginEditing:(YYTextView *)textView {
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                                target:self
                                                                                action:@selector(edit:)];
    self.navigationItem.rightBarButtonItem = buttonItem;
}

- (void)textViewDidEndEditing:(YYTextView *)textView {
    self.navigationItem.rightBarButtonItem = nil;
}



@end
