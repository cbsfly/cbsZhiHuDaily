//
//  HomePageNewsTopModel.m
//  zhihucbs
//
//  Created by 陈秉慎 on 1/17/16.
//  Copyright © 2016 陈秉慎. All rights reserved.
//

#import "HomePageNewsTopModel.h"

@implementation HomePageNewsTopModel
+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"imageUrl": @"image",
             @"newsId": @"id",
             @"titleStr": @"title"
             };
}
@end
