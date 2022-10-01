//
//  OCSectionCodeVC.m
//  LFBaseProject
//
//  Created by admin on 2022/9/16.
//

#import "OCSectionCodeVC.h"
#import "LFBaseVC.h"
#import "LFBaseViewVC.h"
#import "LFBaseModelVC.h"
#import "LFBaseNetworkVC.h"
#import "LFBaseLogicVC.h"
#import "LFBaseFoundationVC.h"
#import "LFBaseAllConutryVC.h"
#import "LFBaseThirdVC.h"
#import "LFBaseAnimationVC.h"
@interface OCSectionCodeVC ()
@end

@implementation OCSectionCodeVC
- (void)viewDidLoad {
    [super viewDidLoad];
    [self addChildViewControllers];
}
- (void)addChildViewControllers{
    [self addChildrenViewController:[[LFBaseFoundationVC alloc] init] andTitle:@"基础架构" andImageName:@"" andSelectImage:@""];
    [self addChildrenViewController:[[LFBaseAnimationVC alloc] init] andTitle:@"基础动画" andImageName:@"" andSelectImage:@""];
    [self addChildrenViewController:[[LFBaseVC alloc] init] andTitle:@"基础控制器" andImageName:@"" andSelectImage:@""];
    [self addChildrenViewController:[[LFBaseViewVC alloc] init] andTitle:@"基础视图" andImageName:@"" andSelectImage:@""];
    [self addChildrenViewController:[[LFBaseModelVC alloc] init] andTitle:@"基础模型" andImageName:@"" andSelectImage:@""];
    [self addChildrenViewController:[[LFBaseNetworkVC alloc] init] andTitle:@"基础请求" andImageName:@"" andSelectImage:@""];
    [self addChildrenViewController:[[LFBaseLogicVC alloc] init] andTitle:@"基础算法" andImageName:@"" andSelectImage:@""];
    [self addChildrenViewController:[[LFBaseAllConutryVC alloc] init] andTitle:@"基础国际化" andImageName:@"" andSelectImage:@""];
    [self addChildrenViewController:[[LFBaseThirdVC alloc] init] andTitle:@"基础嵌入" andImageName:@"" andSelectImage:@""];
}
- (void)addChildrenViewController:(UIViewController *)childVC andTitle:(NSString *)title andImageName:(NSString *)imageName andSelectImage:(NSString *)selectedImage{
    childVC.title = title;
    childVC.tabBarItem.title = title;
    UINavigationController *baseNav = [[UINavigationController alloc] initWithRootViewController:childVC];
    [self addChildViewController:baseNav];
}
@end
