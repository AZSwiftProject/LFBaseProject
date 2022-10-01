//
//  LFDeviceGrantedVC.m
//  LFBaseProject
//
//  Created by admin on 2022/8/27.
//

#import "LFDeviceGrantedVC.h"
#import "LFDeviceGrantedVC+Camera.h"
@interface LFDeviceGrantedVC ()
@property (weak, nonatomic) IBOutlet UILabel *相机权限;
@property (weak, nonatomic) IBOutlet UILabel *相册权限;

@end

@implementation LFDeviceGrantedVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.相机权限 addActionWithblock:^{
        
    }];
   
}
- (void)success {
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"有权限" preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *alertA = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alertC addAction:alertA];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:alertC animated:YES completion:nil];
    });
}
- (void)unknown {
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"不知道" preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *alertA = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alertC addAction:alertA];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:alertC animated:YES completion:nil];
    });
}
- (void)failed {
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"没有权限" preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *alertA = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
    }];
    
    [alertC addAction:alertA];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:alertC animated:YES completion:nil];
    });
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
