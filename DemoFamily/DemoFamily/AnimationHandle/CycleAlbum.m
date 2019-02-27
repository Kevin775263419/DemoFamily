//
//  CycleAlbum.m
//  DemoFamily
//
//  Created by Kevin on 2019/2/27.
//  Copyright © 2019年 Kevin. All rights reserved.
//

#import "CycleAlbum.h"

@interface CycleAlbumView ()
@property (nonatomic, strong) UIView  *albumContainer;
@property (nonatomic, strong) NSMutableArray<CALayer *>*noteLayers;
@end



@implementation CycleAlbumView

- (instancetype)init {
    return [self initWithFrame:CGRectMake(0, 0, 50, 50)];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _noteLayers = [NSMutableArray array];
        
        _albumContainer =[[UIView alloc]initWithFrame:self.bounds];
        [self addSubview:_albumContainer];
        
        CALayer *backgroudLayer = [CALayer layer];
        backgroudLayer.frame = self.bounds;
        backgroudLayer.contents = (id)[UIImage imageNamed:@"music_cover"].CGImage;
        [_albumContainer.layer addSublayer:backgroudLayer];
        
        _album = [[UIImageView alloc]initWithFrame:CGRectMake(15, 15, 20, 20)];
        _album.contentMode = UIViewContentModeScaleAspectFill;
        [_albumContainer addSubview:_album];
        
    }
    return self;
}

- (void)startAnimation:(CGFloat)rate {
    rate = rate <= 0 ? 15 : rate;
    [self resetView];
    
    [self initMusicNotoAnimation:@"icon_home_musicnote1" delayTime:0.0f rate:rate];
    [self initMusicNotoAnimation:@"icon_home_musicnote2" delayTime:1.0f rate:rate];
    [self initMusicNotoAnimation:@"icon_home_musicnote1" delayTime:2.0f rate:rate];
    
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0];
    rotationAnimation.duration = 3.0f;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = MAXFLOAT;
    [self.albumContainer.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

- (void)resetView {
    [_noteLayers enumerateObjectsUsingBlock:^(CALayer * noteLayer, NSUInteger idx, BOOL *stop) {
        [noteLayer removeFromSuperlayer];
    }];
    [self.layer removeAllAnimations];
    [self.albumContainer.layer removeAllAnimations];
}

- (void)initMusicNotoAnimation:(NSString *)imageName delayTime:(NSTimeInterval)delayTime rate:(CGFloat)rate{
    CAAnimationGroup *animationGroup = [[CAAnimationGroup alloc]init];
    animationGroup.duration = rate/4.0f;
    animationGroup.beginTime = CACurrentMediaTime() + delayTime;
    animationGroup.repeatCount = MAXFLOAT;
    animationGroup.removedOnCompletion = NO;
    animationGroup.fillMode = kCAFillModeForwards;
    animationGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    //bezier路径帧动画
    CAKeyframeAnimation * pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    CGFloat sideXLength = 40.0f;
    CGFloat sideYLength = 100.0f;
    
    CGPoint beginPoint = CGPointMake(CGRectGetMidX(self.bounds) - 5, CGRectGetMaxY(self.bounds));
    CGPoint endPoint = CGPointMake(beginPoint.x - sideXLength, beginPoint.y - sideYLength);
    NSInteger controlLength = 60;
    
    CGPoint controlPoint = CGPointMake(beginPoint.x - sideXLength/2.0f - controlLength, beginPoint.y - sideYLength/2.0f + controlLength);
    
    UIBezierPath *customPath = [UIBezierPath bezierPath];
    [customPath moveToPoint:beginPoint];
    [customPath addQuadCurveToPoint:endPoint controlPoint:controlPoint];
    
    pathAnimation.path = customPath.CGPath;
    
    
    //旋转帧动画
    CAKeyframeAnimation * rotationAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    [rotationAnimation setValues:@[
                                   [NSNumber numberWithFloat:0],
                                   [NSNumber numberWithFloat:M_PI * 0.10],
                                   [NSNumber numberWithFloat:M_PI * -0.10]]];
    //透明度帧动画
    CAKeyframeAnimation * opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    [opacityAnimation setValues:@[
                                  [NSNumber numberWithFloat:0],
                                  [NSNumber numberWithFloat:0.2f],
                                  [NSNumber numberWithFloat:0.7f],
                                  [NSNumber numberWithFloat:0.2f],
                                  [NSNumber numberWithFloat:0]]];
    //缩放帧动画
    CABasicAnimation *scaleAnimation = [CABasicAnimation animation];
    scaleAnimation.keyPath = @"transform.scale";
    scaleAnimation.fromValue = @(1.0f);
    scaleAnimation.toValue = @(2.0f);
    
    [animationGroup setAnimations:@[pathAnimation, scaleAnimation,  rotationAnimation,opacityAnimation]];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.opacity = 0.0f;
    layer.contents = (__bridge id _Nullable)([UIImage imageNamed:imageName].CGImage);
    layer.frame = CGRectMake(beginPoint.x, beginPoint.y, 10, 10);
    [self.layer addSublayer:layer];
    [_noteLayers addObject:layer];
    [layer addAnimation:animationGroup forKey:nil];
}

@end


@interface CycleAlbum ()
@property(nonatomic, strong) UIImageView *imageView;
@property(nonatomic, assign) BOOL isBegin;

@end

@implementation CycleAlbum

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.imageView = [UIImageView new];
    self.imageView.frame = self.view.bounds;
    self.imageView.image = [UIImage imageNamed:@"img_video_loading"];
    [self.view addSubview:self.imageView];
    
    CycleAlbumView *albumCircle = [CycleAlbumView new];
    albumCircle.tag = 100;
    albumCircle.origin = CGPointMake(80, 80);
    [self.view addSubview:albumCircle];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CycleAlbumView *view = (CycleAlbumView *)[self.view viewWithTag:100];
    if (!_isBegin) [view startAnimation:0];
    if (_isBegin) [view resetView];
    _isBegin = !_isBegin;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)dealloc {
    NSLog(@"CycleAblum class already release");
}


@end
