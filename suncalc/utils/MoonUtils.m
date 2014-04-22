//
//  MoonUtils.m
//  suncalc
//
//  Created by Robert Swerdlow on 4/17/14.
//  Copyright (c) 2014 InfoBridge. All rights reserved.
//

#import "MoonUtils.h"

#import "Constants.h"
#import "GeocentricCoordinates.h"
#import "PositionUtils.h"

@implementation MoonUtils

+ (GeocentricCoordinates*)getMoonCoords:(double) d {
    // geocentric ecliptic coordinates of the moon
    
    double L = RAD * (218.316 + 13.176396 * d);   // ecliptic longitude
    double M = RAD * (134.963 + 13.064993 * d);   // mean anomaly
    double F = RAD * (93.272 + 13.229350 * d);    // mean distance
    
    double l  = L + RAD * 6.289 * sin(M);    // longitude
    double b  = RAD * 5.128 * sin(F);        // latitude
    double dt = 385001 - 20905 * cos(M);               // distance to the moon in km
    
    return [GeocentricCoordinates fromRightAscension:[PositionUtils getRightAscensionL:l b:b]
                                         declination:[PositionUtils getDeclinationL:l b:b]
                                            distance:dt];
}

@end
