suncalc-objective-c
===================

*This is an Objective C port for iOS of https://github.com/mourner/suncalc*

Author: Bob Swerdlow

License: MIT

This code is based on the original Javascript suncalc by Vladimir Agafonkin ("mourner").  I also used the Java port by Nolan Caudill ("mncaudill") for ideas.  Where these two diverged, I tried to stick with the original.  This Objective C port for iOS implements and passes the same tests as the original.

```objc
// get today's sunlight times for London
NSDate *today = [NSDate date];
SunCalc* sunCalc = [SunCalc getTimesForDate:today latitude:51.5 longitude:-0.1];

// format sunrise time from the Date object
NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
[formatter setDateFormat:@"HH:mm"];
[formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT"]];
NSString* sunriseStr = [formatter stringFromDate:[sunCalc sunrise]];
NSLog(@"sunriseStr: %@", sunriseStr);

// get position of the sun (azimuth and altitude) at today's sunrise
SunPosition* sunrisePos = [SunCalc getSunPositionDate:[sunCalc sunrise] latitude:51.5 longitude:-0.1];

// get sunrise azimuth in degrees
double sunriseAzimuth = sunrisePos.azimuth * 180 / M_PI;
NSLog(@"sunriseAzimuth: %f", sunriseAzimuth);
```

