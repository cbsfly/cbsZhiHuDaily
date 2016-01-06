//
//  HomePageTableViewCell.h
//  zhihucbs
//
//  Created by 陈秉慎 on 1/4/16.
//  Copyright (c) 2016 陈秉慎. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomePageTableViewCell : UITableViewCell
@property (nonatomic, strong) UIImageView *newsImgView;
@property (nonatomic, strong) ZHLabel *titleLb;
@property (nonatomic, strong) ZHLabel *summaryLb;
@property (nonatomic, strong) UIButton *functionBtn;
@property (nonatomic, strong) UIView *backView;
@end
