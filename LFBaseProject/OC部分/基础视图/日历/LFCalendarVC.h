//
//  LFCalendarVC.h
//  LFBaseProject
//
//  Created by admin on 2022/8/26.
//

#import <UIKit/UIKit.h>
#import "MSSCalendarViewController.h"
#import "MSSCalendarDefine.h"

NS_ASSUME_NONNULL_BEGIN
@interface LFCalendarVC : UIViewController
@property (nonatomic,assign)NSInteger startDate;
@property (nonatomic,assign)NSInteger endDate;
@property (strong,nonatomic) MSSCalendarViewController *calendarVC;


@end

NS_ASSUME_NONNULL_END
