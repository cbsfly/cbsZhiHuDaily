//
//  ZHNavigationViewController.m
//  zhihucbs
//
//  Created by 陈秉慎 on 15/12/14.
//  Copyright (c) 2015年 陈秉慎. All rights reserved.
//

#import "ZHNavigationViewController.h"

@interface ZHNavigationViewController ()

@end

@implementation ZHNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationBar setBarTintColor:COLOR_TITLEBLUE];
    [self.navigationBar setTintColor:[UIColor whiteColor]];//设置navigationbar上左右按钮字体颜色
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];//title颜色
    [self.navigationBar setTranslucent:NO];//navigationbar颜色透明
}



@end
