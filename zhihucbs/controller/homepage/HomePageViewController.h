//
//  HomePageViewController.h
//  zhihucbs
//
//  Created by 陈秉慎 on 1/4/16.
//  Copyright (c) 2016 陈秉慎. All rights reserved.
//

#import "ZHBaseViewController.h"

@interface HomePageViewController : ZHBaseViewController<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end
