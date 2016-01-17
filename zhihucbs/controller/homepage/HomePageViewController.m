//
//  HomePageViewController.m
//  zhihucbs
//
//  Created by 陈秉慎 on 1/4/16.
//  Copyright (c) 2016 陈秉慎. All rights reserved.
//

#import "HomePageViewController.h"
#import "HomePageTableViewCell.h"
#import "HeadChangeView.h"

@interface HomePageViewController ()
@property (nonatomic, strong) HomePageNewsModel *homePageModel;
@property (nonatomic, strong) NSMutableArray *homePageArray;
@property (nonatomic, strong) HeadChangeView *headView;
@end

@implementation HomePageViewController
static NSString *cellIdentifier = @"UITableViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self netWork];
    
    
    
    [self.view addSubview:self.tableView];
    [self setUpConstraint];

}

- (void)netWork
{
    [ZHGetData getHomePageNewsData:^(id model, NSError *error) {
        self.homePageModel = model;
        if ([self.homePageModel.storiesArray count] != 0) {
            [self.homePageArray removeAllObjects];
            [self.homePageArray addObjectsFromArray:self.homePageModel.storiesArray];
            [self.tableView reloadData];
        }
    }];
}

- (void)setUpConstraint
{
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}
#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.homePageArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomePageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    [cell setData:[self.homePageArray objectAtIndex:indexPath.row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

#pragma mark - getters
- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, VIEWWIDTH, VIEWHEIGHT)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor whiteColor];
        [_tableView registerClass:[HomePageTableViewCell class] forCellReuseIdentifier:cellIdentifier];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView setTableHeaderView:self.headView];
    }
    return _tableView;
}

- (NSMutableArray *)homePageArray
{
    if (_homePageArray == nil) {
        _homePageArray = [[NSMutableArray alloc] init];
    }
    return _homePageArray;
}

- (HeadChangeView *)headView
{
    if (_headView == nil) {
        _headView = [[HeadChangeView alloc] initWithFrame:CGRectMake(0, 0, VIEWWIDTH, VIEWHEIGHT/3)];
    }
    return _headView;
}
@end
