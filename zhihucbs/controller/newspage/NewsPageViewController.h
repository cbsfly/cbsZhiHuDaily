//
//  NewsPageViewController.h
//  zhihucbs
//
//  Created by 陈秉慎 on 2/25/16.
//  Copyright © 2016 陈秉慎. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BottomView.h"
#import "HeadImagerView.h"

@interface NewsPageViewController : UIViewController<BottomViewDelegate>
@property (nonatomic, strong) BottomView *bottomView;
@property (nonatomic, strong) HeadImagerView *newsImgView;
@property (nonatomic, strong) UIWebView *backWebView;
@property (nonatomic, strong) NewsPageModel *dataModel;
@property (nonatomic, strong) NSString *idStr;
@end
