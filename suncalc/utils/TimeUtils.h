//
//  TimeUtils.h
//  suncalc
//
//  Created by Robert Swerdlow on 4/17/14.
//  Copyright (c) 2014 InfoBridge. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeUtils : NSObject

+ (double)getJulianCycleD:(double)d lw:(double) lw;
+ (double)getApproxTransitHt:(double)Ht lw:(double)lw n:(double)n;
+ (double)getSolarTransitJDs:(double)ds m:(double)M l:(double)L;
+ (double)getHourAngleH:(double)h phi:(double)phi d:(double)d;

@end
