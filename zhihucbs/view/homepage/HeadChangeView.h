//
//  HeadChangeView.h
//  zhihucbs
//
//  Created by 陈秉慎 on 1/16/16.
//  Copyright © 2016 陈秉慎. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomePageNewsTopModel.h"
#import "HeadImagerView.h"

@interface HeadChangeView : UIView<UIScrollViewDelegate>
@property (nonatomic, strong) NSMutableArray *imageArray;
@property (nonatomic, strong) HeadImagerView *headImgView;
@property (nonatomic, strong) UIScrollView *changeScrollView;
@property (nonatomic, strong) UIPageControl *headPageControl;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) NSMutableArray *titleArray;
- (void)setDataArray:(NSArray *)array;
@end
