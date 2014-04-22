//
//  suncalc.m
//  suncalc
//
//  Created by Robert Swerdlow on 4/17/14.
//  Copyright (c) 2014 InfoBridge. All rights reserved.
//

#import "SunCalc.h"

#import "EquatorialCoordinates.h"
#import "GeocentricCoordinates.h"
#import "MoonIllumination.h"
#import "MoonPosition.h"
#import "SunPosition.h"

#import "Constants.h"
#import "DateUtils.h"
#import "MoonUtils.h"
#import "PositionUtils.h"
#import "SunUtils.h"
#import "TimeUtils.h"

#define J0 0.0009

@implementation SunCalc

// returns set time for the given sun altitude
+ (double) getSetJ:(double)h phi:(double)phi dec:(double)dec lw:(double)lw n:(int)n m:(double)M l:(double)L {
    double w = [TimeUtils getHourAngleH:h phi:phi d:dec];
    double a = [TimeUtils getApproxTransitHt:w lw:lw n:n];
    return [TimeUtils getSolarTransitJDs:a m:M l:L];
}

// calculates sun times for a given date and latitude/longitude
+ (SunCalc*) getTimesForDate:(NSDate*)date latitude:(double)latitude longitude:(double)longitude {
    return [[SunCalc alloc] initWithDate:date latitude:latitude longitude:longitude];
}

- (id) initWithDate:(NSDate*)date latitude:(double)latitude longitude:(double)longitude {
    if (self = [super init]) {
        double lw  = RAD * -longitude;
        double phi = RAD * latitude;
        double d   = [DateUtils toDays:date];
        
        int n  = [TimeUtils getJulianCycleD:d lw:lw];
        double ds = [TimeUtils getApproxTransitHt:0 lw:lw n:n];
        
        double M = [SunUtils getSolarMeanAnomaly:ds];
        double L = [SunUtils getEclipticLongitudeM:M];
        double dec = [PositionUtils getDeclinationL:L b:0];
        
        double Jnoon = [TimeUtils getSolarTransitJDs:ds m:M l:L];
        
        self.solarNoon = [DateUtils fromJulian:Jnoon];
        self.nadir = [DateUtils fromJulian:Jnoon - 0.5];
        
        // sun times configuration (angle, morning name, evening name)
        // unrolled the loop working on this data:
        // var times = [
        //             [-0.83, 'sunrise',       'sunset'      ],
        //             [ -0.3, 'sunriseEnd',    'sunsetStart' ],
        //             [   -6, 'dawn',          'dusk'        ],
        //             [  -12, 'nauticalDawn',  'nauticalDusk'],
        //             [  -18, 'nightEnd',      'night'       ],
        //             [    6, 'goldenHourEnd', 'goldenHour'  ]
        //             ];
        double h;
        double Jset;
        double Jrise;
        h = -0.83;
        Jset = [SunCalc getSetJ:h * RAD phi:phi dec:dec lw:lw n:n m:M l:L];
        Jrise = Jnoon - (Jset - Jnoon);
        self.sunrise = [DateUtils fromJulian:Jrise];
        self.sunset = [DateUtils fromJulian:Jset];
        
        h = -0.3;
        Jset = [SunCalc getSetJ:h * RAD phi:phi dec:dec lw:lw n:n m:M l:L];
        Jrise = Jnoon - (Jset - Jnoon);
        self.sunriseEnd = [DateUtils fromJulian:Jrise];
        self.sunsetStart = [DateUtils fromJulian:Jset];
        
        h = -6;
        Jset = [SunCalc getSetJ:h * RAD phi:phi dec:dec lw:lw n:n m:M l:L];
        Jrise = Jnoon - (Jset - Jnoon);
        self.dawn = [DateUtils fromJulian:Jrise];
        self.dusk = [DateUtils fromJulian:Jset];
        
        h = -12;
        Jset = [SunCalc getSetJ:h * RAD phi:phi dec:dec lw:lw n:n m:M l:L];
        Jrise = Jnoon - (Jset - Jnoon);
        self.nauticalDawn = [DateUtils fromJulian:Jrise];
        self.nauticalDusk = [DateUtils fromJulian:Jset];
        
        h = -18;
        Jset = [SunCalc getSetJ:h * RAD phi:phi dec:dec lw:lw n:n m:M l:L];
        Jrise = Jnoon - (Jset - Jnoon);
        self.nightEnd = [DateUtils fromJulian:Jrise];
        self.night = [DateUtils fromJulian:Jset];
        
        h = 6;
        Jset = [SunCalc getSetJ:h * RAD phi:phi dec:dec lw:lw n:n m:M l:L];
        Jrise = Jnoon - (Jset - Jnoon);
        self.goldenHourEnd = [DateUtils fromJulian:Jrise];
        self.goldenHour = [DateUtils fromJulian:Jset];
    }
    return self;
}

+ (SunPosition*) getSunPositionDate:(NSDate*)timeAndDate latitude:(double)latitude longitude:(double)longitude {
    double lw  = RAD * -longitude;
    double phi = RAD * latitude;
    double d   = [DateUtils toDays:timeAndDate];
    
    EquatorialCoordinates* c = [SunUtils getSunCoords:d];
    double H  = [PositionUtils getSiderealTimeD:d lw:lw] - c.rightAscension;
    
    return [SunPosition fromAzimuth:[PositionUtils getAzimuthH:H phi:phi dec:c.declination]
                           altitude:[PositionUtils getAltitudeH:H phi:phi dec:c.declination]];
}

+ (MoonPosition*) getMoonPositionDate:(NSDate*)timeAndDate latitude:(double)latitude longitude:(double)longitude {
    double lw  = RAD * -longitude;
    double phi = RAD * latitude;
    double d = [DateUtils toDays:timeAndDate];
    
    GeocentricCoordinates* c = [MoonUtils getMoonCoords:d];
    double H = [PositionUtils getSiderealTimeD:d lw:lw] - c.rightAscension;
    double h = [PositionUtils getAltitudeH:H phi:phi dec:c.declination];
    
    // altitude correction for refraction
    h = h + RAD * 0.017 / tan(h + RAD * 10.26 / (h + RAD * 5.10));
    
    return [MoonPosition fromAzimuth:[PositionUtils getAzimuthH:H phi:phi dec:c.declination] altitude:h distance:c.distance];
}

+ (MoonIllumination*) getMoonIllumination:(NSDate*)timeAndDate {
    double d = [DateUtils toDays:timeAndDate];
    EquatorialCoordinates* s = [SunUtils getSunCoords:d];
    GeocentricCoordinates* m = [MoonUtils getMoonCoords:d];

    int sdist = 149598000; // distance from Earth to Sun in km
    
    double phi = acos(sin(s.declination) * sin(m.declination) + cos(s.declination) * cos(m.declination) * cos(s.rightAscension - m.rightAscension));
    double inc = atan2(sdist * sin(phi), m.distance - sdist * cos(phi));
    double angle = atan2(cos(s.declination) * sin(s.rightAscension - m.rightAscension), sin(s.declination) * cos(m.declination) -
                        cos(s.declination) * sin(m.declination) * cos(s.rightAscension - m.rightAscension));
    
    return [MoonIllumination fromFraction:(1 + cos(inc)) / 2
                                    phase:0.5 + 0.5 * inc * (angle < 0 ? -1 : 1) / M_PI
                                    angle:angle];
}

@end
