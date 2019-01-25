//
//  SimpleDemoTotal.m
//  DemoFamily
//
//  Created by Kevin on 2019/1/16.
//  Copyright © 2019年 Kevin. All rights reserved.
//

#import "SimpleDemoTotal.h"

@interface SimpleDemoTotal ()
@property (nonatomic, strong) UIScrollView *scrollview;
@property (nonatomic, strong) YYLabel *layoutLable;


@end

@implementation SimpleDemoTotal

- (void)viewDidLoad {
    [super viewDidLoad];
        self.view.backgroundColor = [UIColor whiteColor];

    self.view.exclusiveTouch = YES;

//    // Do any additional setup after loading the view.
    self.scrollview = [UIScrollView new];
    self.scrollview.frame = self.view.frame;
    self.scrollview.contentSize = CGSizeMake(kScreenWidth, kScreenHeight);
    self.scrollview.userInteractionEnabled = YES;
    [self.view addSubview:self.scrollview];
    UILabel *labl = [UILabel new];
    labl.top = self.scrollview.top;
    labl.size = CGSizeMake(kScreenWidth, 2);
    labl.backgroundColor = [UIColor lightGrayColor];
    [self.scrollview addSubview:labl];
    self.fpsScrollviewObserver = self.scrollview;
    self.scrollview.exclusiveTouch = YES;
    self.view.exclusiveTouch = YES;

    [self createAttchmentment];
}

- (void)createAttchmentment {
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"这是一个attchment"];
    str.font = [UIFont systemFontOfSize:15];
    str.color = [UIColor blueColor];
    UIImage *image = [UIImage imageNamed:@"001"];
    
    
    NSMutableAttributedString *attach = [[NSMutableAttributedString alloc] initWithString:YYTextAttachmentToken];
    YYTextAttachment *attacment = [YYTextAttachment new];
    attacment.contentInsets = UIEdgeInsetsMake(-8, -8, -8, -8);
    [attacment setContentMode:UIViewContentModeScaleAspectFit];
    [attacment setContent:image];
    [attach setTextAttachment:attacment range:NSMakeRange(0, attach.length)];
    [str appendAttributedString:[[NSMutableAttributedString alloc] initWithString:@"  "]];
    [str appendAttributedString:attach];
    [self addViewLabel:str];
    
    /**
     中间层添加layout进行布局
     */
    YYTextContainer *container = [YYTextContainer containerWithSize:CGSizeMake(kScreenWidth, 50)];
    YYTextLayout *layout = [YYTextLayout layoutWithContainer:container text:str];
    [self addviewLayoutLabel:str andLayout:layout];
}

- (void)addViewLabel:(NSAttributedString *)str {
    UIView *lastView = (UIView *)[self.scrollview.subviews lastObject];
    YYLabel *label = [YYLabel new];
    label.userInteractionEnabled = YES;
    label.numberOfLines = 0;
    label.top = lastView.bottom + 20;
    label.size = CGSizeMake(self.view.width - 40, 40);
    label.left = 100;
    label.contentMode = UIViewContentModeScaleAspectFit;
    label.attributedText = str;
    [self.scrollview addSubview:label];
}

- (void)addviewLayoutLabel:(NSAttributedString *)str andLayout:(YYTextLayout *)layout {
    UIView *lastView = (UIView *)[self.scrollview.subviews lastObject];
    _layoutLable = [YYLabel new];
    _layoutLable.textVerticalAlignment = YYTextVerticalAlignmentCenter;
    _layoutLable.displaysAsynchronously = YES;
    _layoutLable.ignoreCommonProperties = YES;
    _layoutLable.fadeOnHighlight = NO;
    _layoutLable.fadeOnAsynchronouslyDisplay = NO;
    _layoutLable.highlightTapAction = ^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
    };
    _layoutLable.backgroundColor = [UIColor lightGrayColor];
    _layoutLable.top = lastView.bottom + 20;
    _layoutLable.size = CGSizeMake(self.view.width - 40, 40);
    _layoutLable.contentMode = UIViewContentModeScaleAspectFit;
    _layoutLable.textLayout = layout;
    [self.scrollview addSubview:_layoutLable];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *t = touches.anyObject;
    CGPoint point = [t locationInView:_layoutLable];
    if (CGRectContainsPoint(_layoutLable.bounds, point)) {
        NSLog(@"我点击了这个区域");
    }
    
}




@end
