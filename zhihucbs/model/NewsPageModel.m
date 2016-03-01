//
//  NewsPageModel.m
//  zhihucbs
//
//  Created by 陈秉慎 on 2/25/16.
//  Copyright © 2016 陈秉慎. All rights reserved.
//

#import "NewsPageModel.h"

@implementation NewsPageModel
+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"imageUrl": @"image",
             @"bodyHtmlStr": @"body",
             @"titleStr": @"title",
             @"cssArray": @"css"
             };
}
@end
