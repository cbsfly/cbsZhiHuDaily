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
        make.top.equalTo(self.backView).offset(10);
        make.right.equalTo(self.backView).offset(-10);
        make.bottom.equalTo(self.backView).offset(-10);
        make.width.mas_equalTo(self.newsImgView.mas_height);
    }];
    
    [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.newsImgView).offset(10);
        make.bottom.equalTo(self.newsImgView).offset(-10);
        make.right.equalTo(self.newsImgView.mas_left).offset(-10);
        make.left.equalTo(self.backView.mas_left).offset(10);
    }];
}
#pragma mark - delegate

#pragma mark - event response

#pragma mark - private methods
- (void)setData:(HomePageNewsDetModel *)model
{
    self.dataModel = model;
    if (!self.dataModel) {
        return;
    }
    self.titleLb.text = self.dataModel.titleStr;
    [self.newsImgView sd_setImageWithURL:[[NSURL alloc] initWithString:[self.dataModel.imagesArray objectAtIndex:0]]];
}
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
