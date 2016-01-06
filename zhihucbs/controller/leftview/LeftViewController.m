//
//  LeftViewController.m
//  zhihucbs
//
//  Created by 陈秉慎 on 15/12/16.
//  Copyright (c) 2015年 陈秉慎. All rights reserved.
//

#import "LeftViewController.h"

@interface LeftViewController ()

@end

@implementation LeftViewController
static NSString *cellIdentifier = @"UITableViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = COLOR_TITLEBLUE;
    
    [self.view addSubview:self.titleTableView];
    
}
#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    [self configureCell:cell forRowAtIndexPath:indexPath];
    return cell;
}

- (void)configureCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.textLabel.text = @"123";
}

#pragma mark - getters
- (UITableView *)titleTableView
{
    if (_titleTableView == nil) {
        _titleTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, VIEWWIDTH, VIEWHEIGHT)];
        _titleTableView.delegate = self;
        _titleTableView.dataSource = self;
        _titleTableView.backgroundColor = [UIColor whiteColor];
        [_titleTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
    }
    return _titleTableView;
}
@end
