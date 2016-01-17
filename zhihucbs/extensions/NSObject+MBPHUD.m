//
//  NSObject+MBPHUD.m
//  zhihucbs
//
//  Created by 陈秉慎 on 1/15/16.
//  Copyright © 2016 陈秉慎. All rights reserved.
//

#import "NSObject+MBPHUD.h"

@implementation NSObject (MBPHUD)
- (void)showHudTipStr:(NSString *)tipStr{
    if (tipStr && tipStr.length > 0) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:KeyWindow animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.detailsLabelFont = [UIFont boldSystemFontOfSize:15.0];
        hud.detailsLabelText = tipStr;
        hud.margin = 10.f;
        hud.removeFromSuperViewOnHide = YES;
        [hud hide:YES afterDelay:1.0];
    }
}

- (void)showCustomHud
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:KeyWindow animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.detailsLabelFont = [UIFont boldSystemFontOfSize:15.0];
    hud.labelText = @"请等待";
    hud.margin = 10.f;
}

- (NSString *)tipFromError:(NSError *)error{
    if (error && error.userInfo) {
        NSMutableString *tipStr = [[NSMutableString alloc] init];
        if ([error.userInfo objectForKey:@"msg"]) {
            tipStr = [error.userInfo objectForKey:@"msg"];
        }else{
            if ([error.userInfo objectForKey:@"NSLocalizedDescription"]) {
                tipStr = [error.userInfo objectForKey:@"NSLocalizedDescription"];
            }else{
                [tipStr appendFormat:@"ErrorCode%ld", (long)error.code];
            }
        }
        return tipStr;
    }
    return nil;
}
@end
