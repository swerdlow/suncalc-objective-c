//
//  EquatorialCoordinates.m
//  suncalc
//
//  Created by Robert Swerdlow on 4/17/14.
//  Copyright (c) 2014 InfoBridge. All rights reserved.
//

#import "EquatorialCoordinates.h"

@implementation EquatorialCoordinates

+ (EquatorialCoordinates*) fromRightAscension:(double)rightAscension declination:(double)declination {
    return [[EquatorialCoordinates alloc] initWithRightAscension:rightAscension declination:declination];
}

- (id)initWithRightAscension:(double)rightAscension declination:(double)declination {
    if (self = [super init]) {
		self.rightAscension = rightAscension;
		self.declination = declination;
    }
    return self;
}

@end
