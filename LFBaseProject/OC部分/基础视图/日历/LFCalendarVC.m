//
//  LFCalendarVC.m
//  LFBaseProject
//
//  Created by admin on 2022/8/26.
//

#import "LFCalendarVC.h"
#import "LFCalendarVC+MSSCalendarView.h"
#import "LFCalendarVC+JTCalendarView.h"

@interface LFCalendarVC ()
<MSSCalendarViewControllerDelegate>{
    NSMutableDictionary *_eventsByDate;
    NSDate *_dateSelected;
}
@property (weak, nonatomic) IBOutlet UILabel *mssCalendarLb;
@property (weak, nonatomic) IBOutlet UILabel *jtCalendarLb;

@end

@implementation LFCalendarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.mssCalendarLb addActionWithblock:^{
        [self addCalendar_MSSCalendar];
    }];
    [self.jtCalendarLb addActionWithblock:^{
        [self addCalendar_JTCalendarView];
    }];

    
}
#pragma mark - 日历组件 MSSCalendarViewController
- (MSSCalendarViewController *)calendarVC{
    if (!_calendarVC) {
        _calendarVC = [[MSSCalendarViewController alloc]init];
        _calendarVC.limitMonth = 2;// 显示几个月的日历
        _calendarVC.type = MSSCalendarViewControllerLastType;
        _calendarVC.beforeTodayCanTouch = YES;// 今天之后的日期是否可以点击
        _calendarVC.afterTodayCanTouch = YES;// 今天之前的日期是否可以点击
        _calendarVC.startDate = _startDate;// 选中开始时间
        _calendarVC.endDate = _endDate;// 选中结束时间
        ///*以下两个属性设为YES,计算中国农历非常耗性能（在5s加载15年以内的数据没有影响）*/
        _calendarVC.showChineseHoliday = NO;// 是否展示农历节日
        _calendarVC.showChineseCalendar = NO;// 是否展示农历
        _calendarVC.showHolidayDifferentColor = NO;// 节假日是否显示不同的颜色
        _calendarVC.showAlertView = NO;//
        _calendarVC.delegate = self;
    }
    return _calendarVC;
}
- (void)calendarViewConfirmClickWithStartDate:(NSInteger)startDate endDate:(NSInteger)endDate
{
    _startDate = startDate;
    _endDate = endDate;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat: @"yyyy-MM-dd"];
    NSString *startDateString = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:_startDate]];
    NSString *endDateString = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:_endDate]];
    NSLog(@"开始%@",startDateString);
    NSLog(@"结束%@",endDateString);

}

@end
