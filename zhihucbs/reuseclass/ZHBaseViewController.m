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
- (void)anotherTheme
{

}
#pragma mark - getters
- (UIBarButtonItem *)leftBtn
{
    if (_leftBtn == nil) {
        _leftBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Home_Icon"] style:UIBarButtonItemStylePlain target:self action:@selector(anotherTheme)];
    }
    return _leftBtn;
}

- (TitleView *)titleView
{
    if (_titleView == nil) {
        _titleView  = [[TitleView alloc] initWithFrame:CGRectMake(10, 10, 200, 20)];
    }
    return _titleView;
}
@end
