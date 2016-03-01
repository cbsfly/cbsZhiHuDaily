//
//  ThemeListModel.m
//  zhihucbs
//
//  Created by 陈秉慎 on 2/29/16.
//  Copyright © 2016 陈秉慎. All rights reserved.
//

#import "ThemeListModel.h"

@implementation ThemeListModel
+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"themeId": @"id",
             @"nameStr": @"name"
             };
}
@end
