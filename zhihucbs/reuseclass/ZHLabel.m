//
//  ZHLabel.m
//  zhihucbs
//
//  Created by 陈秉慎 on 1/6/16.
//  Copyright (c) 2016 陈秉慎. All rights reserved.
//

#import "ZHLabel.h"

@implementation ZHLabel
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.textColor = [UIColor blackColor];
        self.numberOfLines = 0;
    }
    return self;
}

@end
