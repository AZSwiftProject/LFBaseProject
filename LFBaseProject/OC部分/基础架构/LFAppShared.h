//
//  LFAppShared.h
//  LFBaseProject
//
//  Created by admin on 2022/8/25.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface LFAppShared : NSObject
+ (instancetype)sharedInstance;
+(UIViewController *)getCurrentVC;
+ (UIWindow*)keyWindow;
@end

NS_ASSUME_NONNULL_END
