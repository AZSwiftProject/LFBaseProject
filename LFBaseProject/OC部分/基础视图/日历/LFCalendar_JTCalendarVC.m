//
//  LFCalendar_JTCalendarVC.m
//  LFBaseProject
//
//  Created by admin on 2022/8/26.
//

#import "LFCalendar_JTCalendarVC.h"

@interface LFCalendar_JTCalendarVC ()
{
    NSMutableDictionary *_eventsByDate;
    NSDate *_dateSelected;
    NSDate *_minDate;
    NSDate *_maxDate;
    NSDate *_todayDate;

}
@end

@implementation LFCalendar_JTCalendarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.calendarManager = [[JTCalendarManager alloc] initWithLocale:[NSLocale localeWithLocaleIdentifier:@"zh_Hans_CN"] andTimeZone:[NSTimeZone localTimeZone]];
    //
    self.calendarManager.delegate = self;
    [self createRandomEvents];
    [self createMinAndMaxDate];
    self.calendarMenuView.contentRatio = .75;
    self.calendarManager.settings.weekDayFormat = JTCalendarWeekDayFormatSingle;
    [_calendarManager setMenuView:_calendarMenuView];
    [_calendarManager setContentView:_calendarContentView];
    [_calendarManager setDate:[NSDate date]];
    [self.view addActionWithblock:^{
        [self willMoveToParentViewController:nil];
        [self.view removeFromSuperview];
        [self removeFromParentViewController];
    }];
//    self.calendarMenuView.opaque = 0;
    [self.calendarMenuView.scrollView setAlpha:0];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.dateFormat= @"MMMM yyyy";
    dateFormatter.locale = _calendarManager.dateHelper.calendar.locale;
    dateFormatter.timeZone = _calendarManager.dateHelper.calendar.timeZone;
    self.yearAndMonthLb.text = [dateFormatter stringFromDate:[NSDate date]];
    self.nextBtn.enabled = NO;
    self.preBtn.enabled = YES;
}
- (void)createRandomEvents
{
    _eventsByDate = [NSMutableDictionary new];
    
//    for(int i = 0; i < 30; ++i){
//        // Generate 30 random dates between now and 60 days later
//        NSDate *randomDate = [NSDate dateWithTimeInterval:(rand() % (3600 * 24 * 60)) sinceDate:[NSDate date]];
//
//        // Use the date as key for eventsByDate
//        NSString *key = [[self dateFormatter] stringFromDate:randomDate];
//
//        if(!_eventsByDate[key]){
//            _eventsByDate[key] = [NSMutableArray new];
//        }
//
//        [_eventsByDate[key] addObject:randomDate];
//    }
}

// Exemple of implementation of prepareDayView method
// Used to customize the appearance of dayView
- (void)calendar:(JTCalendarManager *)calendar prepareDayView:(JTCalendarDayView *)dayView
{
    dayView.hidden = NO;
    
    // Other month
    if([dayView isFromAnotherMonth]){
        dayView.hidden = YES;
    }
    // Today
    else if([_calendarManager.dateHelper date:[NSDate date] isTheSameDayThan:dayView.date]){
        dayView.circleView.hidden = NO;
        dayView.circleView.backgroundColor = [UIColor blueColor];
        dayView.dotView.backgroundColor = [UIColor whiteColor];
        dayView.textLabel.textColor = [UIColor whiteColor];
    }
    // Selected date
    else if(_dateSelected && [_calendarManager.dateHelper date:_dateSelected isTheSameDayThan:dayView.date]){
        dayView.circleView.hidden = NO;
        dayView.circleView.backgroundColor = [UIColor redColor];
        dayView.dotView.backgroundColor = [UIColor whiteColor];
        dayView.textLabel.textColor = [UIColor whiteColor];
    }
    // Another day of the current month
    else{
        dayView.circleView.hidden = YES;
        dayView.dotView.backgroundColor = [UIColor redColor];
        dayView.textLabel.textColor = [UIColor blackColor];
    }
    
    if([self haveEventForDay:dayView.date]){
        dayView.dotView.hidden = NO;
    }
    else{
        dayView.dotView.hidden = YES;
    }
}

- (void)calendar:(JTCalendarManager *)calendar didTouchDayView:(JTCalendarDayView *)dayView
{
    _dateSelected = dayView.date;
   
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat: @"yyyy-MM-dd"];
    NSString *startDateString = [dateFormatter stringFromDate:dayView.date];
    NSLog(@"%@",startDateString);
    
    // Animation for the circleView
    dayView.circleView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.1, 0.1);
    [UIView transitionWithView:dayView
                      duration:.3
                       options:0
                    animations:^{
                        dayView.circleView.transform = CGAffineTransformIdentity;
                        [_calendarManager reload];
                    } completion:nil];
    
    
    // Don't change page in week mode because block the selection of days in first and last weeks of the month
    if(_calendarManager.settings.weekModeEnabled){
        return;
    }
    
    // Load the previous or next page if touch a day from another month
    
    if(![_calendarManager.dateHelper date:_calendarContentView.date isTheSameMonthThan:dayView.date]){
        if([_calendarContentView.date compare:dayView.date] == NSOrderedAscending){
            [_calendarContentView loadNextPageWithAnimation];
        }
        else{
            [_calendarContentView loadPreviousPageWithAnimation];
        }
    }
}

#pragma mark - Views customization

- (UIView *)calendarBuildMenuItemView:(JTCalendarManager *)calendar
{
    UILabel *label = [UILabel new];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont fontWithName:@"Avenir-Medium" size:16];
    label.hidden = YES;
    return label;
}

- (void)calendar:(JTCalendarManager *)calendar prepareMenuItemView:(UILabel *)menuItemView date:(NSDate *)date
{
    static NSDateFormatter *dateFormatter;
    if(!dateFormatter){
        dateFormatter = [NSDateFormatter new];
        dateFormatter.dateFormat = @"MMMM yyyy";
        
        dateFormatter.locale = _calendarManager.dateHelper.calendar.locale;
        dateFormatter.timeZone = _calendarManager.dateHelper.calendar.timeZone;
    }
    NSLog(@"%@",[dateFormatter stringFromDate:date]);
//    menuItemView.text = [dateFormatter stringFromDate:date];
//    if ([_calendarManager.dateHelper date:[NSDate date] isTheSameDayThan:date]) {
//
//    }
//    NSDate *minDate = [_calendarManager.dateHelper addToDate:[NSDate date] months:-1];
//    if ([_calendarManager.dateHelper date:minDate isTheSameDayThan:date]) {
//        menuItemView.text = [dateFormatter stringFromDate:date];
//    }
    menuItemView.text = [dateFormatter stringFromDate:date];
    
}

- (void)createMinAndMaxDate
{
    _todayDate = [NSDate date];
    
    // Min date will be 2 month before today
    _minDate = [_calendarManager.dateHelper addToDate:_todayDate months:-1];
    
    // Max date will be 2 month after today
    _maxDate = [_calendarManager.dateHelper addToDate:_todayDate months:0];
}

- (BOOL)calendar:(JTCalendarManager *)calendar canDisplayPageWithDate:(NSDate *)date
{
    return [_calendarManager.dateHelper date:date isEqualOrAfter:_minDate andEqualOrBefore:_maxDate];
}

- (void)calendarDidLoadNextPage:(JTCalendarManager *)calendar
{
    //    NSLog(@"Next page loaded");
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.dateFormat= @"MMMM yyyy";
    dateFormatter.locale = _calendarManager.dateHelper.calendar.locale;
    dateFormatter.timeZone = _calendarManager.dateHelper.calendar.timeZone;
    self.yearAndMonthLb.text = [dateFormatter stringFromDate:[NSDate date]];
    self.preBtn.enabled = YES;
    self.nextBtn.enabled = NO;
}

- (void)calendarDidLoadPreviousPage:(JTCalendarManager *)calendar
{
    //    NSLog(@"Previous page loaded");
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.dateFormat= @"MMMM yyyy";
    dateFormatter.locale = _calendarManager.dateHelper.calendar.locale;
    dateFormatter.timeZone = _calendarManager.dateHelper.calendar.timeZone;
    self.yearAndMonthLb.text = [dateFormatter stringFromDate:_minDate];
    self.preBtn.enabled = NO;
    self.nextBtn.enabled = YES;
   
}
- (UIView<JTCalendarWeekDay> *)calendarBuildWeekDayView:(JTCalendarManager *)calendar
{
    JTCalendarWeekDayView *view = [JTCalendarWeekDayView new];
    
    for(UILabel *label in view.dayViews){
        label.textColor = [UIColor blackColor];
        label.font = [UIFont fontWithName:@"Avenir-Light" size:14];
    }
    
    return view;
}

- (UIView<JTCalendarDay> *)calendarBuildDayView:(JTCalendarManager *)calendar
{
    JTCalendarDayView *view = [JTCalendarDayView new];
    
    view.textLabel.font = [UIFont fontWithName:@"Avenir-Light" size:13];
    
    view.circleRatio = .8;
    view.dotRatio = 1. / .9;
    
    return view;
}

#pragma mark - Fake data

// Used only to have a key for _eventsByDate
- (NSDateFormatter *)dateFormatter
{
    static NSDateFormatter *dateFormatter;
    if(!dateFormatter){
        dateFormatter = [NSDateFormatter new];
        dateFormatter.dateFormat = @"dd-MM-yyyy";
    }
    
    return dateFormatter;
}

- (BOOL)haveEventForDay:(NSDate *)date
{
    return YES;
    
}
- (IBAction)upMonthHander:(UIButton *)sender {
    [self.calendarManager setDate:_minDate];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.dateFormat= @"MMMM yyyy";
    dateFormatter.locale = _calendarManager.dateHelper.calendar.locale;
    dateFormatter.timeZone = _calendarManager.dateHelper.calendar.timeZone;
    self.yearAndMonthLb.text = [dateFormatter stringFromDate:_minDate];
    self.preBtn.enabled = NO;
    self.nextBtn.enabled = YES;
}
- (IBAction)downMonthHander:(UIButton *)sender {
    [self.calendarManager setDate:[NSDate date]];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.dateFormat= @"MMMM yyyy";
    dateFormatter.locale = _calendarManager.dateHelper.calendar.locale;
    dateFormatter.timeZone = _calendarManager.dateHelper.calendar.timeZone;
    self.yearAndMonthLb.text = [dateFormatter stringFromDate:_minDate];
    self.preBtn.enabled = YES;
    self.nextBtn.enabled = NO;
    
    
}
@end
