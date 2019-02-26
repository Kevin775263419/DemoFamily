//
//  SimpleCodeThread.m
//  DemoFamily
//
//  Created by Kevin on 2019/1/19.
//  Copyright © 2019年 Kevin. All rights reserved.
//

#import "SimpleCodeThread.h"
#import <libkern/OSAtomic.h>
#import "NSObject+SanBox.h"
#import <pthread.h>
#import "Tag.h"



@interface SimpleCodeThread ()<CALayerDelegate>
@property (nonatomic, strong) Tag *recTag;
@property (nonatomic, strong) YYKVStorage *storage;
@property (nonatomic, strong) CALayer *layer;
@end

@implementation SimpleCodeThread

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UILabel *label = [UILabel new];
    label.tag = 100;
    label.top = 64 + 30;
    label.size = CGSizeMake(self.view.width, 80);
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"请查看SimpleCodeThread类的源码";
    label.textColor = [UIColor lightGrayColor];
    
//    [self addALayer];
    [self.view addSubview:label];
    self.recTag = [Tag new];
    self.recTag.tag1 = @"1234";
    self.recTag.dict = @{@"key":@"1"}.mutableCopy;
    
    NSMutableArray *firstArray = [NSMutableArray arrayWithObject:@"1"];
    NSMutableArray *secondArray = [NSMutableArray arrayWithObject:@"2"];
    [firstArray addObject:secondArray];
    [secondArray addObject:firstArray];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //something
        dispatch_async(dispatch_get_main_queue(), ^{
            //something
        });
    });
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //code to be executed once
    });
    double delayInseconds = 2.0;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInseconds * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //code to be executed on the main queue after delay
    });
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
        //并行执行的线程一
        sleep(10);
    });
    dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
        //并行执行的线程二
        sleep(20);
    });
    dispatch_group_notify(group, dispatch_get_global_queue(0, 0), ^{
        //汇总结果
    });
    
    /**iOS中的各种锁*/
    //OSSpinLock已经不安全了
//    __block OSSpinLock oslock = OS_SPINLOCK_INIT;
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        NSLog(@"线程1 准备上锁");
//        OSSpinLockLock(&oslock);
//        sleep(4);
//        NSLog(@"线程1");
//        OSSpinLockUnlock(&oslock);
//        NSLog(@"线程1 解锁成功");
//        NSLog(@"--------------------------------------------------------");
//    });
//
//    //线程2
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        NSLog(@"线程2 准备上锁");
//        OSSpinLockLock(&oslock);
//        NSLog(@"线程2");
//        OSSpinLockUnlock(&oslock);
//        NSLog(@"线程2 解锁成功");
//    });
    
//    dispatch_semaphore_t signal = dispatch_semaphore_create(1); //传入值必须 >=0, 若传入为0则阻塞线程并等待timeout,时间到后会执行其后的语句
//    dispatch_time_t overTime = dispatch_time(DISPATCH_TIME_NOW, 3.0f * NSEC_PER_SEC);
//
//    //线程1
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        NSLog(@"线程1 等待ing");
//        dispatch_semaphore_wait(signal, overTime); //signal 值 -1
//        NSLog(@"线程1");
//        dispatch_semaphore_signal(signal); //signal 值 +1
//        NSLog(@"线程1 发送信号");
//        NSLog(@"--------------------------------------------------------");
//    });
//
//    //线程2
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        NSLog(@"线程2 等待ing");
//        dispatch_semaphore_wait(signal, overTime);
//        NSLog(@"线程2");
//        dispatch_semaphore_signal(signal);
//        NSLog(@"线程2 发送信号");
//    });
    
    
    static pthread_mutex_t pLock;
    pthread_mutex_init(&pLock, NULL);
    //1.线程1
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"线程1 准备上锁");
        pthread_mutex_lock(&pLock);
        sleep(3);
        NSLog(@"线程1");
        pthread_mutex_unlock(&pLock);
    });
    
    //1.线程2
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"线程2 准备上锁");
        pthread_mutex_lock(&pLock);
        NSLog(@"线程2");
        pthread_mutex_unlock(&pLock);
    });
    
    
    //线程1
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        @synchronized (self) {
            sleep(2);
            NSLog(@"synchronized线程1");
        }
    });
    
    //线程2
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        @synchronized (self) {
            NSLog(@"synchronized线程2");
        }
    });
    
    /**
     Hash，一般翻译做“散列”，也有直接音译为“哈希”的，就是把任意长度的输入（又叫做预映射pre-image）通过散列算法变换成固定长度的输出，该输出就是散列值。这种转换是一种压缩映射，也就是，散列值的空间通常远小于输入的空间，不同的输入可能会散列成相同的输出，所以不可能从散列值来确定唯一的输入值。简单的说就是一种将任意长度的消息压缩到某一固定长度的消息摘要的函数。
     所有散列函数都有如下一个基本特性：如果两个散列值是不相同的（根据同一函数），那么这两个散列值的原始输入也是不相同的。这个特性是散列函数具有确定性的结果。但另一方面，散列函数的输入和输出不是一一对应的，如果两个散列值相同，两个输入值很可能是相同的，但不绝对肯定二者一定相等（可能出现哈希碰撞）。输入一些数据计算出散列值，然后部分改变输入值，一个具有强混淆特性的散列函数会产生一个完全不同的散列值。
     了解了hash基本定义，就不能不提到一些著名的hash算法，MD5和SHA-1可以说是应用最广泛的Hash算法，而它们都是以MD4为基础设计的
     MD 是 Message Digest（消息摘要） 的缩写
     SHA1是由NIST NSA设计为同DSA一起使用的，它对长度小于2^64的输入，产生长度为160bit的散列值，因此抗穷举(brute-force)性更好。
     散列表是散列函数的一个主要应用，使用散列表能够快速的按照关键字查找数据记录。（注意：关键字不是像在加密中所使用的那样是秘密的，但它们都是用来“解锁”或者访问数据的。）例如，在英语字典中的关键字是英文单词，和它们相关的记录包含这些单词的定义。在这种情况下，散列函数必须把按照字母顺序排列的字符串映射到为散列表的内部数组所创建的索引上。
     散列表散列函数的几乎不可能/不切实际的理想是把每个关键字映射到的索引上（参考散列），因为这样能够保证直接访问表中的每一个数据。
     
     */
    
    //
    //KVO release after use
//    [self.recTag addObserverBlockForKeyPath:@"dict" block:^(id  _Nonnull obj, id  _Nullable oldVal, id  _Nullable newVal) {
//        NSLog(@"newVale----%@,oldValue----%@",newVal,oldVal);
//    }];
//    
    
    //KVStorage  cache
    Tag *preTag = [Tag new];
    preTag.dict = @{@"key":@"YES"}.mutableCopy;
    preTag.tag1 = @"tag1";
    NSData *data = [preTag modelToJSONData];
    NSString *path = [Tag libCachePath];
    self.storage = [[YYKVStorage alloc] initWithPath:path type:YYKVStorageTypeSQLite];
    [self.storage saveItemWithKey:@"data1" value:data];
    
    
    
}



//给一个Label添加点击事件
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UILabel *labl = [self.view viewWithTag:100];
    UITouch *p = touches.anyObject;
    CGPoint point =  [p locationInView:labl];
    
    if (CGRectContainsPoint(labl.bounds, point)) {
        NSLog(@"我点击了这个label");
        self.recTag.tag1 = @"tag1";
        self.recTag.dict = @{@"key":@"2"}.mutableCopy;
        NSData *getData =  [self.storage getItemValueForKey:@"data1"];
        Tag *getTag = [Tag modelWithJSON:getData];
        NSString *jsonString = [getTag modelToJSONString];
        int storeSize = self.storage.getItemsSize;
        int storeCount = self.storage.getItemsCount;
        NSLog(@"get jsonString %@\n getSize:%d \n getStoreCount:%d",jsonString,storeSize,storeCount);
    }
}

- (void)addALayer {
    UIView *backView = [UIView new];
    backView.backgroundColor = [UIColor lightGrayColor];
    backView.top = self.view.top +200;
    backView.width = 250;
    backView.height = 250;
    backView.centerX = self.view.centerX;
    [self.view addSubview:backView];
    UIImage *image = [UIImage imageNamed:@"mew_baseline.png"];
    backView.layer.contents = (__bridge id)image.CGImage;
    backView.contentMode = UIViewContentModeScaleAspectFill;
//    backView.layer.masksToBounds = YES;
    
    self.layer = [CALayer new];
    self.layer.frame = CGRectMake(0, 0, 100, 100);
    self.layer.backgroundColor = [UIColor blueColor].CGColor;
    [backView.layer addSublayer:self.layer];
    self.layer.contentsScale = [UIScreen mainScreen].scale;
    self.layer.delegate  = self;
    [self.layer display];
    [self.layer display];

    
    /**
     layer给view提供了基础设施，使得绘制内容和呈现更高效动画更容易、更低耗
     layer不参与view的事件处理、不参与响应链
     
     思考一下一个view在系统里起了什么作用：就是接受用户点击和呈现内容。上面这段的意思就是layer负责了内容呈现部分的工作，而不参与用户点击事件处理的工作
     

     */
    
}

/**
 Stops all blocks (associated by `addObserverBlockForKeyPath:block:`) from
 receiving change notifications, and release these blocks.
 */
- (void)dealloc {
//    [self removeObserverBlocksForKeyPath:@"dict"];
    [self removeObserverBlocks];

//    self.layer.delegate = nil;
}
//- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
//{
//    //draw a thick red circle
//    CGContextSetLineWidth(ctx, 10.0f);
//    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
//    CGContextStrokeEllipseInRect(ctx, layer.bounds);
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
