//
//  ZHBaseViewController.m
//  zhihucbs
//
//  Created by 陈秉慎 on 15/12/14.
//  Copyright (c) 2015年 陈秉慎. All rights reserved.
//

#import "ZHBaseViewController.h"

@interface ZHBaseViewController ()

@end

@implementation ZHBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = COLOR_BACKGRAY;

    UIBarButtonItem *test = [[UIBarButtonItem alloc] initWithCustomView:self.titleView];
    NSArray *btnArray = [[NSArray alloc] initWithObjects:self.leftBtn, test, nil];
    [self.navigationItem setLeftBarButtonItems:btnArray];
    
}

#pragma mark - private methods
- (void)anothertheme
{
    NSLog(@"123");
}
#pragma mark - getters
- (UIBarButtonItem *)leftBtn
{
    if (_leftBtn == nil) {
        _leftBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"pic_menu"] style:UIBarButtonItemStylePlain target:self action:@selector(anothertheme)];
    }
    return _leftBtn;
}

- (TitleView *)titleView
{
    if (_titleView == nil) {
        _titleView  = [[TitleView alloc] initWithFrame:CGRectMake(10, 10, 120, 20)];
        _titleView.titleLb.text = @"我的是滴是滴";
    }
    return _titleView;
}
@end
