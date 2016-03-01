//
//  BottomView.m
//  zhihucbs
//
//  Created by 陈秉慎 on 2/25/16.
//  Copyright © 2016 陈秉慎. All rights reserved.
//

#import "BottomView.h"

@implementation BottomView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.shadowPath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 400, 400)].CGPath;
        self.layer.shadowOffset = CGSizeMake(0, -0.5);
        self.layer.shadowOpacity = 0.5;

        [self addSubview:self.goBackBtn];
        [self addSubview:self.goodBtn];
        [self addSubview:self.goNextBtn];
        [self addSubview:self.shareBtn];
        [self addSubview:self.commentBtn];

        [self setUpConstraint];
    }
    return self;
}

- (void)setUpConstraint
{
    [self.goBackBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(40);
        make.left.equalTo(self).offset(SCREENWIDTH / 10 - 30);
    }];
    
    [self.goNextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(40);
        make.left.equalTo(self).offset(SCREENWIDTH * 3 / 10 - 30);
    }];
    
    [self.goodBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(40);
        make.left.equalTo(self).offset(SCREENWIDTH * 5 / 10 - 30);
    }];
    
    [self.shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(40);
        make.left.equalTo(self).offset(SCREENWIDTH * 7/ 10 - 30);
    }];
    
    [self.commentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(40);
        make.left.equalTo(self).offset(SCREENWIDTH * 9 / 10 - 30);
    }];
}

- (void)goBackBtnAction
{
    [self.delegate goBack];
}

- (void)goNextBtnAction
{
    [self.delegate goNext];
}

- (UIButton *)goBackBtn
{
    if (_goBackBtn == nil) {
        _goBackBtn = [[UIButton alloc] init];
        [_goBackBtn setBackgroundImage:[UIImage imageNamed:@"News_Navigation_Arrow"] forState:UIControlStateNormal];
        [_goBackBtn addTarget:self action:@selector(goBackBtnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _goBackBtn;
}

- (UIButton *)goNextBtn
{
    if (_goNextBtn == nil) {
        _goNextBtn = [[UIButton alloc] init];
        [_goNextBtn setBackgroundImage:[UIImage imageNamed:@"News_Navigation_Next"] forState:UIControlStateNormal];
        [_goNextBtn addTarget:self action:@selector(goNextBtnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _goNextBtn;
}

- (UIButton *)goodBtn
{
    if (_goodBtn == nil) {
        _goodBtn = [[UIButton alloc] init];
        [_goodBtn setBackgroundImage:[UIImage imageNamed:@"News_Navigation_Voted"] forState:UIControlStateNormal];
    }
    return _goodBtn;
}

- (UIButton *)shareBtn
{
    if (_shareBtn == nil) {
        _shareBtn = [[UIButton alloc] init];
        [_shareBtn setBackgroundImage:[UIImage imageNamed:@"News_Navigation_Share"] forState:UIControlStateNormal];
    }
    return _shareBtn;
}

- (UIButton *)commentBtn
{
    if (_commentBtn == nil) {
        _commentBtn = [[UIButton alloc] init];
        [_commentBtn setBackgroundImage:[UIImage imageNamed:@"News_Navigation_Comment"] forState:UIControlStateNormal];
    }
    return _commentBtn;
}
@end
