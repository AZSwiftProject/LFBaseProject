//
//  LFCalendar_JTCalendarVC.h
//  LFBaseProject
//
//  Created by admin on 2022/8/26.
//

#import <UIKit/UIKit.h>
#import <JTCalendar/JTCalendar.h>
NS_ASSUME_NONNULL_BEGIN

@interface LFCalendar_JTCalendarVC : UIViewController<JTCalendarDelegate>
@property (weak, nonatomic) IBOutlet UILabel *yearAndMonthLb;

@property (weak, nonatomic) IBOutlet JTCalendarMenuView *calendarMenuView;
@property (weak, nonatomic) IBOutlet JTHorizontalCalendarView *calendarContentView;

@property (strong, nonatomic) JTCalendarManager *calendarManager;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;
@property (weak, nonatomic) IBOutlet UIButton *preBtn;

- (IBAction)upMonthHander:(UIButton *)sender;
- (IBAction)downMonthHander:(UIButton *)sender;

@end

NS_ASSUME_NONNULL_END
