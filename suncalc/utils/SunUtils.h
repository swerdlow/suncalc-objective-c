//
//  SunUtils.h
//  suncalc
//
//  Created by Robert Swerdlow on 4/17/14.
//  Copyright (c) 2014 InfoBridge. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EquatorialCoordinates;

@interface SunUtils : NSObject

+ (double) getSolarMeanAnomaly:(double) d;
+ (double) getEclipticLongitudeM:(double)M;
+ (EquatorialCoordinates*) getSunCoords:(double) d;

@end
