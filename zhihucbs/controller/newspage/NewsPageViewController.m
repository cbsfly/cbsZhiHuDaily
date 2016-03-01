//
//  NewsPageViewController.m
//  zhihucbs
//
//  Created by 陈秉慎 on 2/25/16.
//  Copyright © 2016 陈秉慎. All rights reserved.
//

#import "NewsPageViewController.h"

@interface NewsPageViewController ()

@end

@implementation NewsPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = COLOR_BACKWHITE;
    [self.view addSubview:self.backWebView];
    [self.backWebView.scrollView addSubview:self.newsImgView];
    [self.view addSubview:self.bottomView];
    
    [self netWork];
    [self setUpConstraint];
}

- (void)setUpConstraint
{
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self.view);
        make.height.mas_equalTo(BOTTOMVIEWHEIGHT);
    }];
}

- (void)netWork
{
    [ZHGetData getNewsDetData:^(id model, NSError *error) {
        self.dataModel = model;
        NSString *html = [NSString stringWithFormat:@"<html><head><link rel=\"stylesheet\" href=%@></head><body>%@</body></html>", [self.dataModel.cssArray objectAtIndex:0], self.dataModel.bodyHtmlStr];
        [self.backWebView loadHTMLString:html baseURL:nil];
        [self.newsImgView sd_setImageWithURL:self.dataModel.imageUrl];
        self.newsImgView.titleLb.text = self.dataModel.titleStr;
    } WithId:self.idStr];
}
#pragma mark - delegate

#pragma mark - event response
- (void)goBack
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)goNext
{
    
}
#pragma mark - getters
- (UIWebView *)backWebView
{
    if (_backWebView == nil) {
        _backWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, VIEWWIDTH, VIEWHEIGHT - BOTTOMVIEWHEIGHT)];
    }
    return _backWebView;
}

- (HeadImagerView *)newsImgView
{
    if (_newsImgView == nil) {
        _newsImgView = [[HeadImagerView alloc] initWithFrame:CGRectMake(0, 0, VIEWWIDTH,  HEADVIEWWIDTH)];
    }
    return _newsImgView;
}

- (BottomView *)bottomView
{
    if (_bottomView == nil) {
        _bottomView = [[BottomView alloc] init];
        _bottomView.delegate = self;
    }
    return _bottomView;
}
@end
