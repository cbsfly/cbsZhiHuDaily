//
//  HomePageNewsModel.m
//  zhihucbs
//
//  Created by 陈秉慎 on 1/15/16.
//  Copyright © 2016 陈秉慎. All rights reserved.
//

#import "HomePageNewsModel.h"
@implementation HomePageNewsModel
+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"date": @"date",
             @"storiesArray": @"stories"
             };
}

+ (NSValueTransformer *)storiesArrayJSONTransformer
{
    NSMutableArray *obArray = [[NSMutableArray alloc] init];
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSArray *array, BOOL *success, NSError *__autoreleasing *error) {
        for (NSDictionary *dic in array) {
            HomePageNewsDetModel *detModel = [MTLJSONAdapter modelOfClass:[HomePageNewsDetModel class] fromJSONDictionary:dic error:error];
            [obArray addObject:detModel];
        }
        return obArray;
    }];
}
@end
