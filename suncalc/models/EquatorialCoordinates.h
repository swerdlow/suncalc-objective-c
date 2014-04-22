//
//  EquatorialCoordinates.h
//  suncalc
//
//  Created by Robert Swerdlow on 4/17/14.
//  Copyright (c) 2014 InfoBridge. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EquatorialCoordinates : NSObject

+ (EquatorialCoordinates*) fromRightAscension:(double)rightAscension declination:(double)declination;

@property double rightAscension;
@property double declination;

@end
