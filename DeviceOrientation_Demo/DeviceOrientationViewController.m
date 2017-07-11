//
//  DeviceOrientationViewController.m
//  DeviceOrientation_Demo
//
//  Created by admin on 17/7/11.
//  Copyright © 2017年 lizihaha. All rights reserved.
//

#import "DeviceOrientationViewController.h"

@interface DeviceOrientationViewController ()

@end

@implementation DeviceOrientationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //开启和监听设备旋转的通知（若不开启，设备方向一直是UIDeviceOrientationUnknown）
    if (![UIDevice currentDevice].generatesDeviceOrientationNotifications) {
        [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    }
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleDeviceOrientationChange:) name:UIDeviceOrientationDidChangeNotification object:nil];
}

//在这里处理设备方向改变
- (void) handleDeviceOrientationChange:(NSNotification *) notification {
    
    UIDeviceOrientation deviceOrientation = [UIDevice currentDevice].orientation;
    switch (deviceOrientation) {
        case UIDeviceOrientationFaceUp:
            NSLog(@"设备屏幕朝上平躺");
            break;
        case UIDeviceOrientationFaceDown:
            NSLog(@"设备屏幕朝下平躺");
            break;
        case UIDeviceOrientationUnknown:
            NSLog(@"设备未知方向");
            break;
        case UIDeviceOrientationLandscapeLeft:
            NSLog(@"设备屏幕向左横置");
            break;
        case UIDeviceOrientationLandscapeRight:
            NSLog(@"设备屏幕向右橫置");
            break;
        case UIDeviceOrientationPortrait:
            NSLog(@"设备屏幕直立");
            break;
        case UIDeviceOrientationPortraitUpsideDown:
            NSLog(@"设备屏幕直立，上下顛倒");
            break;
        default:
            NSLog(@"设备无法辨识");
            break;
    }
}


//最后在dealloc中移除通知和结束设备旋转的通知
-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [[UIDevice currentDevice] endGeneratingDeviceOrientationNotifications];
}


@end
