//
//  DateUtils.h
//  suncalc
//
//  Created by Robert Swerdlow on 4/17/14.
//  Copyright (c) 2014 InfoBridge. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateUtils : NSObject

FOUNDATION_EXPORT const int DAY_MS;
FOUNDATION_EXPORT const int J1970;
FOUNDATION_EXPORT const int J2000;

+ (double)toJulian:(NSDate*)date;
+ (NSDate*)fromJulian:(double)j;
+ (double)toDays:(NSDate*)date;

@end
