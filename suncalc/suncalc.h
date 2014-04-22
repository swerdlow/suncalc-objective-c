//
//  suncalc.h
//  suncalc
//
//  Created by Robert Swerdlow on 4/17/14.
//  Copyright (c) 2014 InfoBridge. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MoonIllumination;
@class MoonPosition;
@class SunPosition;

@interface SunCalc : NSObject

+ (SunCalc*) getTimesForDate:(NSDate*)date latitude:(double)latitude longitude:(double)longitude;
+ (SunPosition*) getSunPositionDate:(NSDate*)timeAndDate latitude:(double)latitude longitude:(double)longitude;
+ (MoonPosition*) getMoonPositionDate:(NSDate*)timeAndDate latitude:(double)latitude longitude:(double)longitude;
+ (MoonIllumination*) getMoonIllumination:(NSDate*)timeAndDate;

@property NSDate* sunrise;
@property NSDate* sunriseEnd;
@property NSDate* goldenHourEnd;
@property NSDate* solarNoon;
@property NSDate* goldenHour;
@property NSDate* sunsetStart;
@property NSDate* sunset;
@property NSDate* dusk;
@property NSDate* nauticalDusk;
@property NSDate* night;
@property NSDate* nadir;
@property NSDate* nightEnd;
@property NSDate* nauticalDawn;
@property NSDate* dawn;

@end
