//
//  LeftViewTableViewCell.m
//  zhihucbs
//
//  Created by 陈秉慎 on 2/29/16.
//  Copyright © 2016 陈秉慎. All rights reserved.
//

#import "LeftViewTableViewCell.h"

@implementation LeftViewTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = COLOR_LEFTVIEWBLACK;
        [self.contentView addSubview:self.addBtn];
        [self.contentView addSubview:self.themeLb];
        
        [self setUpConstraint];
    }
    return self;
}

- (void)setUpConstraint
{
    [self.themeLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self).offset(10);
    }];
    
    [self.addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self).offset(-20);
        make.width.height.mas_equalTo(20);
    }];
}

- (ZHLabel *)themeLb
{
    if (_themeLb == nil) {
        _themeLb = [[ZHLabel alloc] init];
        _themeLb.textColor = COLOR_LEFTTEXTGRAY;
        _themeLb.font = [UIFont systemFontOfSize:14];
    }
    return _themeLb;
}

- (UIButton *)addBtn
{
    if (_addBtn == nil) {
        _addBtn = [[UIButton alloc] init];
        [_addBtn setBackgroundImage:[UIImage imageNamed:@"Dark_Management_Add"] forState:UIControlStateNormal];
    }
    return _addBtn;
}
@end
