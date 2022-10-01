//
//  ViewController.m
//  LFBaseProject
//
//  Created by admin on 2022/8/23.
//

#import "ViewController.h"
#import "OCSectionCodeVC.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addChildViewControllers];
}

- (void)addChildViewControllers{
    [self addChildrenViewController:[[SwiftViewController alloc] initWithNibName:@"SwiftViewController" bundle:nil] andTitle:@"Swift 部分" andImageName:@"" andSelectImage:@""];
    [self addChildrenViewController:[[OCSectionCodeVC alloc] init] andTitle:@"OC 部分" andImageName:@"" andSelectImage:@""];
}


- (void)addChildrenViewController:(UIViewController *)childVC andTitle:(NSString *)title andImageName:(NSString *)imageName andSelectImage:(NSString *)selectedImage{
//    childVC.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    childVC.tabBarItem.selectedImage =  [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVC.title = title;
    childVC.tabBarItem.title = title;
    UINavigationController *baseNav = [[UINavigationController alloc] initWithRootViewController:childVC];
    [self addChildViewController:baseNav];
}

@end
