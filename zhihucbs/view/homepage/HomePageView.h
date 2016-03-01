//
//  HomePageView.h
//  zhihucbs
//
//  Created by 陈秉慎 on 2/23/16.
//  Copyright © 2016 陈秉慎. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol HomePageViewDelegate <NSObject>
- (void)leftViewAppeared;
@end


@interface HomePageView : UIView
@property (nonatomic, assign) float centerX;
@property (nonatomic, assign) float centerY;
@property (nonatomic, strong) UIPanGestureRecognizer *panGestureRecognizer;
@property (nonatomic, assign) id<HomePageViewDelegate> delegate;


@end
