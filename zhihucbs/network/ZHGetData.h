//
//  ZHGetData.h
//  zhihucbs
//
//  Created by 陈秉慎 on 1/15/16.
//  Copyright © 2016 陈秉慎. All rights reserved.
//

#import <Foundation/Foundation.h>
//model
#import "HomePageNewsModel.h"
#import "NewsPageModel.h"
#import "ThemeListModel.h"



typedef void (^dataBlock)(id model, NSError *error);


@interface ZHGetData : NSObject
+ (void)getHomePageNewsData:(dataBlock)datablock;
+ (void)getHomePageMoreData:(dataBlock)datablock
                   WithDate:(NSString *)dateStr;
+ (void)getNewsDetData:(dataBlock)datablock
                WithId:(NSString *)idStr;
+ (void)getThemeList:(dataBlock)datablock;

@end
