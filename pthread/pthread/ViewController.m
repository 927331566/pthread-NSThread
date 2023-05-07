//
//  ViewController.m
//  pthread
//
//  Created by 王璐 on 2023/5/6.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, assign) int ticketSurplusCount;
@property (nonatomic, strong) NSThread *ticketSaleWindow1;
@property (nonatomic, strong) NSThread *ticketSaleWindow2;
@end





@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self qualityOfServiceStudy];
//    [self initTicketStatusSave];
//
//    [self saleTicketSafe];
    //[self downloadImageOnSubThread];
    //[self performSelectorInBackground:@selector(run) withObject:nil];
    
    //[NSThread detachNewThreadSelector:@selector(run) toTarget:self withObject:nil];
    
//    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(run) object:nil];
//    [thread start];
    // Do any additional setup after loading the view.
}
//qualityOfService属性：设置线程优先级
- (void)qualityOfServiceStudy {
    NSThread *thread1 = [[NSThread alloc] initWithBlock:^{
        NSLog(@"\n 线程：%@ start",[NSThread currentThread]);
    }];
    thread1.name = @"测试线程 1 ";
    [thread1 start];
    
    NSThread *thread2 = [[NSThread alloc] initWithBlock:^{
        NSLog(@"\n 线程：%@ start",[NSThread currentThread]);
    }];
    thread2.qualityOfService = NSQualityOfServiceUserInteractive;
    thread2.name = @"测试线程 2 ";
    NSLog(@"%----@----",  [NSThread callStackSymbols]);
    [thread2 start];
}

/**
 * 初始化火车票数量、卖票窗口(线程安全)、并开始卖票
 */
//- (void)initTicketStatusSave {
//    // 1. 设置剩余火车票为 10
//    self.ticketSurplusCount = 10;
//
//    // 2. 设置北京火车票售卖窗口的线程
//    self.ticketSaleWindow1 = [[NSThread alloc]initWithTarget:self selector:@selector(saleTicketSafe) object:nil];
//    self.ticketSaleWindow1.name = @"北京火车票售票窗口";
//
//    // 3. 设置上海火车票售卖窗口的线程
//    self.ticketSaleWindow2 = [[NSThread alloc]initWithTarget:self selector:@selector(saleTicketSafe) object:nil];
//    self.ticketSaleWindow2.name = @"上海火车票售票窗口";
//
//    // 4. 开始售卖火车票
//    [self.ticketSaleWindow1 start];
//    [self.ticketSaleWindow2 start];
//
//}

/**
 * 售卖火车票(线程安全)
 */
//- (void)saleTicketSafe {
//    while (1) {
//        // 互斥锁
//        @synchronized (self) {
//            //如果还有票，继续售卖
//            if (self.ticketSurplusCount > 0) {
//                self.ticketSurplusCount --;
//                NSLog(@"%@", [NSString stringWithFormat:@"剩余票数：%d 窗口：%@", self.ticketSurplusCount, [NSThread currentThread].name]);
//                [NSThread sleepForTimeInterval:0.2];
//            }
//            //如果已卖完，关闭售票窗口
//            else {
//                NSLog(@"所有火车票均已售完");
//                break;
//            }
//        }
//    }
//}

/**
 * 初始化火车票数量、卖票窗口(非线程安全)、并开始卖票
 */
//- (void)initTicketStatusNotSave {
//    // 1. 设置剩余火车票为 10
//    self.ticketSurplusCount = 10;
//
//    // 2. 设置北京火车票售卖窗口的线程
//    self.ticketSaleWindow1 = [[NSThread alloc]initWithTarget:self selector:@selector(saleTicketNotSafe) object:nil];
//    self.ticketSaleWindow1.name = @"北京火车票售票窗口";
//
//    // 3. 设置上海火车票售卖窗口的线程
//    self.ticketSaleWindow2 = [[NSThread alloc]initWithTarget:self selector:@selector(saleTicketNotSafe) object:nil];
//    self.ticketSaleWindow2.name = @"上海火车票售票窗口";
//
//    // 4. 开始售卖火车票
//    [self.ticketSaleWindow1 start];
//    [self.ticketSaleWindow2 start];
//
//}
//
///**
// * 售卖火车票(非线程安全)
// */
//- (void)saleTicketNotSafe {
//    while (1) {
//        //如果还有票，继续售卖
//        if (self.ticketSurplusCount > 0) {
//            self.ticketSurplusCount --;
//            NSLog(@"%@", [NSString stringWithFormat:@"剩余票数：%d 窗口：%@", self.ticketSurplusCount, [NSThread currentThread].name]);
//            [NSThread sleepForTimeInterval:0.2];
//        }
//        //如果已卖完，关闭售票窗口
//        else {
//            NSLog(@"所有火车票均已售完");
//            break;
//        }
//    }
//}

/**
 * 创建一个线程下载图片
 */
//- (void)downloadImageOnSubThread {
//    // 在创建的子线程中调用downloadImage下载图片
//    [NSThread detachNewThreadSelector:@selector(downloadImage) toTarget:self withObject:nil];
//}
//
///**
// * 下载图片，下载完之后回到主线程进行 UI 刷新
// */
//- (void)downloadImage {
//    NSLog(@"current thread -- %@", [NSThread currentThread]);
//
//    // 1. 获取图片 imageUrl
//    NSURL *imageUrl = [NSURL URLWithString:@"https://ysc-demo-1254961422.file.myqcloud.com/YSC-phread-NSThread-demo-icon.jpg"];
//
//    // 2. 从 imageUrl 中读取数据(下载图片) -- 耗时操作
//    NSData *imageData = [NSData dataWithContentsOfURL:imageUrl];
//    // 通过二进制 data 创建 image
//    UIImage *image = [UIImage imageWithData:imageData];
//
//    // 3. 回到主线程进行图片赋值和界面刷新
//    [self performSelectorOnMainThread:@selector(refreshOnMainThread:) withObject:image waitUntilDone:YES];
//}
//
///**
// * 回到主线程进行图片赋值和界面刷新
// */
//- (void)refreshOnMainThread:(UIImage *)image {
//    NSLog(@"current thread -- %@", [NSThread currentThread]);
//    UIButton* button = [UIButton buttonWithType:UIButtonTypeClose];
//    button.frame = CGRectMake(100, 100, 100, 100);
//    [button setImage:image forState:UIControlStateNormal];
//    [self.view addSubview:button];
//    //UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
////    imageView.frame = CGPointMake(0, 0)
////    // 赋值图片到imageview
////    [self.view addSubview:imageView]
//}
//
//- (void)run {
//    NSLog(@"%@", [NSThread currentThread]);
//}

@end
