//
//  MoonUtils.h
//  suncalc
//
//  Created by Robert Swerdlow on 4/17/14.
//  Copyright (c) 2014 InfoBridge. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GeocentricCoordinates;

@interface MoonUtils : NSObject

+ (GeocentricCoordinates*)getMoonCoords:(double) d;

@end
