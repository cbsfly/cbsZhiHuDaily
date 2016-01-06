//
//  HomePageTableViewCell.m
//  zhihucbs
//
//  Created by 陈秉慎 on 1/4/16.
//  Copyright (c) 2016 陈秉慎. All rights reserved.
//

#import "HomePageTableViewCell.h"

@implementation HomePageTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = COLOR_BACKGRAY;
        [self addSubview:self.backView];
        [self.backView addSubview:self.newsImgView];
        [self.backView addSubview:self.titleLb];
        [self.backView addSubview:self.summaryLb];
        [self.backView addSubview:self.functionBtn];
        
        [self setUpConstraint];
    }
    return self;
}

- (void)setUpConstraint
{
    [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self).offset(6);
        make.bottom.right.equalTo(self).offset(-6);
    }];
    
    [self.newsImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.backView).offset(10);
        make.bottom.equalTo(self.backView).offset(-10);
        make.width.mas_equalTo(self.newsImgView.mas_height);
    }];
    
    [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.newsImgView);
        make.left.equalTo(self.newsImgView.mas_right).offset(10);
        make.right.equalTo(self.functionBtn.mas_left).offset(-10);
    }];
    
    [self.summaryLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLb.mas_bottom).offset(10);
        make.left.right.equalTo(self.titleLb);
        make.bottom.equalTo(self.backView).offset(-10);
    }];
    
    [self.functionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.backView).offset(-10);
        make.top.equalTo(self.backView).offset(10);
        make.height.width.mas_equalTo(20);
    }];
}
#pragma mark - delegate

#pragma mark - event response

#pragma mark - private methods

#pragma mark - getters
- (UIImageView *)newsImgView
{
    if (_newsImgView == nil) {
        _newsImgView = [[UIImageView alloc] init];
        _newsImgView.backgroundColor = [UIColor grayColor];
    }
    return _newsImgView;
}

- (ZHLabel *)titleLb
{
    if (_titleLb == nil) {
        _titleLb = [[ZHLabel alloc] init];
        [_titleLb setFont:[UIFont fontWithName:@"Helvetica-Bold" size:17]];
    }
    return _titleLb;
}

- (ZHLabel *)summaryLb
{
    if (_summaryLb == nil) {
        _summaryLb = [[ZHLabel alloc] init];
        _summaryLb.font = [UIFont systemFontOfSize:13];
    }
    return _summaryLb;
}

- (UIButton *)functionBtn
{
    if (_functionBtn == nil) {
        _functionBtn = [[UIButton alloc] init];
        [_functionBtn setImage:[UIImage imageNamed:@"ic_home"] forState:UIControlStateNormal];
    }
    return _functionBtn;
}

- (UIView *)backView
{
    if (_backView == nil) {
        _backView = [[UIView alloc] init];
        _backView.backgroundColor = COLOR_BACKWHITE;
        _backView.layer.cornerRadius = 5;
        //阴影
        _backView.layer.masksToBounds = NO;
        _backView.layer.shadowOffset = CGSizeMake(1, 2);
        _backView.layer.shadowRadius = 1;
        _backView.layer.shadowOpacity = 0.3;
    }
    return _backView;
}
@end
