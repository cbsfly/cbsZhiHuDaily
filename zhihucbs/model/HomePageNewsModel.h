//
//  HomePageNewsModel.h
//  zhihucbs
//
//  Created by 陈秉慎 on 1/15/16.
//  Copyright © 2016 陈秉慎. All rights reserved.
//

#import <Mantle/Mantle.h>
#import "HomePageNewsDetModel.h"
#import "HomePageNewsTopModel.h"
@interface HomePageNewsModel : MTLModel<MTLJSONSerializing>
@property (nonatomic, strong, readonly) NSString *date;
@property (nonatomic, strong, readonly) NSMutableArray *storiesArray;
@property (nonatomic, strong, readonly) NSMutableArray *topNewsArray;
@end
