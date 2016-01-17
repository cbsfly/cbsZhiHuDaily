//
//  NSObject+MBPHUD.h
//  zhihucbs
//
//  Created by 陈秉慎 on 1/15/16.
//  Copyright © 2016 陈秉慎. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (MBPHUD)
- (void)showHudTipStr:(NSString *)tipStr;
- (void)showCustomHud;
- (NSString *)tipFromError:(NSError *)error;
@end
