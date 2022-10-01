//
//  LFCalendarVC+MSSCalendarView.m
//  LFBaseProject
//
//  Created by admin on 2022/8/26.
//

#import "LFCalendarVC+MSSCalendarView.h"

@implementation LFCalendarVC (MSSCalendarView)
-(void)addCalendar_MSSCalendar{
    [self presentViewController:self.calendarVC animated:YES completion:^{}];
}
@end
