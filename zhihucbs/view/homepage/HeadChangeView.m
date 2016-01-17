//
//  HeadChangeView.m
//  zhihucbs
//
//  Created by 陈秉慎 on 1/16/16.
//  Copyright © 2016 陈秉慎. All rights reserved.
//

#import "HeadChangeView.h"

@implementation HeadChangeView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        [self addSubview:self.changeScrollView];
        [self addSubview:self.headPageControl];
        
        [self setUpConstraint];
    }
    return self;
}

- (void)setUpConstraint
{
    [self.changeScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}
#pragma mark - getters
- (UIScrollView *)changeScrollView
{
    if (_changeScrollView == nil) {
        _changeScrollView = [[UIScrollView alloc] init];
        _changeScrollView.delegate = self;
        _changeScrollView.contentSize = CGSizeMake(7*SVIEWWIDTH, SVIEWHEIGHT);
        [_changeScrollView setAutoresizesSubviews:YES];
        [_changeScrollView setPagingEnabled:YES];
        [_changeScrollView setShowsVerticalScrollIndicator:NO];
        [_changeScrollView setShowsHorizontalScrollIndicator:NO];
    }
    return _changeScrollView;
}

- (UIPageControl *)headPageControl
{
    if (_headPageControl == nil) {
        _headPageControl = [[UIPageControl alloc] initWithFrame:CGRectMake((SVIEWWIDTH - _headPageControl.bounds.size.width)/2, SVIEWHEIGHT - 10, _headPageControl.bounds.size.width, _headPageControl.bounds.size.height)];
        _headPageControl.currentPage = 0;
        _headPageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
        _headPageControl.pageIndicatorTintColor = [UIColor grayColor];
        [_headPageControl setNumberOfPages:7];
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

- (UIImageView *)headImgView
{
    if (_headImgView == nil) {
        _headImgView = [[UIImageView alloc] init];
    }
    return _headImgView;
}


@end
