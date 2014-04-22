//
//  PositionUtils.m
//  suncalc
//
//  Created by Robert Swerdlow on 4/17/14.
//  Copyright (c) 2014 InfoBridge. All rights reserved.
//

#import "PositionUtils.h"

#import "Constants.h"

@implementation PositionUtils

+ (double) getRightAscensionL:(double)l b:(double)b {
    return atan2(sin(l) * cos(E) - tan(b) * sin(E), cos(l));
}
    
+ (double) getDeclinationL:(double)l b:(double)b {
    return asin(sin(b) * cos(E) + cos(b) * sin(E) * sin(l));
}
    
+ (double) getAzimuthH:(double)H phi:(double)phi dec:(double)dec {
    return atan2(sin(H), cos(H) * sin(phi) - tan(dec) * cos(phi));
}

+ (double) getAltitudeH:(double)H phi:(double)phi dec:(double)dec {
    return asin(sin(phi) * sin(dec) + cos(phi) * cos(dec) * cos(H));
}

+ (double) getSiderealTimeD:(double)d lw:(double)lw {
    return RAD * (280.16 + 360.9856235 * d) - lw;
}

@end
