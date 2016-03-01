//
//  BottomView.h
//  zhihucbs
//
//  Created by 陈秉慎 on 2/25/16.
//  Copyright © 2016 陈秉慎. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol BottomViewDelegate <NSObject>
- (void)goBack;
- (void)goNext;

@end

@interface BottomView : UIView
@property (nonatomic, strong) UIButton *goBackBtn;
@property (nonatomic, strong) UIButton *goNextBtn;
@property (nonatomic, strong) UIButton *goodBtn;
@property (nonatomic, strong) UIButton *shareBtn;
@property (nonatomic, strong) UIButton *commentBtn;
@property (nonatomic, assign) id<BottomViewDelegate> delegate;
@end
