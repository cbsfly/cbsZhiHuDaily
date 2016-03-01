//
//  LeftViewHeadView.m
//  zhihucbs
//
//  Created by 陈秉慎 on 2/26/16.
//  Copyright © 2016 陈秉慎. All rights reserved.
//

#import "LeftViewHeadView.h"

@implementation LeftViewHeadView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = COLOR_LEFTVIEWBLACK;
        [self addSubview:self.headImgBtn];
        [self addSubview:self.userLb];
        [self addSubview:self.collectBtn];
        [self addSubview:self.messageBtn];
        [self addSubview:self.setBtn];
        [self addSubview:self.collectLb];
        [self addSubview:self.messageLb];
        [self addSubview:self.setLb];

        [self setUpConstraint];

    }
    return self;
}

- (void)setUpConstraint
{
    [self.headImgBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(15);
        make.height.width.mas_equalTo(30);
        make.top.equalTo(self).offset(20);
    }];
    
    [self.userLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.headImgBtn);
        make.left.equalTo(self.headImgBtn.mas_right).offset(10);
    }];
    
    [self.collectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImgBtn);
        make.bottom.equalTo(self).offset(-20);
        make.height.width.mas_equalTo(20);
    }];
    
    [self.collectLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImgBtn);
        make.bottom.equalTo(self).offset(-5);
    }];
    
    [self.messageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.top.equalTo(self.collectBtn);
        make.centerX.equalTo(self);
    }];
    
    [self.messageLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.messageBtn);
        make.bottom.equalTo(self.collectLb);
    }];
    
    [self.setBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.top.equalTo(self.collectBtn);
        make.right.equalTo(self).offset(-15);
    }];
    
    [self.setLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.setBtn);
        make.bottom.equalTo(self.collectLb);
    }];
}




- (UIButton *)headImgBtn
{
    if (_headImgBtn == nil) {
        _headImgBtn = [[UIButton alloc] init];
        [_headImgBtn setBackgroundImage:[UIImage imageNamed:@"Menu_Avatar"] forState:UIControlStateNormal];
        _headImgBtn.layer.masksToBounds = YES;
        _headImgBtn.layer.cornerRadius = _headImgBtn.layer.bounds.size.width / 2;
    }
    return _headImgBtn;
}

- (UIButton *)collectBtn
{
    if (_collectBtn == nil) {
        _collectBtn = [[UIButton alloc] init];
        [_collectBtn setBackgroundImage:[UIImage imageNamed:@"Menu_Icon_Collect"] forState:UIControlStateNormal];
    }
    return _collectBtn;
}

- (UIButton *)messageBtn
{
    if (_messageBtn == nil) {
        _messageBtn = [[UIButton alloc] init];
        [_messageBtn setBackgroundImage:[UIImage imageNamed:@"Menu_Icon_Message"] forState:UIControlStateNormal];
    }
    return _messageBtn;
}

- (UIButton *)setBtn
{
    if (_setBtn == nil) {
        _setBtn = [[UIButton alloc] init];
        [_setBtn setBackgroundImage:[UIImage imageNamed:@"Menu_Icon_Setting"] forState:UIControlStateNormal];
    }
    return _setBtn;
}

- (ZHLabel *)userLb
{
    if (_userLb == nil) {
        _userLb = [[ZHLabel alloc] init];
        _userLb.text = @"请登录";
        _userLb.textColor = COLOR_LEFTTEXTGRAY;
        _userLb.font = [UIFont systemFontOfSize:13];
    }
    return _userLb;
}

- (ZHLabel *)setLb
{
    if (_setLb == nil) {
        _setLb = [[ZHLabel alloc] init];
        _setLb.textColor = COLOR_LEFTTEXTGRAY;
        _setLb.font = [UIFont systemFontOfSize:10];
        _setLb.text = @"设置";
    }
    return _setLb;
}

- (ZHLabel *)collectLb
{
    if (_collectLb == nil) {
        _collectLb = [[ZHLabel alloc] init];
        _collectLb.textColor = COLOR_LEFTTEXTGRAY;
        _collectLb.font = [UIFont systemFontOfSize:10];
        _collectLb.text = @"收藏";
    }
    return _collectLb;
}

- (ZHLabel *)messageLb
{
    if (_messageLb == nil) {
        _messageLb = [[ZHLabel alloc] init];
        _messageLb.textColor = COLOR_LEFTTEXTGRAY;
        _messageLb.font = [UIFont systemFontOfSize:10];
        _messageLb.text = @"消息";
    }
    return _messageLb;
}
@end
