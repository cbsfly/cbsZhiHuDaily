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
#import "SectionView.h"
#import "LeftView.h"
#import "HomePageView.h"
#import "TitleView.h"
#import "NewsPageViewController.h"

@interface HomePageViewController ()<TitleViewDelegate, UITableViewDelegate, UITableViewDataSource, UIViewControllerTransitioningDelegate, HomePageViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) HomePageNewsModel *homePageModel;
@property (nonatomic, strong) NSMutableArray *homePageArray;
@property (nonatomic, strong) HeadChangeView *headView;
@property (nonatomic, strong) NSMutableArray *dateArray;
@property (nonatomic, strong) TitleView *titleView;

@property (nonatomic, strong) PresentAnimation *presentAnimation;
@property (nonatomic, strong) DismissAnimation *dismissAnimation;

@property (nonatomic, strong) LeftView *leftView;
@property (nonatomic, strong) HomePageView *homePageView;
@end

@implementation HomePageViewController
static NSString *cellIdentifier = @"UITableViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self netWork];
    self.titleView.titleLb.text = @"今日热闻";
    
    [self.view addSubview:self.homePageView];
    
    [self.homePageView addSubview:self.tableView];
    [self.homePageView addSubview:self.leftView];
    [self.homePageView addSubview:self.titleView];
    

    [self refresh];
    [self setUpConstraint];
    
    


}

- (void)netWork
{
    [ZHGetData getHomePageNewsData:^(id model, NSError *error) {
        self.homePageModel = model;
        [self.dateArray removeAllObjects];
        [self.dateArray addObject:self.homePageModel.date];
        if ([self.homePageModel.storiesArray count] != 0) {
            [self.homePageArray removeAllObjects];
            [self.homePageArray addObject:self.homePageModel.storiesArray];
            [self.tableView reloadData];
        }
        if ([self.homePageModel.topNewsArray count] != 0) {
            [self.headView setDataArray:self.homePageModel.topNewsArray];
        }
        if (self.titleView.ActView.isAnimating) {
            [self.titleView.ActView stopAnimating];
        }
    }];
}

- (void)loadMoreData
{
    [ZHGetData getHomePageMoreData:^(id model, NSError *error) {
        self.homePageModel = model;
        [self.dateArray addObject:self.homePageModel.date];
        if ([self.homePageModel.storiesArray count] != 0) {
            [self.homePageArray addObject:self.homePageModel.storiesArray];
            [self.tableView reloadData];
        }
    } WithDate:self.homePageModel.date];
}

- (void)setUpConstraint
{
    [self.homePageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.bottom.equalTo(self.view);
        make.width.mas_equalTo(VIEWWIDTH + LEFTVIEWWIDTH);
        make.right.equalTo(self.view);
    }];
    
    [self.leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.bottom.equalTo(self.view);
        make.width.mas_equalTo(LEFTVIEWWIDTH);
        make.left.equalTo(self.homePageView);
    }];

    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];    
}

- (void)refresh
{
    [[[RACObserve(self.tableView, contentOffset) map:^id(id value) {
        self.titleView.backgroundColor = [UIColor colorWithRed:48/255.0 green:197/255.0 blue:255/255.0 alpha:(self.tableView.contentOffset.y / 120)];
        
        if (self.tableView.contentOffset.y < -50) {
            return @"1";
        }
        if (self.tableView.contentOffset.y > self.tableView.contentSize.height - VIEWHEIGHT * 1.5 && self.tableView.contentSize.height - VIEWHEIGHT * 1.5 > 0) {
            return @"2";
        }else{
            return @"0";
        }
    }] distinctUntilChanged] subscribeNext:^(id x) {
        debugLog(@"%@", x);
        if ([x integerValue] == 1) {
            
            [self.titleView.ActView startAnimating];
            [self netWork];
            
        }else if ([x integerValue] == 2){
            [self loadMoreData];
        }
    }];
}
#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.dateArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self.homePageArray objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomePageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    [cell setData:[[self.homePageArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomePageNewsDetModel *newsPageModel = [[self.homePageArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    NewsPageViewController *newsPageVC = [[NewsPageViewController alloc] init];
    newsPageVC.idStr = [NSString stringWithFormat:@"%@", newsPageModel.newsId];

    newsPageVC.transitioningDelegate = self;
    [self presentViewController:newsPageVC animated:YES completion:nil];
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    SectionView *sectionView = [[SectionView alloc] init];
    if (section == 0) {
        sectionView.dateLb.text = @"今日热闻";
        self.titleView.titleLb.text = @"今日热闻";
    }else{
        [sectionView setDate:[self.dateArray objectAtIndex:section]];
        self.titleView.titleLb.text = sectionView.dateLb.text;
    }
    return sectionView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 34;
    }else{
        return 0;
    }
}
#pragma mark - UIViewControllerTransitioningDelegate
- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return self.presentAnimation;
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return self.dismissAnimation;
}
#pragma mark - private methods
- (void)leftViewAppear
{
    [UIView animateWithDuration:0.2 animations:^(void){
        if (self.homePageView.center.x == (SCREENWIDTH - LEFTVIEWWIDTH) / 2) {
            self.homePageView.center = CGPointMake((SCREENWIDTH + LEFTVIEWWIDTH) / 2, SCREENHEIGHT / 2);
        }else if (self.homePageView.center.x == (SCREENWIDTH + LEFTVIEWWIDTH) / 2) {
            self.homePageView.center = CGPointMake((SCREENWIDTH - LEFTVIEWWIDTH) / 2, SCREENHEIGHT / 2);
        }
    }];
    [self leftViewAppeared];
}

- (void)leftViewAppeared
{
    if (self.homePageView.center.x != (self.homePageView.centerX)) {
        self.tableView.userInteractionEnabled = NO;
        self.headView.userInteractionEnabled = NO;
    }else{
        self.tableView.userInteractionEnabled = YES;
        self.headView.userInteractionEnabled = YES;
    }
}
#pragma mark - getters
- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, VIEWWIDTH, VIEWHEIGHT) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[HomePageTableViewCell class] forCellReuseIdentifier:cellIdentifier];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView setTableHeaderView:self.headView];
        [_tableView setShowsVerticalScrollIndicator:NO];
        [_tableView setShowsHorizontalScrollIndicator:NO];
        _tableView.tableFooterView = [[UIView alloc] init];
        _tableView.backgroundColor = COLOR_BACKGRAY;
        
    }
    return _tableView;
}

- (LeftView *)leftView
{
    if (_leftView == nil) {
        _leftView = [[LeftView alloc] init];
    }
    return _leftView;
}

- (HomePageView *)homePageView
{
    if (_homePageView == nil) {
        _homePageView = [[HomePageView alloc] init];
        _homePageView.delegate = self;
    }
    return _homePageView;
}

- (NSMutableArray *)homePageArray
{
    if (_homePageArray == nil) {
        _homePageArray = [[NSMutableArray alloc] init];
    }
    return _homePageArray;
}

- (NSMutableArray *)dateArray
{
    if (_dateArray == nil) {
        _dateArray = [[NSMutableArray alloc] init];
    }
    return _dateArray;
}

- (HeadChangeView *)headView
{
    if (_headView == nil) {
        _headView = [[HeadChangeView alloc] initWithFrame:CGRectMake(0, 0, VIEWWIDTH, HEADVIEWWIDTH)];
    }
    return _headView;
}

- (TitleView *)titleView
{
    if (_titleView == nil) {
        _titleView = [[TitleView alloc] initWithFrame:CGRectMake(LEFTVIEWWIDTH, 0, VIEWWIDTH, TITLEVIEWHEIGHT)];
        _titleView.delegate = self;
    }
    return _titleView;
}

- (PresentAnimation *)presentAnimation
{
    if (_presentAnimation == nil) {
        _presentAnimation = [[PresentAnimation alloc] init];
    }
    return _presentAnimation;
}

- (DismissAnimation *)dismissAnimation
{
    if (_dismissAnimation == nil) {
        _dismissAnimation = [[DismissAnimation alloc] init];
    }
    return _dismissAnimation;
}
@end
