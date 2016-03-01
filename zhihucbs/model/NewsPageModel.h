//
//  NewsPageModel.h
//  zhihucbs
//
//  Created by 陈秉慎 on 2/25/16.
//  Copyright © 2016 陈秉慎. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface NewsPageModel : MTLModel<MTLJSONSerializing>
@property (nonatomic, strong, readonly) NSURL *imageUrl;
@property (nonatomic, strong, readonly) NSString *bodyHtmlStr;
@property (nonatomic, strong, readonly) NSString *titleStr;
@property (nonatomic, strong, readonly) NSArray *cssArray;
@end
