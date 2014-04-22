//
//  GeocentricCoordinates.h
//  suncalc
//
//  Created by Robert Swerdlow on 4/17/14.
//  Copyright (c) 2014 InfoBridge. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GeocentricCoordinates : NSObject

+ (GeocentricCoordinates*) fromRightAscension:(double)rightAscension
                                  declination:(double)declination
                                     distance:(double)distance;

@property double rightAscension;
@property double declination;
@property double distance;

@end
