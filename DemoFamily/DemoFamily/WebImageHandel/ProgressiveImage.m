//
//  ProgressiveImage.m
//  DemoFamily
//
//  Created by Kevin on 2019/1/10.
//  Copyright © 2019年 Kevin. All rights reserved.
//

#import "ProgressiveImage.h"

@interface ProgressiveImage ()
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UISegmentedControl *seg0;
@property (nonatomic, strong) UISegmentedControl *seg1;
@property (nonatomic, strong) UISlider *slider0;
@property (nonatomic, strong) UISlider *slider1;
@end

@implementation ProgressiveImage

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _imageView = [UIImageView new];
    _imageView.size = CGSizeMake(300, 300);
    _imageView.centerX = self.view.centerX;
    _imageView.backgroundColor = [UIColor colorWithWhite:0.790 alpha:1.000];
    _imageView.top = 64 + 20;
    [self.view addSubview:_imageView];
    
    _seg0 = [[UISegmentedControl alloc] initWithItems:@[@"baseline",@"progressive/interlaced"]];
    _seg0.selectedSegmentIndex = 0;
    _seg0.centerX = self.view.centerX;
    _seg0.top = _imageView.bottom + 20;
    _seg0.size = CGSizeMake(300, 25);
    [self.view addSubview:_seg0];
    
    
    _seg1 = [[UISegmentedControl alloc] initWithItems:@[@"JPEG",@"PNG",@"GIF"]];
    _seg1.selectedSegmentIndex = 0;
    _seg1.left = _seg0.left;
    _seg1.top = _seg0.bottom + 20;
    _seg1.size = CGSizeMake(_seg0.width, _seg0.height);
    [self.view addSubview:_seg1];
    
    
    _slider0 = [UISlider new];
    _slider0.width = _seg0.width;
    [_slider0 sizeToFit];
    _slider0.height = 20;
    _slider0.minimumValue = 0;
    _slider0.maximumValue = 1.05;
    _slider0.value = 0;
    _slider0.centerX = self.view.width / 2;
    _slider0.top = _seg1.bottom + 30;
    [self.view addSubview:_slider0];
    
    _slider1 = [UISlider new];
    _slider1.frame = _slider0.frame;
    _slider0.height = 20;
    _slider1.minimumValue = 0;
    _slider1.maximumValue = 20;
    _slider1.value = 0;
    _slider0.top = _slider0.bottom + 30;
    [self.view addSubview:_slider1];
    
    __weak typeof(self) _self = self;
    [_seg0 addBlockForControlEvents:UIControlEventValueChanged block:^(id  _Nonnull sender) {
        [_self change];
    }];
    [_seg1 addBlockForControlEvents:UIControlEventValueChanged block:^(id  _Nonnull sender) {
        [_self change];
    }];
    [_slider0 addBlockForControlEvents:UIControlEventValueChanged block:^(id  _Nonnull sender) {
        [_self change];
    }];
    [_slider1 addBlockForControlEvents:UIControlEventValueChanged block:^(id  _Nonnull sender) {
        [_self change];
    }];
}

- (void )change {
    NSString *name = nil;
    if (_seg0.selectedSegmentIndex == 0) {
        if (_seg1.selectedSegmentIndex == 0) {
            name = @"mew_baseline.jpg";
        } else if (_seg1.selectedSegmentIndex == 1) {
            name = @"mew_baseline.png";
        } else {
            name = @"mew_baseline.gif";
        }
    } else {
        if (_seg1.selectedSegmentIndex == 0) {
            name = @"mew_progressive.jpg";
        } else if (_seg1.selectedSegmentIndex == 1) {
            name = @"mew_interlaced.png";
        } else {
            name = @"mew_interlaced.gif";
        }
    }
    
    NSData *data = [NSData dataNamed:name];
    float progress = _slider0.value;
    if (progress > 1) progress = 1;
    NSData *subData = [data subdataWithRange:NSMakeRange(0, data.length * progress)];
    
    YYImageDecoder *decoder = [[YYImageDecoder alloc] initWithScale:[UIScreen mainScreen].scale];
    [decoder updateData:subData final:NO];
    YYImageFrame *frame = [decoder frameAtIndex:0 decodeForDisplay:YES];
    
    UIImage *image = [frame.image imageByBlurRadius:_slider1.value tintColor:nil tintMode:0 saturation:1 maskImage:nil];
    _imageView.image = image;
}


@end
