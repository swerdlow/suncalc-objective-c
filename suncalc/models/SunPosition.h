//
//  SunPosition.h
//  suncalc
//
//  Created by Robert Swerdlow on 4/17/14.
//  Copyright (c) 2014 InfoBridge. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SunPosition : NSObject

+ (SunPosition*) fromAzimuth:(double)azimuth altitude:(double)altitude;

@property double azimuth;
@property double altitude;

@end
