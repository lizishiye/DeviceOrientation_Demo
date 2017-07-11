//
//  ViewController.m
//  DeviceOrientation_Demo
//
//  Created by admin on 17/7/11.
//  Copyright © 2017年 lizihaha. All rights reserved.
//

#import "ViewController.h"
#import "DeviceOrientationViewController.h"
#import "InterfaceOrientationViewController.h"
#import "InterfaceMaskViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}


- (IBAction)deviceOrientationBtnClicked:(UIButton *)sender {
    DeviceOrientationViewController * vc = [[DeviceOrientationViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}
- (IBAction)interfaceOrientationBtnClicked:(UIButton *)sender {
    InterfaceOrientationViewController * vc = [[InterfaceOrientationViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];

}
- (IBAction)interfaceOrientationMaskBtnClicked:(UIButton *)sender {
    InterfaceMaskViewController * vc = [[InterfaceMaskViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
