//
//  GeocentricCoordinates.m
//  suncalc
//
//  Created by Robert Swerdlow on 4/17/14.
//  Copyright (c) 2014 InfoBridge. All rights reserved.
//

#import "GeocentricCoordinates.h"

@implementation GeocentricCoordinates

+ (GeocentricCoordinates*) fromRightAscension:(double)rightAscension
                                  declination:(double)declination
                                     distance:(double)distance {
    return [[GeocentricCoordinates alloc] initWithRightAscension:rightAscension declination:declination distance:distance];
}

- (id)initWithRightAscension:(double)rightAscension declination:(double)declination distance:(double)distance {
    if (self = [super init]) {
		self.rightAscension = rightAscension;
		self.declination = declination;
		self.distance = distance;
    }
    return self;
}

@end
