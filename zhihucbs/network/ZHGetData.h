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



typedef void (^dataBlock)(id model, NSError *error);


@interface ZHGetData : NSObject
+ (void)getHomePageNewsData:(dataBlock)datablock;
@end
