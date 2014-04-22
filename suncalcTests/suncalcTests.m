//
//  suncalcTests.m
//  suncalcTests
//
//  Created by Robert Swerdlow on 4/17/14.
//  Copyright (c) 2014 InfoBridge. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "MoonIllumination.h"
#import "MoonPosition.h"
#import "SunCalc.h"
#import "SunPosition.h"

@interface suncalcTests : XCTestCase
@end

@implementation suncalcTests

#define NEARNESS 1e-15

NSDate* date;
double LAT = 50.5;
double LNG = 30.5;

- (void)setUp
{
    [super setUp];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    [calendar setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT"]];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setYear:2013];
    [components setMonth:3];
    [components setDay:5];
    date = [calendar dateFromComponents:components];
};

- (void)test_sun_getTimes
{
    //t.test('getTimes returns sun phases for the given date and location', function (t) {
    //    var times = SunCalc.getTimes(date, lat, lng);
    //
    //    for (var i in testTimes) {
    //        t.equal(times[i].toUTCString(), new Date(testTimes[i]).toUTCString(), i);
    //    }
    //    t.end();
    //});
    SunCalc* sunCalc = [SunCalc getTimesForDate:date latitude:LAT longitude:LNG];

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
    [formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT"]];

    XCTAssertEqualObjects([formatter stringFromDate:[sunCalc solarNoon]],         @"2013-03-05T10:10:57Z");
    XCTAssertEqualObjects([formatter stringFromDate:[sunCalc nadir]],             @"2013-03-04T22:10:57Z");
    XCTAssertEqualObjects([formatter stringFromDate:[sunCalc sunrise]],           @"2013-03-05T04:34:57Z");
    XCTAssertEqualObjects([formatter stringFromDate:[sunCalc sunset]],            @"2013-03-05T15:46:56Z");
    XCTAssertEqualObjects([formatter stringFromDate:[sunCalc sunset]],            @"2013-03-05T15:46:56Z");
    XCTAssertEqualObjects([formatter stringFromDate:[sunCalc sunriseEnd]],        @"2013-03-05T04:38:19Z");
    XCTAssertEqualObjects([formatter stringFromDate:[sunCalc sunsetStart]],       @"2013-03-05T15:43:34Z");
    XCTAssertEqualObjects([formatter stringFromDate:[sunCalc dawn]],              @"2013-03-05T04:02:17Z");
    XCTAssertEqualObjects([formatter stringFromDate:[sunCalc dusk]],              @"2013-03-05T16:19:36Z");
    XCTAssertEqualObjects([formatter stringFromDate:[sunCalc nauticalDawn]],      @"2013-03-05T03:24:31Z");
    XCTAssertEqualObjects([formatter stringFromDate:[sunCalc nauticalDusk]],      @"2013-03-05T16:57:22Z");
    XCTAssertEqualObjects([formatter stringFromDate:[sunCalc nightEnd]],          @"2013-03-05T02:46:17Z");
    XCTAssertEqualObjects([formatter stringFromDate:[sunCalc night]],             @"2013-03-05T17:35:36Z");
    XCTAssertEqualObjects([formatter stringFromDate:[sunCalc goldenHourEnd]],     @"2013-03-05T05:19:01Z");
    XCTAssertEqualObjects([formatter stringFromDate:[sunCalc goldenHour]],        @"2013-03-05T15:02:52Z");
}

- (void)test_sun_getPosition
{
    //t.test('getPosition returns azimuth and altitude for the given time and location', function (t) {
    //    var sunPos = SunCalc.getPosition(date, lat, lng);
    //
    //    t.ok(near(sunPos.azimuth, -2.5003175907168385), 'azimuth');
    //    t.ok(near(sunPos.altitude, -0.7000406838781611), 'altitude');
    //    t.end();
    //});
    SunPosition* sunPos = [SunCalc getSunPositionDate:date latitude:LAT longitude:LNG];
    XCTAssertEqualWithAccuracy(sunPos.azimuth, -2.5003175907168385, NEARNESS);
    XCTAssertEqualWithAccuracy(sunPos.altitude, -0.7000406838781611, NEARNESS);
}

- (void)test_getMoonPosition
{
    //t.test('getMoonPosition returns moon position data given time and location', function (t) {
    //    var moonPos = SunCalc.getMoonPosition(date, lat, lng);
    //
    //    t.ok(near(moonPos.azimuth, -0.9783999522438226), 'azimuth');
    //    t.ok(near(moonPos.altitude, 0.006969727754891917), 'altitude');
    //    t.ok(near(moonPos.distance, 364121.37256256194), 'distance');
    //    t.end();
    //});
    MoonPosition* moonPos = [SunCalc getMoonPositionDate:date latitude:LAT longitude:LNG];
    XCTAssertEqualWithAccuracy(moonPos.azimuth, -0.9783999522438226, NEARNESS);
    XCTAssertEqualWithAccuracy(moonPos.altitude, 0.006969727754891917, NEARNESS);
    XCTAssertEqualWithAccuracy(moonPos.distance, 364121.37256256194, NEARNESS);
}

- (void)test_getMoonIllumination
{
    //t.test('getMoonIllumination returns fraction and angle of moon\'s illuminated limb and phase', function (t) {
    //    var moonIllum = SunCalc.getMoonIllumination(date);
    //
    //    t.ok(near(moonIllum.fraction, 0.4848068202456373), 'fraction');
    //    t.ok(near(moonIllum.phase, 0.7548368838538762), 'phase');
    //    t.ok(near(moonIllum.angle, 1.6732942678578346), 'angle');
    //    t.end();
    //});
    MoonIllumination* moonIllum = [SunCalc getMoonIllumination:date];
    XCTAssertEqualWithAccuracy(moonIllum.fraction, 0.4848068202456373, NEARNESS);
    XCTAssertEqualWithAccuracy(moonIllum.phase, 0.7548368838538762, NEARNESS);
    XCTAssertEqualWithAccuracy(moonIllum.angle, 1.6732942678578346, NEARNESS);
}

@end

