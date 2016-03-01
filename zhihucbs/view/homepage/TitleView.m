//
//  TitleView.m
//  zhihucbs
//
//  Created by 陈秉慎 on 15/12/15.
//  Copyright (c) 2015年 陈秉慎. All rights reserved.
//

#import "TitleView.h"

@implementation TitleView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.titleLb];
        [self addSubview:self.leftBtn];
        [self addSubview:self.ActView];
        
        self.backgroundColor = COLOR_TITLEBLUE;
        [self setUpConstraint];
    }
    return self;
}

- (void)setUpConstraint
{
    [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self).offset(10);
    }];
    
    [self.leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.titleLb);
        make.left.equalTo(self).offset(20);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(20);
    }];
    
    [self.ActView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.titleLb);
        make.right.equalTo(self.titleLb.mas_left).offset(-5);
        make.height.mas_equalTo(5);
        make.width.mas_equalTo(5);
    }];
}

- (void)clickBtn
{
    [self.delegate leftViewAppear];
}

- (ZHLabel *)titleLb
{
    if (_titleLb == nil) {
        _titleLb = [[ZHLabel alloc] init];
        _titleLb.textColor = [UIColor whiteColor];
        [_titleLb setFont:[UIFont fontWithName:@"Helvetica-Bold" size:15]];
    }
    return _titleLb;
}

- (UIButton *)leftBtn
{
    if (_leftBtn == nil) {
        _leftBtn = [[UIButton alloc] init];
        [_leftBtn setBackgroundImage:[UIImage imageNamed:@"Home_Icon"] forState:UIControlStateNormal];
        [_leftBtn addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftBtn;
}

- (UIActivityIndicatorView *)ActView
{
    if (_ActView == nil) {
        _ActView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    }
    return _ActView;
}
@end
