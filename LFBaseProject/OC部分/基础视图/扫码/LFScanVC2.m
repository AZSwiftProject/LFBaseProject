//
//  LFScanVC2.m
//  LFBaseProject
//
//  Created by admin on 2022/8/26.
//

#import "LFScanVC2.h"
#import "DYFCodeScanner.h"
#import "DYFCodeScannerViewController.h"
@interface LFScanVC2 ()

@end

@implementation LFScanVC2
- (IBAction)hander:(id)sender {
    static BOOL shouldPush      = YES;
    static BOOL naviBarHidden   = YES;
    DYFCodeScannerViewController *codesVC = [[DYFCodeScannerViewController alloc] init];
    codesVC.scanType            = DYFCodeScannerTypeAll;
    codesVC.navigationTitle     = @"二维码/条形码";
    codesVC.tipString           = [NSString stringWithFormat:@"将二维码/条形码放入框内，即自动扫描"];
    codesVC.resultHandler       = ^(BOOL result, NSString *stringValue) {
        if (result) {
            NSLog(@"%@",stringValue);
        } else {
            NSLog(@"QRCode Message: %@", stringValue);
        }
    };
    
    if (shouldPush) {
        codesVC.navigationBarHidden = naviBarHidden = !naviBarHidden;
        [self.navigationController pushViewController:codesVC animated:YES];
    } else {
        [self presentViewController:codesVC animated:YES completion:NULL];
    }
    
    shouldPush = !shouldPush;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
