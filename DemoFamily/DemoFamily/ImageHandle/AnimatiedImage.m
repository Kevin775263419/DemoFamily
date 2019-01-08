//
//  AnimatiedImage.m
//  DemoFamily
//
//  Created by Kevin on 2019/1/8.
//  Copyright © 2019年 Kevin. All rights reserved.
//

#import "AnimatiedImage.h"
#import "YYImageExampleHelper.h"
#import "YYKit.h"


@interface AnimatiedImage ()<UIGestureRecognizerDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation AnimatiedImage

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.scrollView = [UIScrollView new];
    self.scrollView.frame = self.view.bounds;
    [self.view addSubview:self.scrollView];
    
    UILabel *label = [UILabel new];
    label.top = 20;
    label.size = CGSizeMake(self.view.width, 50);
    label.textColor = [UIColor darkGrayColor];
    label.text = @"展示图片";
    label.textAlignment = NSTextAlignmentCenter;
    [self.scrollView addSubview:label];
    [self addImageWithName:@"timg" andText:@"Animated GIF"];

    
}

- (void )addImageWithName:(NSString *)name andText:(NSString *)text {
    YYImage *image = [YYImage imageNamed:name];
    [self addImage:image size:CGSizeZero text:text];
}
- (void)addImage:(UIImage *)image size:(CGSize)size text:(NSString *)text {
    YYAnimatedImageView *imageView = [[YYAnimatedImageView alloc] initWithImage:image];
    imageView.centerX = self.view.width / 2;
    imageView.top = [(UIView *)[_scrollView.subviews lastObject] bottom] + 30;
    [self.scrollView addSubview:imageView];
    [YYImageExampleHelper addTapControlToAnimatedImageView:imageView];
    [YYImageExampleHelper addPanControlToAnimatedImageView:imageView];
    for (UIGestureRecognizer *g in imageView.gestureRecognizers) {
        g.delegate = self;
    }
    
    UILabel *imageLabel = [UILabel new];
    imageLabel.textColor = [UIColor darkGrayColor];
    imageLabel.frame = CGRectMake(0, 0, self.view.width, 20);
    imageLabel.top = imageView.bottom + 10;
    imageLabel.textAlignment = NSTextAlignmentCenter;
    imageLabel.text = text;
    [_scrollView addSubview:imageLabel];
    
    _scrollView.contentSize = CGSizeMake(self.view.width, imageLabel.bottom + 20);
}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
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
