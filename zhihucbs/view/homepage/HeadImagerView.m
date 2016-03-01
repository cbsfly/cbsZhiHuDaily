//
//  HeadImagerView.m
//  zhihucbs
//
//  Created by 陈秉慎 on 1/18/16.
//  Copyright © 2016 陈秉慎. All rights reserved.
//

#import "HeadImagerView.h"

@implementation HeadImagerView
- (instancetype)initWithFrame:(CGRect)frame
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
        make.bottom.equalTo(self).offset(-20);
        make.left.equalTo(self).offset(20);
        make.right.equalTo(self).offset(-20);
    }];
}

- (OutlineLabel *)titleLb
{
    if (_titleLb == nil) {
        _titleLb = [[OutlineLabel alloc] init];
        _titleLb.textColor = [UIColor whiteColor];
        [_titleLb setFont:[UIFont fontWithName:@"Helvetica-Bold" size:17]];
        _titleLb.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLb;
}
@end
