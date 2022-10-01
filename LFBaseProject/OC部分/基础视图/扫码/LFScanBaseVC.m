//
//  LFScanBaseVC.m
//  LFBaseProject
//
//  Created by admin on 2022/8/26.
//

#import "LFScanBaseVC.h"
#import "LFScanBaseVC+Code1.h"
#import "LFScanVC2.h"
@interface LFScanBaseVC ()
@property (weak, nonatomic) IBOutlet UILabel *code1;
@property (weak, nonatomic) IBOutlet UILabel *code2;

@end

@implementation LFScanBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.code1 addActionWithblock:^{
        [self gotoScanCode];
    }];
    [self.code2 addActionWithblock:^{
        [self.navigationController pushViewController:[LFScanVC2 new] animated:YES];
    }];
}

@end
