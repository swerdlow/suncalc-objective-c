//
//  MoonPosition.m
//  suncalc
//
//  Created by Robert Swerdlow on 4/17/14.
//  Copyright (c) 2014 InfoBridge. All rights reserved.
//

#import "MoonPosition.h"

@implementation MoonPosition

+ (MoonPosition*) fromAzimuth:(double)azimuth altitude:(double)altitude distance:(double)distance {
    return [[MoonPosition alloc] initWithAzimuth:azimuth altitude:altitude distance:distance];
}

- (id)initWithAzimuth:(double)azimuth altitude:(double)altitude distance:(double)distance {
    if (self = [super init]) {
		self.azimuth = azimuth;
		self.altitude = altitude;
		self.distance = distance;
    }
    return self;
}

@end
