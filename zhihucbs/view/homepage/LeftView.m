//
//  LeftView.m
//  zhihucbs
//
//  Created by 陈秉慎 on 2/23/16.
//  Copyright © 2016 陈秉慎. All rights reserved.
//

#import "LeftView.h"

@implementation LeftView
static NSString *cellIdentifier = @"UITableViewCell";

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = COLOR_LEFTVIEWBLACK;
        [self addSubview:self.titleTableView];
    
        [self netWork];
    }
    return self;
}

- (void)netWork
{
    [ZHGetData getThemeList:^(id model, NSError *error) {
        [self.themeArray removeAllObjects];
        [self.themeArray addObjectsFromArray:model];
        [self.titleTableView reloadData];
    }];
}
#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.themeArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LeftViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    self.dataModel = [self.themeArray objectAtIndex:indexPath.row];
    cell.themeLb.text = self.dataModel.nameStr;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return self.footView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 50;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if ([scrollView isEqual:_titleTableView]) {
        if (scrollView.contentOffset.y <= 0 ) {
            [scrollView setContentOffset:CGPointMake(0, 0)];
        }
    }
}
#pragma mark - getters
- (UITableView *)titleTableView
{
    if (_titleTableView == nil) {
        _titleTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, LEFTVIEWWIDTH, SCREENHEIGHT)];
        _titleTableView.delegate = self;
        _titleTableView.dataSource = self;
        _titleTableView.backgroundColor = [UIColor clearColor];
        [_titleTableView registerClass:[LeftViewTableViewCell class] forCellReuseIdentifier:cellIdentifier];
        [_titleTableView setTableHeaderView:self.headView];
        [_titleTableView setShowsVerticalScrollIndicator:NO];
        [_titleTableView setShowsHorizontalScrollIndicator:NO];
        _titleTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _titleTableView;
}

- (LeftViewHeadView *)headView
{
    if (_headView == nil) {
        _headView = [[LeftViewHeadView alloc] initWithFrame:CGRectMake(0, 0, SVIEWWIDTH, 100)];
    }
    return _headView;
}

- (LeftFootView *)footView
{
    if (_footView == nil) {
        _footView = [[LeftFootView alloc] init];
    }
    return _footView;
}

- (NSMutableArray *)themeArray
{
    if (_themeArray == nil) {
        _themeArray = [[NSMutableArray alloc] init];
    }
    return _themeArray;
}
@end
