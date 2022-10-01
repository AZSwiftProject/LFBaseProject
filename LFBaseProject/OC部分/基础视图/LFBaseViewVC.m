//
//  LFBaseViewVC.m
//  LFBaseProject
//
//  Created by admin on 2022/8/26.
//

#import "LFBaseViewVC.h"
#import "LFCalendarVC.h"
#import <SGQRCode/SGQRCode.h>
#import "LFScanBaseVC.h"
#import "LFDeviceGrantedVC.h"
@interface LFBaseViewVC ()
@property (weak, nonatomic) IBOutlet UILabel *日历;
@property (weak, nonatomic) IBOutlet UILabel *扫码;
@property (weak, nonatomic) IBOutlet UILabel *设备权限;

@end

@implementation LFBaseViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.日历 addActionWithblock:^{
        [self.navigationController pushViewController:[LFCalendarVC new] animated:YES];
    }];
    
    [self.扫码 addActionWithblock:^{
        [self.navigationController pushViewController:[LFScanBaseVC new] animated:YES];
    }];
    [self.设备权限 addActionWithblock:^{
        
        [self.navigationController pushViewController:[LFDeviceGrantedVC new] animated:YES];
    }];
   
}

@end
