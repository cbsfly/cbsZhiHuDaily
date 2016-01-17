//
//  HomePageNewsDetModel.m
//  zhihucbs
//
//  Created by 陈秉慎 on 1/15/16.
//  Copyright © 2016 陈秉慎. All rights reserved.
//

#import "HomePageNewsDetModel.h"

@implementation HomePageNewsDetModel
+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"imagesArray": @"images",
             @"newsId": @"id",
             @"titleStr": @"title"
             };
}
@end
