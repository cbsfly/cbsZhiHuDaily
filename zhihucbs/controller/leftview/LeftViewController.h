//
//  LeftViewController.h
//  zhihucbs
//
//  Created by 陈秉慎 on 15/12/16.
//  Copyright (c) 2015年 陈秉慎. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeftViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *titleTableView;
@end
