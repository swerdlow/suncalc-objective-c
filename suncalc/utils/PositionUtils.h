//
//  PositionUtils.h
//  suncalc
//
//  Created by Robert Swerdlow on 4/17/14.
//  Copyright (c) 2014 InfoBridge. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PositionUtils : NSObject

+ (double) getRightAscensionL:(double)l b:(double)b;
+ (double) getDeclinationL:(double)l b:(double)b;
+ (double) getAzimuthH:(double)H phi:(double)phi dec:(double)dec;
+ (double) getAltitudeH:(double)H phi:(double)phi dec:(double)dec;
+ (double) getSiderealTimeD:(double)d lw:(double)lw;

@end
