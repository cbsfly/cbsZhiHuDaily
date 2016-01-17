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
@end
