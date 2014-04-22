//
//  MoonIllumination.h
//  suncalc
//
//  Created by Robert Swerdlow on 4/18/14.
//  Copyright (c) 2014 InfoBridge. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MoonIllumination : NSObject

+ (MoonIllumination*) fromFraction:(double)fraction phase:(double)phase angle:(double)angle;

@property double fraction;
@property double phase;
@property double angle;

@end
