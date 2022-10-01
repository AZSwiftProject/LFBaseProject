//
//  LFAppShared.m
//  LFBaseProject
//
//  Created by admin on 2022/8/25.
//

#import "LFAppShared.h"

@implementation LFAppShared
+ (instancetype)sharedInstance {
    static LFAppShared *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[LFAppShared alloc] init];
    });
    
    return _instance;
}
+(UIViewController *)getCurrentVC{
    
    UIViewController *result = nil;
    UIWindow * window = [LFAppShared keyWindow];
    UIViewController *appRootVC=window.rootViewController;
    while (appRootVC.presentedViewController) {
        appRootVC = appRootVC.presentedViewController;
    }
    
    if ([appRootVC isKindOfClass:[UITabBarController class]]){
        UITabBarController * tabbar = (UITabBarController *)appRootVC;
        UINavigationController * nav = (UINavigationController *)tabbar.viewControllers[tabbar.selectedIndex];
        result=nav.childViewControllers.lastObject;
        
    }else if ([appRootVC isKindOfClass:[UINavigationController class]]){
        UIViewController * nav = (UIViewController *)appRootVC;
        result = nav.childViewControllers.lastObject;
    }else{
        result = appRootVC;
    }
    
    return result;
}
//获取到keyWindow
+ (UIWindow*)keyWindow
{
    UIWindow *foundWindow = nil;
    NSArray  *windows = [[UIApplication sharedApplication]windows];
//    UIWindowScene.windows
    for (UIWindow  *window in windows) {
        if (window.isKeyWindow) {
            foundWindow = window;
            break;
        }
    }
    return foundWindow;
}
@end
