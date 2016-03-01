//
//  LeftView.h
//  zhihucbs
//
//  Created by 陈秉慎 on 2/23/16.
//  Copyright © 2016 陈秉慎. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeftViewHeadView.h"
#import "LeftFootView.h"
#import "LeftViewTableViewCell.h"

@interface LeftView : UIView<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *titleTableView;
@property (nonatomic, strong) LeftViewHeadView *headView;
@property (nonatomic, strong) LeftFootView *footView;
@property (nonatomic, strong) NSMutableArray *themeArray;
@property (nonatomic, strong) ThemeListModel *dataModel;
@end
