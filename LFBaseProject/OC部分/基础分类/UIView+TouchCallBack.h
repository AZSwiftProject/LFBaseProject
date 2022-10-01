//
//  UIView+TouchCallBack.h
//  LFBaseProject
//
//  Created by admin on 2022/8/25.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
NS_ASSUME_NONNULL_BEGIN
typedef void(^TouchCallBackBlock)(void);

@interface UIView (TouchCallBack)
@property (nonatomic, copy) TouchCallBackBlock touchCallBackBlock;

- (void)addActionWithblock:(TouchCallBackBlock)block;

- (void)addTarget:(id)target action:(SEL)action;

@end

NS_ASSUME_NONNULL_END
