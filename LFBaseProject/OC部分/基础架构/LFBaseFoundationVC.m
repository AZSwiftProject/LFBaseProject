//
//  LFBaseFoundationVC.m
//  LFBaseProject
//
//  Created by admin on 2022/8/25.
//

#import "LFBaseFoundationVC.h"
#import "LFBaseFoundationVC+AddViewToVC.h"
#import "UIView+TouchCallBack.h"
@interface LFBaseFoundationVC ()
@property (weak, nonatomic) IBOutlet UILabel *labelAddViewToVC;

@end

@implementation LFBaseFoundationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.labelAddViewToVC addActionWithblock:^{
        [self addViewToVC];
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
