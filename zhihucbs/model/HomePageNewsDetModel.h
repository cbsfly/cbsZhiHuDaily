//
//  HomePageNewsDetModel.h
//  zhihucbs
//
//  Created by 陈秉慎 on 1/15/16.
//  Copyright © 2016 陈秉慎. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface HomePageNewsDetModel : MTLModel<MTLJSONSerializing>
@property (nonatomic, strong, readonly) NSArray *imagesArray;
@property (nonatomic, strong, readonly) NSNumber *newsId;
@property (nonatomic, strong, readonly) NSString *titleStr;

@end
