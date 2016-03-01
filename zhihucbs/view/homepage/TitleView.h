//
//  TitleView.h
//  zhihucbs
//
//  Created by 陈秉慎 on 15/12/15.
//  Copyright (c) 2015年 陈秉慎. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZHLabel.h"

@protocol TitleViewDelegate <NSObject>
- (void)leftViewAppear;
@end

@interface TitleView : UIView
@property (nonatomic, assign) id<TitleViewDelegate> delegate;
@property (nonatomic, strong) ZHLabel *titleLb;
@property (nonatomic, strong) UIButton *leftBtn;
@property (nonatomic, strong) UIActivityIndicatorView *ActView;
@end
