//
//  LFCalendarVC+JTCalendarView.m
//  LFBaseProject
//
//  Created by admin on 2022/8/26.
//

#import "LFCalendarVC+JTCalendarView.h"
#import "LFCalendar_JTCalendarVC.h"
@implementation LFCalendarVC (JTCalendarView)
-(void)addCalendar_JTCalendarView{
    LFCalendar_JTCalendarVC *vc =   [LFCalendar_JTCalendarVC new];
    vc.view.frame = CGRectMake(0,[UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    [[LFAppShared keyWindow] addSubview:vc.view]; // 全屏幕
//    [[LFAppShared getCurrentVC].view addSubview:vc.view]; // 非全屏幕
    __block  LFCalendar_JTCalendarVC *cusVc = vc;
    [UIView animateWithDuration:0.5 animations:^{
        cusVc.view.frame = CGRectMake(0,0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    }];
}

@end
