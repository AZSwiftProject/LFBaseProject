//
//  LFDeviceGrantedVC+Camera.m
//  LFBaseProject
//
//  Created by admin on 2022/8/27.
//

#import "LFDeviceGrantedVC+Camera.h"
@import AVFoundation;
@implementation LFDeviceGrantedVC (Camera)
- (void)getCameraGranted{
    [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
        if (granted) {
            [self success];
        }else{
            [self failed];
            return;
        }
    }];
}
@end
