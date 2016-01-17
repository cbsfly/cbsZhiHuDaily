//
//  HeadChangeView.h
//  zhihucbs
//
//  Created by 陈秉慎 on 1/16/16.
//  Copyright © 2016 陈秉慎. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeadChangeView : UIView<UIScrollViewDelegate>
@property (nonatomic, strong) NSMutableArray *imageArray;
@property (nonatomic, strong) UIImageView *headImgView;
@property (nonatomic, strong) UIScrollView *changeScrollView;
@property (nonatomic, strong) UIPageControl *headPageControl;
@end
