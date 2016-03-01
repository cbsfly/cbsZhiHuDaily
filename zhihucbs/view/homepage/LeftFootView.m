//
//  LeftFootView.m
//  zhihucbs
//
//  Created by 陈秉慎 on 2/26/16.
//  Copyright © 2016 陈秉慎. All rights reserved.
//

#import "LeftFootView.h"

@implementation LeftFootView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = COLOR_LEFTVIEWBLACK;
        [self addSubview:self.colorLb];
        [self addSubview:self.colorBtn];
        [self addSubview:self.downloadLb];
        [self addSubview:self.downloadBtn];

        
        [self setUpConstraint];
        
    }
    return self;
}

- (void)setUpConstraint
{
    [self.downloadBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.height.width.mas_equalTo(20);
        make.left.equalTo(self).offset(15);
    }];
    
    [self.downloadLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self.downloadBtn.mas_right).offset(10);
    }];
    
    [self.colorBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.height.width.mas_equalTo(20);
        make.right.equalTo(self).offset(-50);
    }];
    
    [self.colorLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self.colorBtn.mas_right).offset(10);
    }];
}

- (UIButton *)downloadBtn
{
    if (_downloadBtn == nil) {
        _downloadBtn = [[UIButton alloc] init];
        [_downloadBtn setBackgroundImage:[UIImage imageNamed:@"Menu_Download"] forState:UIControlStateNormal];
    }
    return _downloadBtn;
}

- (ZHLabel *)downloadLb
{
    if (_downloadLb == nil) {
        _downloadLb = [[ZHLabel alloc] init];
        _downloadLb.text = @"完成";
        _downloadLb.textColor = COLOR_LEFTTEXTGRAY;
        _downloadLb.font = [UIFont systemFontOfSize:12];
    }
    return _downloadLb;
}

- (UIButton *)colorBtn
{
    if (_colorBtn == nil) {
        _colorBtn = [[UIButton alloc] init];
        [_colorBtn setBackgroundImage:[UIImage imageNamed:@"Menu_Dark"] forState:UIControlStateNormal];
    }
    return _colorBtn;
}

- (ZHLabel *)colorLb
{
    if (_colorLb == nil) {
        _colorLb = [[ZHLabel alloc] init];
        _colorLb.text = @"夜间";
        _colorLb.textColor = COLOR_LEFTTEXTGRAY;
        _colorLb.font = [UIFont systemFontOfSize:12];
    }
    return _colorLb;
}
@end
