//
//  LFBaseAnimationVC.m
//  LFBaseProject
//
//  Created by admin on 2022/8/24.
//

#import "LFBaseAnimationVC.h"
#import "LFBaseAnimationSmallBigVC.h"
//#import "UIButton+WXD.h"
@interface LFBaseAnimationVC ()
@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation LFBaseAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.button.isIgnoreEvent = NO;
//    self.button.eventTimeInterval = .5;
}
- (IBAction)buttonHanderAnimation:(UIButton *)sender {
//    kRepeatClickTime(0.5);
    
    LFBaseAnimationSmallBigVC *vc = [[LFBaseAnimationSmallBigVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
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
