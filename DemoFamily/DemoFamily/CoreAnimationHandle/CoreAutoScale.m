//
//  CoreAutoScale.m
//  DemoFamily
//
//  Created by Kevin on 2019/1/28.
//  Copyright © 2019年 Kevin. All rights reserved.
//

#import "CoreAutoScale.h"
#import "NSObject+KVOExtent.h"
#import "Tag.h"
@interface CoreAutoScale()
@property (nonatomic, strong) UIView *backView1;
@property (nonatomic, strong) UIView *backView2;
@property (nonatomic, strong) UIView *indicateView1;
@property (nonatomic, strong) UIView *indicateView2;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) UITextField *textFiled;

@property (nonatomic, strong) Tag *tags;



@end

@implementation CoreAutoScale
- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.backView1 = [UIView new];
    self.backView1.size = CGSizeMake(100, 100);
    self.backView1.top = 64 +15;
    self.backView1.centerX = self.view.centerX;
    self.backView1.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.backView1];
    
    self.backView2 = [UIView new];
    self.backView2.size = CGSizeMake(100, 100);
    self.backView2.top = self.backView1.bottom + 80;
    self.backView2.centerX = self.view.centerX;
    self.backView2.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.backView2];
    
    self.indicateView1 = [UIView new];
    self.indicateView1.size = CGSizeMake(10, 40);
    self.indicateView1.left = 45;
    self.indicateView1.top = 30;
    self.indicateView1.backgroundColor = [UIColor blueColor];
    [self.backView1 addSubview:self.indicateView1];
    
    self.indicateView2 = [UIView new];
    self.indicateView2.size = CGSizeMake(10, 40);
    self.indicateView2.left = 45;
    self.indicateView2.top = 30;
    self.indicateView2.backgroundColor = [UIColor blueColor];
    [self.backView2 addSubview:self.indicateView2];
    [self start];
    CGFloat paramter= GetPromoteParamters(0.3);
    
    self.textFiled = [UITextField new];
    self.textFiled.placeholder = @"请输入我的名字";
    self.textFiled.size = CGSizeMake(self.view.width, 40);
    self.textFiled.top = self.backView1.bottom + 20;
    [self.view addSubview:self.textFiled];
    
    self.tags = [Tag new];
    self.tags.tag1 = @"123412341234123";
    self.tags.dict = @{@"oneKey":@"oneValue"}.mutableCopy;
    [self.tags addObserverBlockForKeyPath:@"tag1" block:^(id  _Nonnull obj, id  _Nullable oldVal, id  _Nullable newVal) {
        NSLog(@"oldKey:%@-----------newKey%@",oldVal,newVal);
    }];
//    [self.tags byObserverBlockForKeyPath:@"tag1" block:^(__weak id  _Nonnull object, id  _Nonnull oldVal, id  _Nonnull newVal) {
//        NSLog(@"oldKey:%@-----------newKey%@",oldVal,newVal);
//    }];
//    [self.tags removeObserverBlocks];
    
}

- (void)start {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(tick) userInfo:nil repeats:YES];
    //set initial hand positions
    [self tick];
}
- (void)tick {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSUInteger units = NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *components = [calendar components:units fromDate:[NSDate date]];
    CGFloat secsAngle = (components.second / 60.0) * M_PI * 2.0;
    self.indicateView1.transform = CGAffineTransformMakeRotation(secsAngle);
    self.indicateView2.layer.anchorPoint = CGPointMake(0.5f, 0.9f);
    self.indicateView2.transform = CGAffineTransformMakeRotation(secsAngle);
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.tags.tag1 = @"1";
    self.tags.dict = @{}.mutableCopy;
    
    
}
- (void)dealloc {
    [self.timer invalidate];
    [self removeObserverBlocks];
    self.timer = nil;
}
    

@end
