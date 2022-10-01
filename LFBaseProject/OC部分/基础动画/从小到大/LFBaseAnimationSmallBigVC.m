//
//  LFBaseAnimationSmallBigVC.m
//  LFBaseProject
//
//  Created by admin on 2022/8/24.
//

#import "LFBaseAnimationSmallBigVC.h"
#import <pop/POP.h>
@interface LFBaseAnimationSmallBigVC ()
@property (weak, nonatomic) IBOutlet UIView *changeView;
@property (weak, nonatomic) IBOutlet UIView *changeView1;

@property (weak, nonatomic) IBOutlet UIView *changeView2;

@property (weak, nonatomic) IBOutlet UIView *changeView3;

@property (weak, nonatomic) IBOutlet UIView *changeView4;

@end

@implementation LFBaseAnimationSmallBigVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self performSelector:@selector(sacleBighander:) withObject:nil afterDelay:1.5];
}
- (IBAction)sacleBighander:(UIButton *)sender {
    [self doAnimation:self.changeView];
    [self doAnimation:self.changeView1];
    [self doAnimation:self.changeView2];
    [self doAnimation:self.changeView3];
    [self doAnimation:self.changeView4];
    [self performSelector:@selector(sacleBighander:) withObject:nil afterDelay:5];
}
- (IBAction)sacleSmallhander:(UIButton *)sender {
    
    

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)doAnimation:(UIView *)animationView {
    
    // 移除动画
    [animationView.layer pop_removeAllAnimations];
    
    POPSpringAnimation *spring = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    
    // 设置代理
    spring.delegate            = self;
    
    // 动画起始值 + 动画结束值
    spring.fromValue           = [NSValue valueWithCGSize:CGSizeMake(0.1f, 0.1f)];
    spring.toValue             = [NSValue valueWithCGSize:CGSizeMake(1.f, 1.f)];
    // 参数的设置
    spring.springSpeed         = 16.81; // 速度
    spring.springBounciness    = 9.5; // 弹力
    spring.dynamicsMass        = 0.45; // 重力
    spring.dynamicsFriction    = 43.47; // 摩擦力
    spring.dynamicsTension     = 331.0; // 拉力
    
    // 执行动画
    [animationView.layer pop_addAnimation:spring forKey:nil];
}
@end
