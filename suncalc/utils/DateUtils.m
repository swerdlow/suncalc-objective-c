//
//  DateUtils.m
//  suncalc
//
//  Created by Robert Swerdlow on 4/17/14.
//  Copyright (c) 2014 InfoBridge. All rights reserved.
//

#import "DateUtils.h"

@implementation DateUtils

const int DAY_SECONDS = 60 * 60 * 24;
const int J1970 = 2440588;
const int J2000 = 2451545;

+ (double)toJulian:(NSDate*)date {
    return (double)[date timeIntervalSince1970] / DAY_SECONDS - 0.5 + J1970;
}

+ (NSDate*)fromJulian:(double)j {
//    Calendar date = Calendar.getInstance();
//    date.setTimeInMillis((long) (((j + 0.5 - J1970) * DAY_MS)));
//    return date;
    return [[NSDate alloc] initWithTimeIntervalSince1970:(j + 0.5 - J1970) * DAY_SECONDS];
}

+ (double)toDays:(NSDate*)date {
    return [DateUtils toJulian:date] - J2000;
}

@end
