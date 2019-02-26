//
//  AwemeCollectionCell.m
//  DemoFamily
//
//  Created by Kevin on 2019/2/20.
//  Copyright © 2019年 Kevin. All rights reserved.
//

#import "AwemeCollectionCell.h"
#import "AwemeListResponse.h"

@implementation AwemeCollectionCell
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self){
        self.clipsToBounds = YES;
        _imageView = [[YYAnimatedImageView alloc] init];
        _imageView.backgroundColor = ColorThemeGray;
        _imageView.size = self.size;
        _imageView.clipsToBounds = YES;
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        [self.contentView addSubview:_imageView];
        
//        CAGradientLayer *gradientLayer = [CAGradientLayer layer];
//        gradientLayer.colors = @[(__bridge id)ColorClear.CGColor, (__bridge id)ColorBlackAlpha20.CGColor, (__bridge id)ColorBlackAlpha60.CGColor];
//        gradientLayer.locations = @[@0.3, @0.6, @1.0];
//        gradientLayer.startPoint = CGPointMake(0.0f, 0.0f);
//        gradientLayer.endPoint = CGPointMake(0.0f, 1.0f);
//        gradientLayer.frame = CGRectMake(0, self.frame.size.height - 100, self.frame.size.width, 100);
//        [_imageView.layer addSublayer:gradientLayer];
        
        _favoriteNum = [[UIButton alloc] init];
        [_favoriteNum setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        [_favoriteNum setTitleEdgeInsets:UIEdgeInsetsMake(0, 2, 0, 0)];
        [_favoriteNum setTitle:@"0" forState:UIControlStateNormal];
        [_favoriteNum setTitleColor:ColorWhite forState:UIControlStateNormal];
        _favoriteNum.titleLabel.font = SmallFont;
        [_favoriteNum setImage:[UIImage imageNamed:@"icon_home_likenum"] forState:UIControlStateNormal];
        [_favoriteNum setImageEdgeInsets:UIEdgeInsetsMake(0, -2, 0, 0)];
        [self.contentView addSubview:_favoriteNum];
        
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
        [_favoriteNum mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(10);
            make.bottom.right.equalTo(self.contentView).inset(10);
        }];
        
        
        //添加一个进度条
        CGFloat lineHeight = 4;
        _progressLayer = [CAShapeLayer layer];
        _progressLayer.size = CGSizeMake(_imageView.width, lineHeight);
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(0, _progressLayer.height / 2)];
        [path addLineToPoint:CGPointMake(_imageView.width, _progressLayer.height / 2)];
        _progressLayer.lineWidth = lineHeight;
        _progressLayer.path = path.CGPath;
        _progressLayer.strokeColor = [UIColor colorWithRed:0.000 green:0.640 blue:1.000 alpha:0.720].CGColor;
        _progressLayer.lineCap = kCALineCapButt;
        _progressLayer.strokeStart = 0;
        _progressLayer.strokeEnd = 0;
        [_imageView.layer addSublayer:_progressLayer];
        
    }
    return self;
}

-(void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:NO];
}

- (void)prepareForReuse {
    [super prepareForReuse];
    [self.imageView setImage:nil];
}

- (void)initData:(Aweme *)aweme {
    __weak typeof(self) _self = self;
    [CATransaction begin];
    [CATransaction setDisableActions: YES];
    self.progressLayer.hidden = YES;
    self.progressLayer.strokeEnd = 0;
    [CATransaction commit];
    NSURL *url = [NSURL URLWithString:aweme.video.dynamic_cover.url_list.firstObject];
    
    [_imageView setImageWithURL:url
                       placeholder:nil
                           options:YYWebImageOptionProgressiveBlur | YYWebImageOptionShowNetworkActivity | YYWebImageOptionSetImageWithFadeAnimation
                          progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                              if (expectedSize > 0 && receivedSize > 0) {
                                  CGFloat progress = (CGFloat)receivedSize / expectedSize;
                                  progress = progress < 0 ? 0 : progress > 1 ? 1 : progress;
                                  if (_self.progressLayer.hidden) _self.progressLayer.hidden = NO;
                                  _self.progressLayer.strokeEnd = progress;
                              }
                          } transform:nil
                        completion:^(UIImage *image, NSURL *url, YYWebImageFromType from, YYWebImageStage stage, NSError *error) {
                            if (stage == YYWebImageStageFinished) {
                                _self.progressLayer.hidden = YES;
                                [_self.imageView setImage:image];
                            }
                        }];
//    [self.imageView setWebPImageWithURL:[NSURL URLWithString:aweme.video.dynamic_cover.url_list.firstObject] progressBlock:^(CGFloat percent) {
//    } completedBlock:^(UIImage *image, NSError *error) {
//        if(!error) {
//            [wself.imageView setImage:image];
//        }
//    }];
//    [self.favoriteNum setTitle:[NSString formatCount:aweme.statistics.digg_count] forState:UIControlStateNormal];
}
@end
