//
//  InterfaceOrientationViewController.m
//  DeviceOrientation_Demo
//
//  Created by admin on 17/7/11.
//  Copyright © 2017年 lizihaha. All rights reserved.
//

#import "InterfaceOrientationViewController.h"

@interface InterfaceOrientationViewController ()

@end

@implementation InterfaceOrientationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //以监听UIApplicationDidChangeStatusBarOrientationNotification通知为例
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(handleStatusBarOrientationChange:)
                                                name:UIApplicationDidChangeStatusBarOrientationNotification object:nil];
}
///是否支持自动转屏
-(BOOL)shouldAutorotate
{
    return YES;///很明显如果返回YES就可以，返回NO就不行
}
///如果上面方法返回YES则会根据这个方法判断支持的方向
-(UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;///这个是所有方向
}

//界面方向改变的处理
- (void)handleStatusBarOrientationChange: (NSNotification *)notification{
    UIInterfaceOrientation interfaceOrientation = [[UIApplication sharedApplication] statusBarOrientation];
    switch (interfaceOrientation) {
        case UIInterfaceOrientationUnknown:
            NSLog(@"未知方向");
            break;
        case UIInterfaceOrientationPortrait:
            NSLog(@"界面直立");
            break;
        case UIInterfaceOrientationPortraitUpsideDown:
            NSLog(@"界面直立，上下颠倒");
            break;
        case UIInterfaceOrientationLandscapeLeft:
            NSLog(@"界面朝左");
            break;
        case UIInterfaceOrientationLandscapeRight:
            NSLog(@"界面朝右");
            break;
        default:
            break;
    }
}
//最后在dealloc中移除通知
- (void)dealloc{
    //...
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    [[UIDevice currentDevice]endGeneratingDeviceOrientationNotifications];
}


@end
