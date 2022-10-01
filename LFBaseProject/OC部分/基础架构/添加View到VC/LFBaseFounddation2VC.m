//
//  LFBaseFounddation2VC.m
//  LFBaseProject
//
//  Created by admin on 2022/8/25.
//

#import "LFBaseFounddation2VC.h"

@interface LFBaseFounddation2VC ()
@property (weak, nonatomic) IBOutlet UIView *headerView;

@end

@implementation LFBaseFounddation2VC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
    self.headerView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.headerView.layer.shadowOpacity = 0.8f;
    self.headerView.layer.shadowRadius = 4.f;
//    self.headerView.layer.shadowOffset = CGSizeMake(4,4); // 右边 下边
//    self.headerView.layer.shadowOffset = CGSizeMake(-4,4);  // 左边 下边
//    self.headerView.layer.shadowOffset = CGSizeMake(-4,-4);  // 左边 上边
//    self.headerView.layer.shadowOffset = CGSizeMake(0,-4);  // 左边 右边 上边
//    self.headerView.layer.shadowOffset = CGSizeMake(-4,0);  // 左边 上边 下边
//    self.headerView.layer.shadowOffset = CGSizeMake(0,0);  // 四周
    CGFloat  paintingWidth =  self.headerView.frame.size.width;
    CGFloat  paintingHeight =  self.headerView.frame.size.height;
    //路径阴影
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(-5, -5)];
    //添加直线
    [path addLineToPoint:CGPointMake(paintingWidth /2, -15)];
    [path addLineToPoint:CGPointMake(paintingWidth +5, -5)];
    [path addLineToPoint:CGPointMake(paintingWidth +15, paintingHeight /2)];
    [path addLineToPoint:CGPointMake(paintingWidth +5, paintingHeight +5)];
    [path addLineToPoint:CGPointMake(paintingWidth /2, paintingHeight +15)];
    [path addLineToPoint:CGPointMake(-5, paintingHeight +5)];
    [path addLineToPoint:CGPointMake(-15, paintingHeight /2)];
    [path addLineToPoint:CGPointMake(-5, -5)];
    //设置阴影路径
    self.headerView.layer.shadowPath = path.CGPath;
//    [self.view  addT]
    
    [self.view addActionWithblock:^{
        [self willMoveToParentViewController:nil];
        [self.view removeFromSuperview];
        [self removeFromParentViewController];
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
