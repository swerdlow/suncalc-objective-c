//
//  TimeUtils.m
//  suncalc
//
//  Created by Robert Swerdlow on 4/17/14.
//  Copyright (c) 2014 InfoBridge. All rights reserved.
//

#import "TimeUtils.h"

#import "DateUtils.h"

@implementation TimeUtils

#define J0 0.0009
    
+ (double)getJulianCycleD:(double)d lw:(double) lw {
    return round(d - J0 - lw / (2 * M_PI));
}

+ (double)getApproxTransitHt:(double)Ht lw:(double)lw n:(double)n {
    return J0 + (Ht + lw) / (2 * M_PI) + n;
}

+ (double)getSolarTransitJDs:(double)ds m:(double)M l:(double)L {
    return J2000 + ds + 0.0053 * sin(M) - 0.0069 * sin(2 * L);
}

+ (double)getHourAngleH:(double)h phi:(double)phi d:(double)d {
    return acos((sin(h) - sin(phi) * sin(d)) / (cos(phi) * cos(d)));
}

@end
