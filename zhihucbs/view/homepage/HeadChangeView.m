//
//  HeadChangeView.m
//  zhihucbs
//
//  Created by 陈秉慎 on 1/16/16.
//  Copyright © 2016 陈秉慎. All rights reserved.
//

#import "HeadChangeView.h"
#define COUNT self.imageArray.count

@implementation HeadChangeView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        
    }
    return self;
}

- (void)setUpConstraint
{
    [self.changeScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}
#pragma mark - delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.x == 0) {
        self.changeScrollView.contentOffset = CGPointMake(COUNT * SVIEWWIDTH, 0);
        self.headPageControl.currentPage = (COUNT - 1);
    }else if (scrollView.contentOffset.x == (COUNT + 1) * SVIEWWIDTH){
        self.changeScrollView.contentOffset = CGPointMake(SVIEWWIDTH, 0);
        self.headPageControl.currentPage = 0;
    }else{
        int pagenum = (round(scrollView.contentOffset.x/self.headImgView.frame.size.width) - 1);
        [self.headPageControl setCurrentPage:pagenum];
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self removeNSTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self addNSTimer];
}
#pragma mark - 定时器
- (void)addNSTimer
{
    if (self.timer == nil) {
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
        //添加到runloop中
        [[NSRunLoop mainRunLoop]addTimer:timer forMode:NSRunLoopCommonModes];
        self.timer = timer;
    }
}

- (void)removeNSTimer
{
    [self.timer invalidate];
    self.timer =nil;
}

- (void)nextPage
{
    if (self.changeScrollView.contentOffset.x == ((COUNT) * self.headImgView.frame.size.width)) {
        [self.changeScrollView scrollRectToVisible:CGRectMake(SVIEWWIDTH, 0, SVIEWWIDTH, SVIEWHEIGHT) animated:YES];
    }else{
        [self.changeScrollView scrollRectToVisible:CGRectMake(self.changeScrollView.contentOffset.x + self.headImgView.frame.size.width, 0, SVIEWWIDTH, SVIEWHEIGHT) animated:YES];
    }
}
#pragma mark - API
- (void)setDataArray:(NSArray *)array
{
    if (array.count != 0) {
        [self.imageArray removeAllObjects];
        [self.titleArray removeAllObjects];
        
        for (int i = 0; i < array.count; i++) {
            HomePageNewsTopModel *model = [array objectAtIndex:i];
            [self.imageArray addObject:model.imageUrl];
            [self.titleArray addObject:model.titleStr];
        }
        
        [self addSubview:self.changeScrollView];
        [self addSubview:self.headPageControl];
        [self addNSTimer];
        [self setUpConstraint];
    }
}
#pragma mark - getters
- (UIScrollView *)changeScrollView
{
    if (_changeScrollView == nil) {
        _changeScrollView = [[UIScrollView alloc] init];
        _changeScrollView.delegate = self;
        _changeScrollView.contentSize = CGSizeMake((COUNT + 2) * SVIEWWIDTH, SVIEWHEIGHT);
        [_changeScrollView setAutoresizesSubviews:YES];
        [_changeScrollView setPagingEnabled:YES];
        [_changeScrollView setShowsVerticalScrollIndicator:NO];
        [_changeScrollView setShowsHorizontalScrollIndicator:NO];
        _changeScrollView.contentOffset = CGPointMake(SVIEWWIDTH, 0);
    }
    return _changeScrollView;
}

- (UIPageControl *)headPageControl
{
    if (_headPageControl == nil) {
        _headPageControl = [[UIPageControl alloc] initWithFrame:CGRectMake((SVIEWWIDTH - _headPageControl.bounds.size.width)/2, SVIEWHEIGHT - 10, _headPageControl.bounds.size.width, _headPageControl.bounds.size.height)];
        _headPageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
        _headPageControl.pageIndicatorTintColor = [UIColor grayColor];
        [_headPageControl setNumberOfPages:COUNT];
    }
    return _headPageControl;
}

- (NSMutableArray *)imageArray
{
    if (_imageArray == nil) {
        _imageArray = [[NSMutableArray alloc] init];
    }
    return _imageArray;
}

- (NSMutableArray *)titleArray
{
    if (_titleArray == nil) {
        _titleArray = [[NSMutableArray alloc] init];
    }
    return _titleArray;
}

- (HeadImagerView *)headImgView
{
    if (_headImgView == nil) {
        //第一个放最后一个图片
        _headImgView = [[HeadImagerView alloc] init];
        _headImgView.frame = CGRectMake(0, 0, SVIEWWIDTH, SVIEWHEIGHT);
        [_headImgView sd_setImageWithURL:[self.imageArray objectAtIndex:(COUNT - 1)]];
        [self.changeScrollView addSubview:_headImgView];
        //最后一个放第一张图片
        _headImgView = [[HeadImagerView alloc] init];
        _headImgView.frame = CGRectMake(SVIEWWIDTH * (COUNT + 1), 0, SVIEWWIDTH, SVIEWHEIGHT);
        [_headImgView sd_setImageWithURL:[self.imageArray objectAtIndex:0]];
        [self.changeScrollView addSubview:_headImgView];
        
        for (int i = 0; i < COUNT; i++) {
            _headImgView = [[HeadImagerView alloc] init];
            _headImgView.frame = CGRectMake(SVIEWWIDTH * (i + 1), 0, SVIEWWIDTH, SVIEWHEIGHT);
            [_headImgView sd_setImageWithURL:[self.imageArray objectAtIndex:i]];
            _headImgView.titleLb.text = [self.titleArray objectAtIndex:i];
            [self.changeScrollView addSubview:_headImgView];
        }
    }
    return _headImgView;
}

@end
