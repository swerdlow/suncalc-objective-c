//
//  SunUtils.m
//  suncalc
//
//  Created by Robert Swerdlow on 4/17/14.
//  Copyright (c) 2014 InfoBridge. All rights reserved.
//

#import "SunUtils.h"

#import "Constants.h"
#import "EquatorialCoordinates.h"
#import "PositionUtils.h"

@implementation SunUtils

+ (double) getSolarMeanAnomaly:(double) d {
    return RAD * (357.5291 + 0.98560028 * d);
}

+ (double) getEquationOfCenter:(double) M {
    return RAD * (1.9148 * sin(M) + 0.02 * sin(2 * M) + 0.0003 * sin(3 * M));
}

+ (double) getEclipticLongitudeM:(double)M {
    double C = [SunUtils getEquationOfCenter:M];
    double P = RAD * 102.9372; // perihelion of the Earth
    return M + C + P + M_PI;
}

+ (EquatorialCoordinates*) getSunCoords:(double) d {
    double M = [SunUtils getSolarMeanAnomaly:d];
    double L = [SunUtils getEclipticLongitudeM:M];
    
    return [EquatorialCoordinates fromRightAscension:[PositionUtils getRightAscensionL:L b:0]
                                         declination:[PositionUtils getDeclinationL:L b:0]];
}

@end
