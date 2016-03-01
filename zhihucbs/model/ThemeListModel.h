//
//  ThemeListModel.h
//  zhihucbs
//
//  Created by 陈秉慎 on 2/29/16.
//  Copyright © 2016 陈秉慎. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface ThemeListModel : MTLModel<MTLJSONSerializing>
@property (nonatomic, strong, readonly) NSNumber *themeId;
@property (nonatomic, strong, readonly) NSString *nameStr;
@end
