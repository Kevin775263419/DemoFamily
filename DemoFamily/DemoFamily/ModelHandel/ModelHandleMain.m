//
//  ModelHandleMain.m
//  DemoFamily
//
//  Created by Kevin on 2019/1/7.
//  Copyright © 2019年 Kevin. All rights reserved.
//

#import "ModelHandleMain.h"
#import "Users.h"
#import "Album.h"
#import "Message.h"
/*Books*/
@interface Books :NSObject
@property (assign, nonatomic) NSInteger pages;
@property (copy, nonatomic)   NSString *name;
@property (copy, nonatomic)   NSString *publishDate;

@end
@implementation Books

@end
/*Books*/


/*YYShadow*/
@interface YYShadow :NSObject <NSCoding, NSCopying>
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, strong) UIColor *color;
@end

@implementation YYShadow
- (void)encodeWithCoder:(NSCoder *)aCoder { [self modelEncodeWithCoder:aCoder]; }
- (id)initWithCoder:(NSCoder *)aDecoder { return [self modelInitWithCoder:aDecoder]; }
- (id)copyWithZone:(NSZone *)zone { return [self modelCopy]; }
- (NSUInteger)hash { return [self modelHash]; }
- (BOOL)isEqual:(id)object { return [self modelIsEqual:object]; }
@end
/*YYShadow*/


@interface ModelHandleMain ()
@property (nonatomic, strong) UILabel *showLabel;
@property (nonatomic, strong) NSString *logText;
@property (nonatomic, strong) UITextView *textView;

@end

@implementation ModelHandleMain

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.logText = @"";
    [self userInterfaceSet];
    [self modelHandleBaseModel];
    [self modelHandleNestModel];
    [self modelContainerObjectModel];
    [self modelMapperExample];
    [self CodingCopyingHashEqualExample];
    
    self.textView.text = self.logText;
    
}
- (void)userInterfaceSet {
    self.showLabel = [[UILabel alloc] init];
    self.showLabel.top = 120;
    self.showLabel.text = @"请注意打印台日志";
    self.showLabel.size = CGSizeMake(self.view.width, 40);
    self.showLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.showLabel];
    
    self.textView = [UITextView new];
    self.textView.font = [UIFont systemFontOfSize:13];
    self.textView.textColor = [UIColor darkGrayColor];
    self.textView.top = self.showLabel.bottom + 15;
    self.textView.left = 15;
    self.textView.size = CGSizeMake(self.view.width - 30, 300);
    [self.view addSubview:self.textView];

}

/**普通转化model*/
- (void)modelHandleBaseModel {
    NSString *bookStr = @"{\"pages\":122,\"name\":\"Harry Potter\",\"publishDate\":\"2010-01-01T08:00:00+0800\"}";
    Books *book = [Books modelWithJSON:bookStr];
    NSString *jsonString = [book modelToJSONString];
    NSString *name = NSStringFromClass([Books class]);
    id obj = nil;
    Class class = NSClassFromString(@"Books");
    @try {
        obj = [class modelWithJSON:bookStr];
    } @catch (NSException *exception) {
        NSLog(@"%@",exception);
    }
    if (obj) NSLog(@"他究竟是什么类名%@",[obj class]);
    
    
    NSLog(@"book页码:%ld\nbook JSON:%@",(long)book.pages,jsonString);
    self.logText = [self.logText stringByAppendingString:[NSString stringWithFormat:@"普通转化model：\n%@\n\n\n",jsonString]];
}

/**嵌套对象转model*/
- (void)modelHandleNestModel {
    NSString *userStr = @"{\"owner\":{\"uid\":989898,\"name\":\"秦光义\"},\"rid\":123456789,\"createTime\":\"2011-06-09T14:24:26+0800\",\"name\":\"YYKit\"}";
    Users *user = [Users modelWithJSON:userStr];
    NSString *jsonString = [user modelToJSONString];
    NSLog(@"user名字:%@ \nuser JSON:%@",user.name,jsonString);
    self.logText = [self.logText stringByAppendingString:[NSString stringWithFormat:@"嵌套对象转model：\n%@\n\n\n",jsonString]];

}

/**嵌套多层对象 数组转model*/
- (void)modelContainerObjectModel {
    NSString *albumStr = @"{\"likedUsers\":{\"Jony\":{\"uid\":10001,\"name\":\"Jony\"},\"Anna\":{\"uid\":10002,\"name\":\"Anna\"}},\"likedUserIds\":[10002,10001],\"photos\":[{\"url\":\"http:\\/\\/example.com\\/1.png\",\"desc\":\"Happy~\"},{\"url\":\"http:\\/\\/example.com\\/2.png\",\"desc\":\"Yeah!\"}],\"name\":\"Happy Birthday\"}";
    Album *bum = [Album modelWithJSON:albumStr];
    NSString *jsonString = [bum modelToJSONString];
    NSLog(@"Album JSON:%@",jsonString);
    self.logText = [self.logText stringByAppendingString:[NSString stringWithFormat:@"嵌套多层对象 数组转model：\n%@\n\n\n",jsonString]];

}

/**key值进行匹配转model*/
- (void)modelMapperExample {
    Message *message = [Message modelWithJSON:@"{\"i\":\"2000000001\",\"c\":\"Hello\",\"t\":\"1437237598000\"}"];
    NSString *messageJSON = [message modelToJSONString];
    NSLog(@"message: %@", messageJSON);
    self.logText = [self.logText stringByAppendingString:[NSString stringWithFormat:@"key值进行匹配转model\n%@\n\n\n",messageJSON]];
}

/*Coding CopyHashEqualExample*/
- (void)CodingCopyingHashEqualExample {
    YYShadow *shadow = [YYShadow new];
    shadow.name = @"Test";
    shadow.size = CGSizeMake(10, 0);
    shadow.color = [UIColor blueColor];
    
    YYShadow *shadow2 = [shadow deepCopy]; // Archive and Unachive
    BOOL equal = [shadow isEqual:shadow2];
    NSLog(@"shadow equals: %@",equal ? @"YES" : @"NO");
}





@end
