//
//  TitleView.m
//  zhihucbs
//
//  Created by 陈秉慎 on 15/12/15.
//  Copyright (c) 2015年 陈秉慎. All rights reserved.
//

#import "TitleView.h"

@implementation TitleView
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.titleLb];
        [self setUpConstraint];
    }
    return self;
}

- (void)setUpConstraint
{
    [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

- (UILabel *)titleLb
{
    if (_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.textColor = [UIColor whiteColor];
    }
    return _titleLb;
}
@end
