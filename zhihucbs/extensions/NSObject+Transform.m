//
//  NSObject+Transform.m
//  zhihucbs
//
//  Created by 陈秉慎 on 1/18/16.
//  Copyright © 2016 陈秉慎. All rights reserved.
//

#import "NSObject+Transform.h"

@implementation NSObject (Transform)
- (NSString *)dateToString:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    [dateFormatter setDateFormat:@"yyyyMMdd"];
    NSString *dateString = [dateFormatter stringFromDate:date];
    return dateString;
}

- (NSDate *)stringTodate:(NSString *)string
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init] ;
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    [dateFormatter setDateFormat:@"yyyyMMdd"];
    NSDate *date=[dateFormatter dateFromString:string];
    return date;
}

- (NSString *)dateToString:(NSDate *)date WithFormat:(NSString *)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    [dateFormatter setDateFormat:format];
    NSString *dateString = [dateFormatter stringFromDate:date];
    return dateString;
}
@end
