//
//  SunPosition.m
//  suncalc
//
//  Created by Robert Swerdlow on 4/17/14.
//  Copyright (c) 2014 InfoBridge. All rights reserved.
//

#import "SunPosition.h"

@implementation SunPosition

double azimuth;
double altitude;

+ (SunPosition*) fromAzimuth:(double)azimuth altitude:(double)altitude {
    return [[SunPosition alloc] initWithAzimuth:azimuth altitude:altitude];
}

- (id)initWithAzimuth:(double)azimuth altitude:(double)altitude {
    if (self = [super init]) {
		self.azimuth = azimuth;
		self.altitude = altitude;
    }
    return self;
}

@end
