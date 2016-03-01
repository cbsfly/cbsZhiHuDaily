//
//  NSObject+Transform.h
//  zhihucbs
//
//  Created by 陈秉慎 on 1/18/16.
//  Copyright © 2016 陈秉慎. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Transform)
- (NSString *)dateToString:(NSDate *)date;
- (NSDate *)stringTodate:(NSString *)string;
- (NSString *)dateToString:(NSDate *)date WithFormat:(NSString *)format;
@end
