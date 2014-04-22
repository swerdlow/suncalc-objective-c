//
//  MoonIllumination.m
//  suncalc
//
//  Created by Robert Swerdlow on 4/18/14.
//  Copyright (c) 2014 InfoBridge. All rights reserved.
//

#import "MoonIllumination.h"

@implementation MoonIllumination

+ (MoonIllumination*) fromFraction:(double)fraction phase:(double)phase angle:(double)angle {
    return [[MoonIllumination alloc] initWithFraction:fraction phase:phase angle:angle];
}

- (id)initWithFraction:(double)fraction phase:(double)phase angle:(double)angle {
    if (self = [super init]) {
		self.fraction = fraction;
		self.phase = phase;
		self.angle = angle;
    }
    return self;
}
@end
