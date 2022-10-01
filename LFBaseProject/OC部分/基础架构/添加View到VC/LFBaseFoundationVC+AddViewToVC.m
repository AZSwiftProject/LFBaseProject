//
//  LFBaseFoundationVC+AddViewToVC.m
//  LFBaseProject
//
//  Created by admin on 2022/8/25.
//

#import "LFBaseFoundationVC+AddViewToVC.h"
#import "LFAppShared.h"
#import "LFBaseFounddation2VC.h"
@implementation LFBaseFoundationVC (AddViewToVC)
- (void)addViewToVC{
    LFBaseFounddation2VC *vc =   [LFBaseFounddation2VC new];
    vc.view.frame = CGRectMake(0,[UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
//    [[LFAppShared keyWindow] addSubview:vc.view]; // 全屏幕
    [[LFAppShared getCurrentVC].view addSubview:vc.view]; // 非全屏幕
    __block  LFBaseFounddation2VC *cusVc = vc;
    [UIView animateWithDuration:0.5 animations:^{
        cusVc.view.frame = CGRectMake(0,0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    }];
}
@end
