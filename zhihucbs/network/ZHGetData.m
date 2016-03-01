//
//  ZHGetData.m
//  zhihucbs
//
//  Created by 陈秉慎 on 1/15/16.
//  Copyright © 2016 陈秉慎. All rights reserved.
//

#import "ZHGetData.h"
#import "ZHNetWork.h"




@implementation ZHGetData
+ (void)getHomePageNewsData:(dataBlock)datablock
{
    [[ZHNetWork sharedManager] requestWithMethod:GET WithPath:URL_HOMEPAGENEWS WithParams:nil WithSuccessBlock:^(NSDictionary *dic) {
        HomePageNewsModel *model = [MTLJSONAdapter modelOfClass:[HomePageNewsModel class] fromJSONDictionary:dic error:nil] ;
        datablock(model, nil);
    } WithFailurBlock:^(NSError *error) {
        datablock(nil, error);
    }];
}

+ (void)getHomePageMoreData:(dataBlock)datablock WithDate:(NSString *)dateStr
{
    NSDate *date = [self stringTodate:dateStr];
    NSTimeInterval secADay = 24 * 60 * 60;
    [date dateByAddingTimeInterval:-secADay];
    dateStr = [self dateToString:date];
    NSString *str = [URL_HOMEPAGEMOREDATA stringByAppendingString:dateStr];
    
    [[ZHNetWork sharedManager] requestWithMethod:GET WithPath:str WithParams:nil WithSuccessBlock:^(NSDictionary *dic) {
        HomePageNewsModel *model = [MTLJSONAdapter modelOfClass:[HomePageNewsModel class] fromJSONDictionary:dic error:nil] ;
        datablock(model, nil);
    } WithFailurBlock:^(NSError *error) {
        datablock(nil, error);
    }];
}

+ (void)getNewsDetData:(dataBlock)datablock WithId:(NSString *)idStr
{
    NSString *urlStr = [URL_NEWSPAGEDATA stringByAppendingString:idStr];
    [[ZHNetWork sharedManager] requestWithMethod:GET WithPath:urlStr WithParams:nil WithSuccessBlock:^(NSDictionary *dic) {
        NewsPageModel *model = [MTLJSONAdapter modelOfClass:[NewsPageModel class] fromJSONDictionary:dic error:nil] ;
        datablock(model, nil);
    } WithFailurBlock:^(NSError *error) {
        datablock(nil, error);
    }];
}

+ (void)getThemeList:(dataBlock)datablock
{
    [[ZHNetWork sharedManager] requestWithMethod:GET WithPath:URL_THEMELIST WithParams:nil WithSuccessBlock:^(NSDictionary *dic) {
        NSDictionary *othersDic = [dic objectForKey:@"others"];
        NSMutableArray *othersArray = [NSMutableArray new];
        for (NSDictionary *item in othersDic) {
            ThemeListModel *model = [MTLJSONAdapter modelOfClass:[ThemeListModel class] fromJSONDictionary:item error:nil] ;
            [othersArray addObject:model];
        }
        datablock(othersArray, nil);
    } WithFailurBlock:^(NSError *error) {
        datablock(nil, error);
    }];
}
@end
