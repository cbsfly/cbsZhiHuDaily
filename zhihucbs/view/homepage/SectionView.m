//
//  SectionView.m
//  zhihucbs
//
//  Created by 陈秉慎 on 1/19/16.
//  Copyright © 2016 陈秉慎. All rights reserved.
//

#import "SectionView.h"

@implementation SectionView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.dateLb];
        self.backgroundColor = COLOR_BACKGRAY;
        [self setUpConstraint];
    }
    return self;
}

- (void)setUpConstraint
{
    [self.dateLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self);
        make.left.equalTo(self).offset(10);
    }];
}

- (void)setDate:(NSString *)dateStr
{
    NSDate *date = [self stringTodate:dateStr];
    NSString *str = [self dateToString:date WithFormat:@"MM月dd日 EEEE"];
    self.dateLb.text = str;
}

- (ZHLabel *)dateLb
{
    if (_dateLb == nil) {
        _dateLb = [[ZHLabel alloc] init];
        _dateLb.font = [UIFont systemFontOfSize:12];
        _dateLb.textColor = [UIColor grayColor];
    }
    return _dateLb;
}
@end
