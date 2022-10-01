//
//  LFBaseTimeVC.m
//  LFBaseProject
//
//  Created by admin on 2022/8/24.
//

#import "LFBaseTimeVC.h"

@interface LFBaseTimeVC ()

@end

@implementation LFBaseTimeVC

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)handerTimeOne:(UIButton *)sender {
    [self performSelector:@selector(handertask) withObject:self afterDelay:1.5];
}
- (IBAction)handerTimeGCD:(UIButton *)sender {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW,  (int64_t)(1.5  * NSEC_PER_SEC)), dispatch_get_main_queue(),  ^{
        [self handertask];
    });
}
- (IBAction)handerTimeNSTime:(UIButton *)sender {
    // 1.5s后自动调用self的test2方法，repeats如果为YES，意味着每隔1.5s都会调用一次
    [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(handertask) userInfo:nil repeats:YES];


//    // 解决定时器在主线程不工作的问题
//    NSTimer  *timer =  [NSTimer timerWithTimeInterval:2 target:self selector:@selector(handertask) userInfo:nil repeats:YES];
//    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];

    // 通过invalidate方法可以停止定时器的工作，一旦定时器被停止了，就不能再次执行任务。只能再创建一个新的定时器才能执行新的任务`
   
}
-  (void)invalidate{
    
}
- (void)handertask{
    NSLog(@"run");
}

@end
