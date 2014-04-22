//
//  MoonPosition.h
//  suncalc
//
//  Created by Robert Swerdlow on 4/17/14.
//  Copyright (c) 2014 InfoBridge. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MoonPosition : NSObject

+ (MoonPosition*) fromAzimuth:(double)azimuth altitude:(double)altitude distance:(double)distance;

@property double azimuth;
@property double altitude;
@property double distance;

@end
